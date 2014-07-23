package org.hhwy.fweb1.controller;

import javax.validation.Valid;

import org.hhwy.fweb1.Utility;
import org.hhwy.fweb1.domain.FieldTypes;
import org.hhwy.fweb1.service.FieldTypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/fieldtypes")
public class FieldTypesController {
	// , produces = "application/json;charset=UTF-8"

	@Autowired
	private FieldTypesService service;

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list", service.getAll());
		return "fieldtypes-list";
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		Utility.println("detail ...");
		model.addAttribute("fieldTypes", service.get(id));
		return "fieldtypes-detail";
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String formCreate(Model model) {
		model.addAttribute("fieldTypes", new FieldTypes());
		return "fieldtypes-create";
	}

	/*
	 * 新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid FieldTypes fieldTypes,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			return null;
		}
		Utility.println(fieldTypes.toString());
		service.insert(fieldTypes);
		return "redirect:/fieldtypes";
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String formModify(@PathVariable String id, Model model) {
		model.addAttribute("fieldTypes", service.get(id));
		return "fieldtypes-modify";
	}

	/*
	 * 修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processModifySubmit(@Valid FieldTypes fieldTypes,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			return "fieldtypes-modify";
		}
		Utility.println(fieldTypes.toString());
		service.update(fieldTypes);
		return "redirect:/fieldtypes";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processSubmit(@Valid FieldTypes fieldTypes,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			return null;
		}
		// Typically you would save to a db and clear the "form" attribute from
		// the session
		// via SessionStatus.setCompleted(). For the demo we leave it in the
		// session.
		String message = "Form submitted successfully.  Bound " + fieldTypes;
		// store a success message for rendering on the next request after
		// redirect
		// redirect back to the form to render the success message along with
		// newly bound values
		redirectAttrs.addFlashAttribute("message", message);
		return "redirect:/";
	}
}
