package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.ContractChange;
import org.hhwy.fweb1.service.ContractChangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class ContractChangeController {
    
	@Autowired
    private ContractChangeService service;
    
    @RequestMapping(value = "/contractchange", method = RequestMethod.GET)
	public @ResponseBody List<ContractChange> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/contractchange/{id}", method = RequestMethod.GET)
	public @ResponseBody ContractChange get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/contractchange/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable ContractChange contractChange) {
		service.insert(contractChange);
		return "OK";
	}
    
	@RequestMapping(value = "/contractchange/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable ContractChange contractChange) {
		service.update(contractChange);
		return "OK";
	}

	@RequestMapping(value = "/contractchange/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

