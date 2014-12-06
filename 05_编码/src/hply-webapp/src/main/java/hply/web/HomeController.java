package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.SysOrganization;
import hply.domain.SysUser;
import hply.service.ProjectService;
import hply.service.SysOrganizationService;
import hply.service.SysResourceService;
import hply.service.SysUserService;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
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

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private SysOrganizationService sysOrganizationService;

	public static final String JSP_LOGIN = "login";
	public static final String JSP_LOGOUT = "logout";

	@RequestMapping(value = JSP_LOGIN, method = RequestMethod.GET)
	public String showLogin() {
		SessionHelper.sysResourceService = sysResourceService;
		return JSP_LOGIN;
	}

	@RequestMapping(value = JSP_LOGIN, method = RequestMethod.POST)
	public String processLoginSubmit(HttpServletRequest request, @RequestParam String loginName,
			@RequestParam String password, Model model) {
		logger.debug("登录验证 ...");
		SysUser user = service.getByLoginName(loginName);
		if (user == null) {
			model.addAttribute("loginName", loginName);
			model.addAttribute("message", "该用户不存在。");
			return JSP_LOGIN;
		}

		try {
			SessionHelper.setAttribute(SessionHelper.CURRENT_SYS_USER, user);
			SessionHelper.login(user.getId(), password);
		} catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("loginName", loginName);
			model.addAttribute("message", "登录验证失败，用户或密码错误。");
			return JSP_LOGIN;
		}

		// No problems, show authenticated view…

		// 如果账号被禁用
		if (user.getEnabled() == false) {
			model.addAttribute("loginName", loginName);
			model.addAttribute("message", "该用户已被禁用，请联系管理员。");
			return JSP_LOGIN;

		}

		if (user.getMustChangePassword()) {
			model.addAttribute("page_title", "修改" + user.getRealName() + "的密码");
			model.addAttribute("userId", user.getId());
			return "change-password";
		}

		// 登录成功
		// SessionHelper.setAttribute(SessionHelper.CURRENT_ROOT_TREE_NODE,
		// sysResourceService.getMenuRoot(user.getId()));
		user.setLastLoginIp(Utility.getClientIpAddress(request));
		user.setLastLoginTime(new Date());
		int logined = user.getLogined() == null ? 0 : user.getLogined().intValue();
		user.setLogined(logined + 1);
		user.setFails(0);
		service.update(user);
		
		//将当前登录用户的所在部门存到Session中，用于业务部门的数据过滤，比如事业部只显示事业部的数据
		SysOrganization currentOrg = sysOrganizationService.get(user.getOrganizationId());
		SessionHelper.setAttribute(SessionHelper.CURRENT_ORGANIZATION, currentOrg);
		

		// 刷新所有业务数据状态
		projectService.updateAllStatus();
		return "redirect:/";
	}

	@RequestMapping(value = JSP_LOGOUT)
	public String logoutPage() {
		Utility.println("logoutPage ...");
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return JSP_LOGOUT;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String home(Model model) {
		Utility.println("welcomePage ...");
		model.addAttribute("page_title", "首页");
		return "index";
	}

	@RequestMapping(value = "password", method = RequestMethod.GET)
	public String changePassword(Model model) {
		SysUser currentUser = SessionHelper.getCurrentSysUser();
		Utility.println("changePassword ...");
		model.addAttribute("page_title", "修改" + currentUser.getRealName() + "的密码");
		model.addAttribute("userId", currentUser.getId());
		return "change-password";
	}
}
