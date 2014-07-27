package hply.web;

import hply.core.BaseContext;
import hply.domain.SysUser;
import hply.service.SysUserService;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
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
public class HomeController extends BaseContext{
	Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private SysUserService service;

	public static final String JSP_LOGIN = "login";
	public static final String JSP_LOGOUT = "logout";

	@RequestMapping(value = JSP_LOGIN, method = RequestMethod.GET)
	public String login() {
		logger.debug("显示登录页 ...");
		return JSP_LOGIN;
	}

	@RequestMapping(value = JSP_LOGIN, method = RequestMethod.POST)
	public String processLoginSubmit(@RequestParam String loginName, @RequestParam String password, Model model) {
		logger.debug("登录验证 ...");

		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(loginName, password);

		// ”Remember Me” built-in, just do this:
		token.setRememberMe(false);

		try {
			SysUser user = service.getByLoginName(loginName);
			currentUser.getSession().setAttribute(CURRENT_SYS_USER, user);
			currentUser.login(token);
		} catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("loginName", loginName);
			model.addAttribute("message", "登录验证失败，用户或密码错误。");
			return JSP_LOGIN;
		}
		// No problems, show authenticated view…

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
		System.out.println("welcomePage ...");
		model.addAttribute("page_title", "首页");
		return "index";
	}
	

	@RequestMapping(value = "password", method = RequestMethod.GET)
	public String changePassword() {
		System.out.println("changePassword ...");
		BaseContext.getCurrentUser().logout();
		return "change-password";
	}

	@RequestMapping(value = "tree")
	public String treePage() {
		System.out.println("treePage ...");
		return "sample-fancytree";
	}
}
