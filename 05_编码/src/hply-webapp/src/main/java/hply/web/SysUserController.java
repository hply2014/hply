package hply.web;

import hply.core.Utility;
import hply.domain.SysOrganization;
import hply.domain.SysUser;
import hply.service.SysOrganizationService;
import hply.service.SysUserService;

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
@RequestMapping(value = SysUserController.URI)
public class SysUserController {

	@Autowired
	private SysUserService service;

	@Autowired
	private SysOrganizationService orgService;

	public static final String URI = "/sysuser";
	public static final String JSP_PAGE_LIST = "sysuser-list";
	public static final String JSP_PAGE_DETAIL = "sysuser-detail";
	public static final String JSP_PAGE_MODIFY = "sysuser-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("page_title", "系统用户");
		List<SysUser> userlist = service.getAll();
		for (SysUser user : userlist) {
			SysOrganization org = orgService.get(user.getOrganizationId());
			if (org != null) {
				user.setOrganizationId(org.getOrganizationName());
			} else {
				user.setOrganizationId(Utility.EMPTY);
			}
		}
		model.addAttribute("list", userlist);
		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		SysUser user = service.get(id);
		model.addAttribute("sysUser", user);
		model.addAttribute("page_title", user.getRealName() + "的详情信息");
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("sysUser", new SysUser());
		model.addAttribute("orglist", orgService.getAll());
		model.addAttribute("page_title", "新建系统用户");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		SysUser user = service.get(id);
		model.addAttribute("sysUser", user);
		model.addAttribute("orglist", orgService.getAll());
		model.addAttribute("page_title", "修改" + user.getRealName() + "的信息");
		model.addAttribute("is_modify", "1");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid SysUser sysUser, BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(sysUser.toString());

		if (result.hasErrors()) {
			model.addAttribute("orglist", orgService.getAll());
			model.addAttribute("page_title", "新建系统用户");
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.insert(sysUser);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("sysUser", sysUser);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid SysUser sysUser, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(sysUser.toString());
		if (result.hasErrors()) {
			model.addAttribute("orglist", orgService.getAll());
			model.addAttribute("page_title", "修改" + sysUser.getRealName() + "的信息");
			model.addAttribute("is_modify", "1");
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.update(sysUser);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("sysUser", sysUser);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		SysUser sysUser = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("sysUser", sysUser);
		return "redirect:" + URI;
	}

	/*
	 * 根据用户id，设置资源权限
	 */
	@RequestMapping(value = "auth/{id}")
	public String authorization(@PathVariable String id, Model model) {
		System.out.println("authorization tree ...");
		model.addAttribute("page_title", "业务授权");
		return "sample-fancytree";
	}
}
