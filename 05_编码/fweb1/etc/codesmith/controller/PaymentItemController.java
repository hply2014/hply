package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.PaymentItem;
import org.hhwy.fweb1.service.PaymentItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class PaymentItemController {
    
	@Autowired
    private PaymentItemService service;
    
    @RequestMapping(value = "/paymentitem", method = RequestMethod.GET)
	public @ResponseBody List<PaymentItem> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/paymentitem/{id}", method = RequestMethod.GET)
	public @ResponseBody PaymentItem get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/paymentitem/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable PaymentItem paymentItem) {
		service.insert(paymentItem);
		return "OK";
	}
    
	@RequestMapping(value = "/paymentitem/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable PaymentItem paymentItem) {
		service.update(paymentItem);
		return "OK";
	}

	@RequestMapping(value = "/paymentitem/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

