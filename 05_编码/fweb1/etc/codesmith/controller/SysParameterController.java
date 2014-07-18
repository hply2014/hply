package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.SysParameter;
import org.hhwy.fweb1.service.SysParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class SysParameterController {
    
	@Autowired
    private SysParameterService service;
    
    @RequestMapping(value = "/sysparameter", method = RequestMethod.GET)
	public @ResponseBody List<SysParameter> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/sysparameter/{id}", method = RequestMethod.GET)
	public @ResponseBody SysParameter get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/sysparameter/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable SysParameter sysParameter) {
		service.insert(sysParameter);
		return "OK";
	}
    
	@RequestMapping(value = "/sysparameter/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable SysParameter sysParameter) {
		service.update(sysParameter);
		return "OK";
	}

	@RequestMapping(value = "/sysparameter/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

