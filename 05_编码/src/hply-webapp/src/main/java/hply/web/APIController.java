package hply.web;

import hply.core.Utility;
import hply.domain.SysUser;
import hply.domain.TreeNode;
import hply.service.SysResourceService;
import hply.service.SysUserService;

import java.util.List;

import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class APIController {

	@Autowired
	private SysResourceService sysResourceService;

	@Autowired
	private SysUserService sysUserService;

	@RequestMapping(value = "/tree/{userId}")
	public @ResponseBody TreeNode getTreeData(@PathVariable String userId) {
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

}
