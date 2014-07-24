package hply.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

	@RequestMapping(value = "/t")
	public String defaultPage() {
		return "fieldtypes";
	}
}
