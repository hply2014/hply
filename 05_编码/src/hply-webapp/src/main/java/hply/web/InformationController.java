﻿package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.Information;
import hply.domain.SysOrganization;
import hply.domain.SysUser;
import hply.service.InformationService;
import hply.service.SysOrganizationService;
import hply.service.SysParameterService;
import hply.service.SysUserService;

import java.util.List;

import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = InformationController.URI)
public class InformationController {

	@Autowired
	private InformationService service;

	@Autowired
	private SysOrganizationService orgService;

	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysParameterService paramService;
	public static final String URI = "/information";
	public static final String JSP_PAGE_LIST = "information-list";
	public static final String JSP_PAGE_DETAIL = "information-detail";
	public static final String JSP_PAGE_MODIFY = "information-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "p", required = false) Integer p, @RequestParam(value = "q", required = false) String q,
			Model model) {
		model.addAttribute("page_title", "信息登记");

		int pageIndex = p != null ? p.intValue() : 0;
		String queryText = StringUtils.isBlank(q) ? "%" : "%" + q.replaceAll(" ", "%") + "%";
		
		int pageSize = paramService.getParamIntValue("page_size", 30);
		int rowCount = service.getRowCount(queryText);
		int pageCount = rowCount / pageSize + (rowCount % pageSize == 0 ? 0 : 1);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPageStarted", pageIndex * pageSize);
		List<Information> list = service.getAllPaged(queryText, pageIndex * pageSize, pageSize);
		for (Information item : list) {
			SysOrganization org = orgService.get(item.getOrganizationId());
			item.setOrganizationId(org != null ? org.getOrganizationName() : Utility.EMPTY);

			SysUser user = sysUserService.get(item.getUpdateUser());
			item.setUpdateUser(user != null ? user.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("list", list);

		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "信息登记的详情信息");
		model.addAttribute("information", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("information", new Information());
		model.addAttribute("orglist", orgService.getAll());
		model.addAttribute("page_title", "新建信息登记");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		model.addAttribute("information", service.get(id));
		model.addAttribute("orglist", orgService.getAll());
		model.addAttribute("page_title", "修改信息登记");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid Information information, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(information.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.insert(information);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("information", information);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid Information information, BindingResult result,
			Model model, RedirectAttributes redirectAttrs) {
		Utility.println(information.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.update(information);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("information", information);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		Information information = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("information", information);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}
}
