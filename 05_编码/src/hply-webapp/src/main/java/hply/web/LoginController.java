package hply.web;

import hply.service.SysUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin")
public class LoginController {

	@Autowired
	private SysUserService sysUserService;

	// private T3Service t3Service;

	@RequestMapping(value = "/login.html")
	public String loginPage() {
		// for(SysUser user: sysUserService.getAll()){
		// System.out.println(user.toString());
		// }

		System.out.println("sysUserService.getAll().size()="
				+ sysUserService.getAll().size());

		// boolean b = t3Service.hasMatchUser();
		// System.out.println("b=" + b);
		// for (int i = 0; i < 100; i++) {
		// System.out.println(Utility.getRandomUUID());
		// }

		return "login";
	}

}
