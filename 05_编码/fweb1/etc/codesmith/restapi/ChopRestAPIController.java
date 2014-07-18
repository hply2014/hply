package org.hhwy.fweb1.restapi;

import java.util.List;

import org.hhwy.fweb1.domain.Chop;
import org.hhwy.fweb1.service.ChopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class ChopRestAPIController {
    
	@Autowired
    private ChopService service;
    
    @RequestMapping(value = "/chop", method = RequestMethod.GET)
	public @ResponseBody List<Chop> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/chop/{id}", method = RequestMethod.GET)
	public @ResponseBody Chop get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/chop/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable Chop chop) {
		service.insert(chop);
		return "OK";
	}
    
	@RequestMapping(value = "/chop/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable Chop chop) {
		service.update(chop);
		return "OK";
	}

	@RequestMapping(value = "/chop/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

