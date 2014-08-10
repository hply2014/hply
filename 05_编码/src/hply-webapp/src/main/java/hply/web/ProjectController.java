package hply.web;

import hply.core.Utility;
import hply.domain.Project;
import hply.domain.SysOrganization;
import hply.domain.SysUser;
import hply.service.ProjectService;
import hply.service.SysOrganizationService;
import hply.service.SysParameterService;
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
@RequestMapping(value = ProjectController.URI)
public class ProjectController {

	@Autowired
	private ProjectService service;

	@Autowired
	private SysOrganizationService orgService;

	@Autowired
	private SysParameterService paramService;

	@Autowired
	private SysUserService sysUserService;

	public static final String URI = "/project";
	public static final String JSP_PAGE_LIST = "project-list";
	public static final String JSP_PAGE_DETAIL = "project-detail";
	public static final String JSP_PAGE_MODIFY = "project-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("page_title", "合同项目信息");
		List<Project> list = service.getAll();
		for (Project item : list) {
			SysOrganization org = orgService.get(item.getOrganizationId());
			item.setOrganizationId(org != null ? org.getOrganizationName() : Utility.EMPTY);

			SysUser user = sysUserService.get(item.getCreateUser());
			item.setCreateUser(user != null ? user.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("list", list);
		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		Project project = service.get(id);
		model.addAttribute("page_title", "合同项目信息的详情信息：" + project.getProjectName() + "（" + project.getProjectCode() + "）");
		model.addAttribute("project", project);
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		Project project = new Project();
		project.setProjectCode(paramService.getNextCode("project_code"));
		model.addAttribute("project", project);
		model.addAttribute("orglist", orgService.getAll());
		project.setManagementRate(paramService.getParamDoubleValue("default_manager_rate"));
		project.setTaxRate(paramService.getParamDoubleValue("default_tax_rate"));
		model.addAttribute("page_title", "新建合同项目信息");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		Project project = service.get(id);
		model.addAttribute("page_title", "修改合同项目信息：" + project.getProjectName() + "（" + project.getProjectCode() + "）");
		model.addAttribute("project", project);
		model.addAttribute("orglist", orgService.getAll());
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid Project project, BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(project.toString());

		if (result.hasErrors()) {
			model.addAttribute("orglist", orgService.getAll());
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.insert(project);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("project", project);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid Project project, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(project.toString());

		if (result.hasErrors()) {
			model.addAttribute("orglist", orgService.getAll());
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.update(project);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("project", project);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		Project project = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("project", project);
		return "redirect:" + URI;
	}
}
