package org.hhwy.fweb1.restapi;

import java.util.List;

import org.hhwy.fweb1.domain.PartyBilling;
import org.hhwy.fweb1.service.PartyBillingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class PartyBillingRestAPIController {
    
	@Autowired
    private PartyBillingService service;
    
    @RequestMapping(value = "/partybilling", method = RequestMethod.GET)
	public @ResponseBody List<PartyBilling> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/partybilling/{id}", method = RequestMethod.GET)
	public @ResponseBody PartyBilling get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/partybilling/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable PartyBilling partyBilling) {
		service.insert(partyBilling);
		return "OK";
	}
    
	@RequestMapping(value = "/partybilling/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable PartyBilling partyBilling) {
		service.update(partyBilling);
		return "OK";
	}

	@RequestMapping(value = "/partybilling/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

