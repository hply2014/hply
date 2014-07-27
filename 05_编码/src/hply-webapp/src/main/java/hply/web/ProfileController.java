package hply.web;


import hply.core.Utility;
import hply.domain.Profile;
import hply.service.ProfileService;

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
@RequestMapping(value = ProfileController.URI)
public class ProfileController {
    
	@Autowired
    private ProfileService service;

	public static final String URI = "/profile";
	public static final String JSP_PAGE_LIST = "profile-list";
	public static final String JSP_PAGE_DETAIL = "profile-detail";
	public static final String JSP_PAGE_MODIFY = "profile-modify";
    
    
	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("page_title", "型材");
		model.addAttribute("list", service.getAll());
		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "型材的详情信息");
		model.addAttribute("profile", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("profile", new Profile());
		model.addAttribute("page_title", "新建型材");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		model.addAttribute("profile", service.get(id));
		model.addAttribute("page_title", "修改型材");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid Profile profile,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(profile.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.insert(profile);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("profile", profile);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id,
			@Valid Profile profile, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(profile.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.update(profile);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("profile", profile);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id,
			RedirectAttributes redirectAttrs) {
		Profile profile = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("profile", profile);
		return "redirect:" + URI;
	}
}

