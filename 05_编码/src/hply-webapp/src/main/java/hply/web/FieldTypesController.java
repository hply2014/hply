package hply.web;

import hply.Utility;
import hply.domain.FieldTypes;
import hply.service.FieldTypesService;

import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = FieldTypesController.URI)
public class FieldTypesController {

	@Autowired
	private FieldTypesService service;

	public static final String URI = "/fieldtypes";
	public static final String JSP_PAGE_LIST = "fieldtypes-list";
	public static final String JSP_PAGE_DETAIL = "fieldtypes-detail";
	public static final String JSP_PAGE_CREATE = "fieldtypes-create";
	public static final String JSP_PAGE_MODIFY = "fieldtypes-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("page_title", "数据列表");
		model.addAttribute("list", service.getAll());
		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "详情数据");
		model.addAttribute("fieldTypes", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("fieldTypes", new FieldTypes());
		model.addAttribute("page_title", "插入数据");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		model.addAttribute("fieldTypes", service.get(id));
		model.addAttribute("page_title", "修改数据");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid FieldTypes fieldTypes,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(fieldTypes.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.insert(fieldTypes);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("fieldTypes", fieldTypes);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id,
			@Valid FieldTypes fieldTypes, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(fieldTypes.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.update(fieldTypes);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("fieldTypes", fieldTypes);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id,
			RedirectAttributes redirectAttrs) {
		FieldTypes fieldTypes = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("fieldTypes", fieldTypes);
		return "redirect:" + URI;
	}
}
