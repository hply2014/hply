package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.Information;
import org.hhwy.fweb1.service.InformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class InformationController {
    
	@Autowired
    private InformationService service;
    
    @RequestMapping(value = "/information", method = RequestMethod.GET)
	public @ResponseBody List<Information> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/information/{id}", method = RequestMethod.GET)
	public @ResponseBody Information get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/information/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable Information information) {
		service.insert(information);
		return "OK";
	}
    
	@RequestMapping(value = "/information/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable Information information) {
		service.update(information);
		return "OK";
	}

	@RequestMapping(value = "/information/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

