package org.hhwy.fweb1.controller;

import java.util.List;

import org.apache.shiro.crypto.hash.Sha256Hash;
import org.hhwy.fweb1.core.Utility;
import org.hhwy.fweb1.domain.SysAuthorization;
import org.hhwy.fweb1.domain.SysUser;
import org.hhwy.fweb1.domain.TreeNode;
import org.hhwy.fweb1.service.SysAuthorizationService;
import org.hhwy.fweb1.service.SysResourceService;
import org.hhwy.fweb1.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		return sysResourceService.getRootTreeNode(userId);
	}

	@RequestMapping(value = "/resetall/{password}")
	public @ResponseBody String resetAllPasswords(@PathVariable String password) {
		String str = Utility.EMPTY;
		List<SysUser> list = sysUserService.getAll();
		for (SysUser user : list) {
			sysUserService.update(user);
			str += "RESET PASSWORD:" + user.getLoginName() + "," + user.getRealName() + "\r\n";
		}
		return str;
	}

	@RequestMapping(value = "/reset/{loginName}/{password}")
	public @ResponseBody String reset(@PathVariable String loginName, @PathVariable String password) {
		SysUser user = sysUserService.getByLoginName(loginName);
		sysUserService.update(user);
		return "RESET PASSWORD:" + user + "\r\n";
	}

	@RequestMapping(value = "/resetpassword", method = RequestMethod.POST)
	public @ResponseBody String resetPassword(@RequestParam String id, @RequestParam String password) {
		SysUser user = sysUserService.get(id);
		System.out.println("id=" + id + ",password=" + password);
		user.setPassword(password);
		sysUserService.update(user);
		return "密码重置成功，" + user.getRealName();
	}

	@RequestMapping(value = "/changepassword", method = RequestMethod.POST)
	public @ResponseBody String changePassword(@RequestParam String id, @RequestParam String password0, @RequestParam String password) {
		SysUser user = sysUserService.get(id);
		String hashedPassword = new Sha256Hash(password0, user.getId(), 1).toString();
		if (!hashedPassword.equals(user.getPassword())) {
			return "原密码输入错误，请重新输入。";
		}
		user.setPassword(password);
		sysUserService.update(user);
		return "密码修改成功，" + user.getRealName();
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
