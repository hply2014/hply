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

	@RequestMapping(value = "")
	public String defaultPage() {
		System.out.println("defaultPage ...");
		return welcomePage();
	}

	@RequestMapping(value = "tree")
	public String treePage() {
		System.out.println("treePage ...");
		return "sample-fancytree";
	}

	@RequestMapping(value = "projectadd")
	public String projectPage() {
		System.out.println("projectPage ...");
		return "project-add";
	}

	@RequestMapping(value = "project/save")
	public String projectSavePage(@ModelAttribute("form") Project project,
			Model model, BindingResult result) {
		System.out.println("projectSavePage ...");
		System.out.println("project code=" + project.getProjectcode());
		System.out.println("project name=" + project.getProjectname());
		return "project-add";
	}

}
