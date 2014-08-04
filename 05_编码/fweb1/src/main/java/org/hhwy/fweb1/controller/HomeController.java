package org.hhwy.fweb1.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.hhwy.fweb1.core.SessionHelper;
import org.hhwy.fweb1.core.Utility;
import org.hhwy.fweb1.domain.SysUser;
import org.hhwy.fweb1.service.SysResourceService;
import org.hhwy.fweb1.service.SysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/")
public class HomeController {
	Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private SysUserService service;

	@Autowired
	private SysResourceService sysResourceService;

	public static final String JSP_LOGIN = "login";
	public static final String JSP_LOGOUT = "logout";

	@RequestMapping(value = JSP_LOGIN, method = RequestMethod.GET)
	public String showLogin() {
		logger.debug("显示登录页 ...");
		return JSP_LOGIN;
	}

	@RequestMapping(value = JSP_LOGIN, method = RequestMethod.POST)
	public String processLoginSubmit(HttpServletRequest request, @RequestParam String loginName, @RequestParam String password, Model model) {
		logger.debug("登录验证 ...");
		SysUser user = service.getByLoginName(loginName);
		if (user == null) {
			model.addAttribute("loginName", loginName);
			model.addAttribute("message", "登陆用户不存在。");
			return JSP_LOGIN;
		}

		try {
			SessionHelper.setAttribute(SessionHelper.CURRENT_SYS_USER, user);
			SessionHelper.login(loginName, password);
		} catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("loginName", loginName);
			model.addAttribute("message", "登录验证失败，用户或密码错误。");
			return JSP_LOGIN;
		}
		// No problems, show authenticated view…
		SessionHelper.setAttribute(SessionHelper.CURRENT_ROOT_TREE_NODE, sysResourceService.getMenuRoot(user.getId()));
		user.setLastLoginIp(Utility.getClientIpAddress(request));
		user.setLastLoginTime(new Date());
		user.setLogined(user.getLogined() + 1);
		user.setFails(0);
		user.setPassword(null);
		service.update(user);

		return "redirect:/";
	}

	@RequestMapping(value = JSP_LOGOUT)
	public String logoutPage() {
		System.out.println("logoutPage ...");
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return JSP_LOGOUT;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("page_title", "首页");
		return "index";
	}

	@RequestMapping(value = "password", method = RequestMethod.GET)
	public String changePassword(Model model) {
		SysUser currentUser = SessionHelper.getCurrentSysUser();
		System.out.println("changePassword ...");
		model.addAttribute("page_title", "修改" + currentUser.getRealName() + "的密码");
		model.addAttribute("userId", currentUser.getId());
		return "change-password";
	}
}
