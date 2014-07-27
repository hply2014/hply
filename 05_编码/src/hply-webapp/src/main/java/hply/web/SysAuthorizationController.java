package hply.web;


import hply.core.Utility;
import hply.domain.SysAuthorization;
import hply.service.SysAuthorizationService;

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
@RequestMapping(value = SysAuthorizationController.URI)
public class SysAuthorizationController {
    
	@Autowired
    private SysAuthorizationService service;

	public static final String URI = "/sysauthorization";
	public static final String JSP_PAGE_LIST = "sysauthorization-list";
	public static final String JSP_PAGE_DETAIL = "sysauthorization-detail";
	public static final String JSP_PAGE_MODIFY = "sysauthorization-modify";
    
    
	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("page_title", "授权关系");
		model.addAttribute("list", service.getAll());
		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "授权关系的详情信息");
		model.addAttribute("sysAuthorization", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("sysAuthorization", new SysAuthorization());
		model.addAttribute("page_title", "新建授权关系");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		model.addAttribute("sysAuthorization", service.get(id));
		model.addAttribute("page_title", "修改授权关系");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid SysAuthorization sysAuthorization,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(sysAuthorization.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.insert(sysAuthorization);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("sysAuthorization", sysAuthorization);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id,
			@Valid SysAuthorization sysAuthorization, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(sysAuthorization.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.update(sysAuthorization);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("sysAuthorization", sysAuthorization);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id,
			RedirectAttributes redirectAttrs) {
		SysAuthorization sysAuthorization = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("sysAuthorization", sysAuthorization);
		return "redirect:" + URI;
	}
}

