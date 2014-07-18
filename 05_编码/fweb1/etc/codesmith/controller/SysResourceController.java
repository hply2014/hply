package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.SysResource;
import org.hhwy.fweb1.service.SysResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class SysResourceController {
    
	@Autowired
    private SysResourceService service;
    
    @RequestMapping(value = "/sysresource", method = RequestMethod.GET)
	public @ResponseBody List<SysResource> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/sysresource/{id}", method = RequestMethod.GET)
	public @ResponseBody SysResource get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/sysresource/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable SysResource sysResource) {
		service.insert(sysResource);
		return "OK";
	}
    
	@RequestMapping(value = "/sysresource/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable SysResource sysResource) {
		service.update(sysResource);
		return "OK";
	}

	@RequestMapping(value = "/sysresource/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

