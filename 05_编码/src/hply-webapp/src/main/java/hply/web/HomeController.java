package hply.web;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping(value = "/")
public class HomeController extends BaseController {
	Logger logger = LoggerFactory.getLogger(HomeController.class);

	public static final String JSP_LOGIN = "login";
	public static final String JSP_LOGOUT = "logout";

	@RequestMapping(value = JSP_LOGIN, method = RequestMethod.GET)
	public String showLogin() {
		logger.debug("显示登录页 ...");
		return JSP_LOGIN;
	}

	@RequestMapping(value = JSP_LOGIN, method = RequestMethod.POST)
	public String processLoginSubmit(@RequestParam String loginName,
			@RequestParam String password, Model model) {
		logger.debug("登录验证 ...");

		try {
			BaseController.login(loginName, password);
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
		return "change-password";
	}

	@RequestMapping(value = "tree")
	public String treePage() {
		System.out.println("treePage ...");
		return "sample-fancytree";
	}
}
