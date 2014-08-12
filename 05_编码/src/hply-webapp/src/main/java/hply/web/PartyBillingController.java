﻿package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.PartyBilling;
import hply.domain.Project;
import hply.domain.SysUser;
import hply.service.PartyBillingService;
import hply.service.ProjectService;
import hply.service.SysParameterService;
import hply.service.SysUserService;

import java.util.Date;
import java.util.List;

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
@RequestMapping(value = PartyBillingController.URI)
public class PartyBillingController {

	@Autowired
	private PartyBillingService service;

	@Autowired
	private ProjectService projectService;

	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysParameterService paramService;

	public static final String URI = "/partybilling";
	public static final String JSP_PAGE_LIST = "partybilling-list";
	public static final String JSP_PAGE_DETAIL = "partybilling-detail";
	public static final String JSP_PAGE_MODIFY = "partybilling-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("page_title", "甲方开票情况");

		List<PartyBilling> list = service.getAll();
		for (PartyBilling item : list) {
			Project pjt = projectService.get(item.getProjectId());
			item.setProjectId(pjt != null ? "[" + pjt.getProjectCode() + "]" + pjt.getProjectName() : Utility.EMPTY);

			SysUser user = sysUserService.get(item.getCreateUser());
			item.setCreateUser(user != null ? user.getRealName() : Utility.EMPTY);
			
			SysUser user1 = sysUserService.get(item.getStep1User());
			item.setStep1User(user1 != null ? user.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("list", list);

		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "甲方开票情况的详情信息");
		model.addAttribute("partyBilling", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		PartyBilling paryBilling = new PartyBilling();
		paryBilling.setTaxRate(paramService.getParamDoubleValue("default_tax_rate"));
		
		model.addAttribute("partyBilling", paryBilling);
		model.addAttribute("page_title", "新建甲方开票情况");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		model.addAttribute("partyBilling", service.get(id));
		model.addAttribute("page_title", "修改甲方开票情况");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 审核页面
	 */
	@RequestMapping(value = "/step1/{id}", method = RequestMethod.GET)
	public String step1Form(@PathVariable String id, Model model) {
		PartyBilling pb = service.get(id);
		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		String pn = Utility.EMPTY;
		for (Project p : projectlist) {
			if (p.getId().equals(pb.getProjectId())) {
				pn = p.getProjectName();
			}
		}
		model.addAttribute("newProjectName", pn);
		model.addAttribute("partyBilling", pb);
		model.addAttribute("page_title", "审核甲方开票情况");
		model.addAttribute("step1", 1);
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid PartyBilling partyBilling, BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(partyBilling.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.insert(partyBilling);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("partyBilling", partyBilling);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid PartyBilling partyBilling, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(partyBilling.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.update(partyBilling);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("partyBilling", partyBilling);
		return "redirect:" + URI;
	}


	/*
	 * 处理审核页面的提交动作
	 */
	@RequestMapping(value = "/step1/{id}", method = RequestMethod.POST)
	public String processCheckSubmit(@PathVariable String id, @Valid PartyBilling partyBilling, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(partyBilling.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}
		
		PartyBilling pb = service.get(id);
		pb.setStepStatus(partyBilling.getStepStatus());
		pb.setStep1Idea(partyBilling.getStep1Idea());
		pb.setStep1User(SessionHelper.getCurrentUserId());
		pb.setStep1Time(new Date());
		pb.setDescription(partyBilling.getDescription());

		service.update(pb);
		redirectAttrs.addFlashAttribute("message", "审核成功");

		redirectAttrs.addFlashAttribute("partyBilling", pb);
		return "redirect:" + URI;
	}
	
	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		PartyBilling partyBilling = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("partyBilling", partyBilling);
		return "redirect:" + URI;
	}
}
