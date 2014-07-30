package hply.web;

import hply.core.Utility;
import hply.domain.SysAuthorization;
import hply.domain.SysUser;
import hply.domain.TreeNode;
import hply.service.SysAuthorizationService;
import hply.service.SysResourceService;
import hply.service.SysUserService;

import java.util.List;

import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class APIController {

	@Autowired
	private SysResourceService sysResourceService;

	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysAuthorizationService sysAuthorizationService;

	@RequestMapping(value = "/tree/{userId}")
	public @ResponseBody TreeNode getTreeNode(@PathVariable String userId) {
		System.out.println("getTreeData ..." + userId);
		return sysResourceService.getTreeRoot(userId);
	}

	@RequestMapping(value = "/resetall/{password}")
	public @ResponseBody String resetAllPasswords(@PathVariable String password) {
		String str = Utility.EMPTY;
		List<SysUser> list = sysUserService.getAll();
		for (SysUser user : list) {
			String hashedPassword = new Sha256Hash(password, user.getId(), 1).toString();
			user.setPassword(hashedPassword);
			sysUserService.update(user);
			str += "RESET PASSWORD:" + user.getLoginName() + "," + user.getRealName() + "\r\n";
		}
		return str;
	}

	@RequestMapping(value = "/reset/{loginName}/{password}")
	public @ResponseBody String resetPassword(@PathVariable String loginName, @PathVariable String password) {
		SysUser user = sysUserService.getByLoginName(loginName);
		String hashedPassword = new Sha256Hash(password, user.getId(), 1).toString();
		user.setPassword(hashedPassword);
		sysUserService.update(user);
		return "RESET PASSWORD:" + user + "\r\n";
	}

	@RequestMapping(value = "/auth/{userId}/{resourceId}", method = RequestMethod.POST)
	public @ResponseBody String authorization(@PathVariable String userId, @PathVariable String resourceId) {
		// TODO 删除授权还没有实现，根据userId和ResoourceId获取对象，Mybatis的多个参数
		SysAuthorization auth = sysAuthorizationService.getByUserIdAndResource(userId, resourceId);
		if (auth != null) {
			sysAuthorizationService.delete(auth.getId());
			return "授权取消，执行成功";
		} else {
			SysAuthorization sysAuthorization = new SysAuthorization();
			sysAuthorization.setUserId(userId);
			sysAuthorization.setResourceId(resourceId);
			sysAuthorizationService.insert(sysAuthorization);
		}
		return "授权设置，执行成功";
	}

}
