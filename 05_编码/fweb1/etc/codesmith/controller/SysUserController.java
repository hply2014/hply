package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.SysUser;
import org.hhwy.fweb1.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class SysUserController {
    
	@Autowired
    private SysUserService service;
    
    @RequestMapping(value = "/sysuser", method = RequestMethod.GET)
	public @ResponseBody List<SysUser> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/sysuser/{id}", method = RequestMethod.GET)
	public @ResponseBody SysUser get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/sysuser/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable SysUser sysUser) {
		service.insert(sysUser);
		return "OK";
	}
    
	@RequestMapping(value = "/sysuser/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable SysUser sysUser) {
		service.update(sysUser);
		return "OK";
	}

	@RequestMapping(value = "/sysuser/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

