package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.FieldTypes;
import org.hhwy.fweb1.service.FieldTypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class FieldTypesController {
    
	@Autowired
    private FieldTypesService service;
    
    @RequestMapping(value = "/fieldtypes", method = RequestMethod.GET)
	public @ResponseBody List<FieldTypes> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/fieldtypes/{id}", method = RequestMethod.GET)
	public @ResponseBody FieldTypes get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/fieldtypes/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable FieldTypes fieldTypes) {
		service.insert(fieldTypes);
		return "OK";
	}
    
	@RequestMapping(value = "/fieldtypes/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable FieldTypes fieldTypes) {
		service.update(fieldTypes);
		return "OK";
	}

	@RequestMapping(value = "/fieldtypes/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

