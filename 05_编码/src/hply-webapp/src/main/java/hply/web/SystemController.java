package hply.web;

import hply.domain.Project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class SystemController {
	@RequestMapping(value = "login")
	public String loginPage() {
		System.out.println("loginPage ...");
		return "login";
	}

	@RequestMapping(value = "logout")
	public String logoutPage() {
		System.out.println("logoutPage ...");
		return "logout";
	}

	@RequestMapping(value = "index.html")
	public String welcomePage() {
		System.out.println("welcomePage ...");
		return "index";
	}


	public String defaultPage() {
		System.out.println("defaultPage ...");
		return welcomePage();
	}

	@RequestMapping(value = "tree")
	public String treePage() {
		System.out.println("treePage ...");
		return "sample-fancytree";
	}

}
