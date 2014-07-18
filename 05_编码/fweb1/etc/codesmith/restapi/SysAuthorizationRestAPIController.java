package org.hhwy.fweb1.restapi;

import java.util.List;

import org.hhwy.fweb1.domain.SysAuthorization;
import org.hhwy.fweb1.service.SysAuthorizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class SysAuthorizationRestAPIController {
    
	@Autowired
    private SysAuthorizationService service;
    
    @RequestMapping(value = "/sysauthorization", method = RequestMethod.GET)
	public @ResponseBody List<SysAuthorization> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/sysauthorization/{id}", method = RequestMethod.GET)
	public @ResponseBody SysAuthorization get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/sysauthorization/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable SysAuthorization sysAuthorization) {
		service.insert(sysAuthorization);
		return "OK";
	}
    
	@RequestMapping(value = "/sysauthorization/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable SysAuthorization sysAuthorization) {
		service.update(sysAuthorization);
		return "OK";
	}

	@RequestMapping(value = "/sysauthorization/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

