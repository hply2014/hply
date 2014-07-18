package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.CustomerBilling;
import org.hhwy.fweb1.service.CustomerBillingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class CustomerBillingController {
    
	@Autowired
    private CustomerBillingService service;
    
    @RequestMapping(value = "/customerbilling", method = RequestMethod.GET)
	public @ResponseBody List<CustomerBilling> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/customerbilling/{id}", method = RequestMethod.GET)
	public @ResponseBody CustomerBilling get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/customerbilling/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable CustomerBilling customerBilling) {
		service.insert(customerBilling);
		return "OK";
	}
    
	@RequestMapping(value = "/customerbilling/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable CustomerBilling customerBilling) {
		service.update(customerBilling);
		return "OK";
	}

	@RequestMapping(value = "/customerbilling/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

