package org.hhwy.fweb1.controller;

import org.hhwy.fweb1.Utility;
import org.hhwy.fweb1.domain.FieldTypes;
import org.hhwy.fweb1.service.FieldTypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/fieldtypes")
public class FieldTypesController {

	@Autowired
	private FieldTypesService service;

	// @ModelAttribute("fieldTypes")
	// public FieldTypes getFieldTypes() {
	// Utility.println("getFieldTypes ...");
	// FieldTypes f = new FieldTypes();
	// Utility.println(f.toString());
	// return f;
	// }

	@RequestMapping(params = "create", method = RequestMethod.GET)
	public String create(@ModelAttribute("fieldTypes") FieldTypes fieldTypes,
			Model model) {
		Utility.println("in create ...");
		// fieldTypes = new FieldTypes();
		fieldTypes.setFieldT01("测试一下子");
//		model.addAttribute("id", fieldTypes.getId());
		model.addAttribute("title", "创建");
		return "fieldtypes-create";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String modify(@PathVariable String id,
			@ModelAttribute("fieldTypes") FieldTypes fieldTypes, Model model) {
		Utility.println("in modify ...");
		fieldTypes = service.get(id);
		// fieldTypes.setFieldT01(f.getFieldT01());
		// fieldTypes.setFieldT02(f.getFieldT02());
		Utility.println(fieldTypes.toString());
		model.addAttribute("fieldTypes", fieldTypes);
		model.addAttribute("title", "修改");
		return "fieldtypes-create";
	}
}
