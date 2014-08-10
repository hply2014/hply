package hply.web;

import hply.core.Utility;
import hply.domain.ContractChange;
import hply.domain.Project;
import hply.domain.SysUser;
import hply.service.ContractChangeService;
import hply.service.ProjectService;
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
@RequestMapping(value = ContractChangeController.URI)
public class ContractChangeController {

	@Autowired
	private ContractChangeService service;

	@Autowired
	private SysParameterService paramService;

	@Autowired
	private ProjectService projectService;

	@Autowired
	private SysUserService sysUserService;

	public static final String URI = "/contractchange";
	public static final String JSP_PAGE_LIST = "contractchange-list";
	public static final String JSP_PAGE_DETAIL = "contractchange-detail";
	public static final String JSP_PAGE_MODIFY = "contractchange-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("page_title", "合同补充协议");
		List<ContractChange> list = service.getAll();
		for (ContractChange item : list) {
			Project pjt = projectService.get(item.getProjectId());
			item.setProjectId(pjt != null ? "[" + pjt.getProjectCode() + "]" + pjt.getProjectName() : Utility.EMPTY);

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
		model.addAttribute("page_title", "合同补充协议的详情信息");
		model.addAttribute("contractChange", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		ContractChange cc = new ContractChange();
		cc.setCsaCode(paramService.getNextCode("cc_code"));
		cc.setManagementRate(paramService.getParamDoubleValue("default_manager_rate"));

		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);

		model.addAttribute("contractChange", cc);
		model.addAttribute("page_title", "新建合同补充协议");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		ContractChange cc = service.get(id);
		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		model.addAttribute("contractChange", cc);

		model.addAttribute("page_title", "修改合同补充协议");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid ContractChange contractChange, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(contractChange.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.insert(contractChange);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("contractChange", contractChange);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid ContractChange contractChange, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(contractChange.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.update(contractChange);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("contractChange", contractChange);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		ContractChange contractChange = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("contractChange", contractChange);
		return "redirect:" + URI;
	}
}
