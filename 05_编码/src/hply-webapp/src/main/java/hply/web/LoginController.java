package hply.web;

import hply.service.T3Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin")
public class LoginController {

	@Autowired
	private T3Service t3Service;

	@RequestMapping(value = "/login.html")
	public String loginPage() {
		boolean b = t3Service.hasMatchUser();
		System.out.println("b=" + b);
		return "login";
	}

}
