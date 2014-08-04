package hply.web;


import hply.core.Utility;
import hply.domain.ProjectSummary;
import hply.service.ProjectSummaryService;

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
@RequestMapping(value = ProjectSummaryController.URI)
public class ProjectSummaryController {
    
	@Autowired
    private ProjectSummaryService service;

	public static final String URI = "/projectsummary";
	public static final String JSP_PAGE_LIST = "projectsummary-list";
	public static final String JSP_PAGE_DETAIL = "projectsummary-detail";
	public static final String JSP_PAGE_MODIFY = "projectsummary-modify";
    
    
	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("page_title", "多项目汇总");
		model.addAttribute("list", service.getAll());
		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "多项目汇总的详情信息");
		model.addAttribute("projectSummary", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("projectSummary", new ProjectSummary());
		model.addAttribute("page_title", "新建多项目汇总");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		model.addAttribute("projectSummary", service.get(id));
		model.addAttribute("page_title", "修改多项目汇总");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid ProjectSummary projectSummary,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(projectSummary.toString());
		
		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.insert(projectSummary);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("projectSummary", projectSummary);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id,
			@Valid ProjectSummary projectSummary, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(projectSummary.toString());
		
		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.update(projectSummary);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("projectSummary", projectSummary);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id,
			RedirectAttributes redirectAttrs) {
		ProjectSummary projectSummary = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("projectSummary", projectSummary);
		return "redirect:" + URI;
	}
}

