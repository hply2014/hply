package org.hhwy.fweb1.restapi;

import java.util.List;

import javax.validation.Valid;

import org.hhwy.fweb1.Utility;
import org.hhwy.fweb1.domain.FieldTypes;
import org.hhwy.fweb1.service.FieldTypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class FieldTypesRestAPIController {
    
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
	public @ResponseBody String put(FieldTypes fieldTypes) {
		service.insert(fieldTypes);
		return "OK";
	}
    
	@RequestMapping(value="/fieldtypes", method = RequestMethod.POST)
	public @ResponseBody String post(FieldTypes fieldTypes) {
		Utility.println("正在插入...");
		Utility.println(fieldTypes.toString());
		service.insert(fieldTypes);
		return "插入成功了的数据";
	}

	@RequestMapping(value = "/fieldtypes/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

