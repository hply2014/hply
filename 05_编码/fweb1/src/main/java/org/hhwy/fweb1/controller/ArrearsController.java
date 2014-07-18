package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.Arrears;
import org.hhwy.fweb1.service.ArrearsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class ArrearsController {
    
	@Autowired
    private ArrearsService service;
    
    @RequestMapping(value = "/arrears", method = RequestMethod.GET)
	public @ResponseBody List<Arrears> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/arrears/{id}", method = RequestMethod.GET)
	public @ResponseBody Arrears get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/arrears/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable Arrears arrears) {
		service.insert(arrears);
		return "OK";
	}
    
	@RequestMapping(value = "/arrears/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable Arrears arrears) {
		service.update(arrears);
		return "OK";
	}

	@RequestMapping(value = "/arrears/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

