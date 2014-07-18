package org.hhwy.fweb1.restapi;

import java.util.List;

import org.hhwy.fweb1.domain.SysOrganization;
import org.hhwy.fweb1.service.SysOrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class SysOrganizationRestAPIController {
    
	@Autowired
    private SysOrganizationService service;
    
    @RequestMapping(value = "/sysorganization", method = RequestMethod.GET)
	public @ResponseBody List<SysOrganization> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/sysorganization/{id}", method = RequestMethod.GET)
	public @ResponseBody SysOrganization get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/sysorganization/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable SysOrganization sysOrganization) {
		service.insert(sysOrganization);
		return "OK";
	}
    
	@RequestMapping(value = "/sysorganization/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable SysOrganization sysOrganization) {
		service.update(sysOrganization);
		return "OK";
	}

	@RequestMapping(value = "/sysorganization/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

