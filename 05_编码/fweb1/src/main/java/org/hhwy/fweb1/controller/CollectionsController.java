package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.Collections;
import org.hhwy.fweb1.service.CollectionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class CollectionsController {
    
	@Autowired
    private CollectionsService service;
    
    @RequestMapping(value = "/collections", method = RequestMethod.GET)
	public @ResponseBody List<Collections> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/collections/{id}", method = RequestMethod.GET)
	public @ResponseBody Collections get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/collections/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable Collections collections) {
		service.insert(collections);
		return "OK";
	}
    
	@RequestMapping(value = "/collections/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable Collections collections) {
		service.update(collections);
		return "OK";
	}

	@RequestMapping(value = "/collections/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

