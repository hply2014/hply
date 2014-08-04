package org.hhwy.fweb1.controller;


import org.hhwy.fweb1.core.Utility;
import org.hhwy.fweb1.domain.SysRoleUser;
import org.hhwy.fweb1.service.SysRoleUserService;

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
@RequestMapping(value = SysRoleUserController.URI)
public class SysRoleUserController {
    
	@Autowired
    private SysRoleUserService service;

	public static final String URI = "/sysroleuser";
	public static final String JSP_PAGE_LIST = "sysroleuser-list";
	public static final String JSP_PAGE_DETAIL = "sysroleuser-detail";
	public static final String JSP_PAGE_MODIFY = "sysroleuser-modify";
    
    
	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("page_title", "角色与用户的对应表，多对多");
		model.addAttribute("list", service.getAll());
		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "角色与用户的对应表，多对多的详情信息");
		model.addAttribute("sysRoleUser", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("sysRoleUser", new SysRoleUser());
		model.addAttribute("page_title", "新建角色与用户的对应表，多对多");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		model.addAttribute("sysRoleUser", service.get(id));
		model.addAttribute("page_title", "修改角色与用户的对应表，多对多");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid SysRoleUser sysRoleUser,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(sysRoleUser.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.insert(sysRoleUser);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("sysRoleUser", sysRoleUser);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id,
			@Valid SysRoleUser sysRoleUser, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(sysRoleUser.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.update(sysRoleUser);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("sysRoleUser", sysRoleUser);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id,
			RedirectAttributes redirectAttrs) {
		SysRoleUser sysRoleUser = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("sysRoleUser", sysRoleUser);
		return "redirect:" + URI;
	}
}

