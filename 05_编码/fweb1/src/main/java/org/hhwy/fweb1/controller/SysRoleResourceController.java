package org.hhwy.fweb1.controller;


import org.hhwy.fweb1.core.Utility;
import org.hhwy.fweb1.domain.SysRoleResource;
import org.hhwy.fweb1.service.SysRoleResourceService;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = SysRoleResourceController.URI)
public class SysRoleResourceController {
    
	@Autowired
    private SysRoleResourceService service;

	public static final String URI = "/sysroleresource";
	public static final String JSP_PAGE_LIST = "sysroleresource-list";
	public static final String JSP_PAGE_DETAIL = "sysroleresource-detail";
	public static final String JSP_PAGE_MODIFY = "sysroleresource-modify";
    
    
	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("page_title", "角色与资源的对应表");
		model.addAttribute("list", service.getAll());
		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "角色与资源的对应表的详情信息");
		model.addAttribute("sysRoleResource", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("sysRoleResource", new SysRoleResource());
		model.addAttribute("page_title", "新建角色与资源的对应表");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		model.addAttribute("sysRoleResource", service.get(id));
		model.addAttribute("page_title", "修改角色与资源的对应表");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid SysRoleResource sysRoleResource,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(sysRoleResource.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.insert(sysRoleResource);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("sysRoleResource", sysRoleResource);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id,
			@Valid SysRoleResource sysRoleResource, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(sysRoleResource.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.update(sysRoleResource);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("sysRoleResource", sysRoleResource);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id,
			RedirectAttributes redirectAttrs) {
		SysRoleResource sysRoleResource = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("sysRoleResource", sysRoleResource);
		return "redirect:" + URI;
	}
}

