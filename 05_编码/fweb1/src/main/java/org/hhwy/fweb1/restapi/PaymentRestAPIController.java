package org.hhwy.fweb1.restapi;

import java.util.List;

import org.hhwy.fweb1.domain.Payment;
import org.hhwy.fweb1.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class PaymentRestAPIController {
    
	@Autowired
    private PaymentService service;
    
    @RequestMapping(value = "/payment", method = RequestMethod.GET)
	public @ResponseBody List<Payment> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/payment/{id}", method = RequestMethod.GET)
	public @ResponseBody Payment get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/payment/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable Payment payment) {
		service.insert(payment);
		return "OK";
	}
    
	@RequestMapping(value = "/payment/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable Payment payment) {
		service.update(payment);
		return "OK";
	}

	@RequestMapping(value = "/payment/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

