package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.Chop;
import hply.domain.Project;
import hply.domain.SysOrganization;
import hply.domain.SysUser;
import hply.service.ChopService;
import hply.service.ProjectService;
import hply.service.SysOrganizationService;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = ChopController.URI)
public class ChopController {

	@Autowired
	private ChopService service;

	@Autowired
	private SysOrganizationService orgService;

	@Autowired
	private SysParameterService paramService;

	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private ProjectService projectService;

	public static final String URI = "/chop";
	public static final String JSP_PAGE_LIST = "chop-list";
	public static final String JSP_PAGE_DETAIL = "chop-detail";
	public static final String JSP_PAGE_MODIFY = "chop-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "p", required = false) Integer p, Model model) {
		model.addAttribute("page_title", "盖章管理");

		int pageIndex = p != null ? p.intValue() : 0;
		int pageSize = paramService.getParamIntValue("page_size", 30);
		int rowCount = service.getRowCount();
		int pageCount = rowCount / pageSize + (rowCount % pageSize == 0 ? 0 : 1);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPageStarted", pageIndex * pageSize);
		List<Chop> list = service.getAllPaged(pageIndex * pageSize, pageSize);

		for (Chop item : list) {
			Project pjt = projectService.get(item.getProjectId());
			item.setProjectId(pjt != null ? "[" + pjt.getProjectCode() + "]" + pjt.getProjectName() : Utility.EMPTY);

			SysOrganization org = orgService.get(item.getOrganizationId());
			item.setOrganizationId(org != null ? org.getOrganizationName() : Utility.EMPTY);

			SysUser user = sysUserService.get(item.getApplyUser());
			item.setApplyUser(user != null ? user.getRealName() : Utility.EMPTY);

			SysUser step1User = sysUserService.get(item.getStep1User());
			item.setStep1User(step1User != null ? step1User.getRealName() : Utility.EMPTY);

			SysUser step2User = sysUserService.get(item.getStep2User());
			item.setStep2User(step2User != null ? step2User.getRealName() : Utility.EMPTY);

			SysUser step3User = sysUserService.get(item.getStep3User());
			item.setStep3User(step3User != null ? step3User.getRealName() : Utility.EMPTY);
		}

		model.addAttribute("list", list);

		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "盖章管理的详情信息");
		model.addAttribute("chop", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		Chop chop = new Chop();
		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		chop.setChopCode(paramService.getNextCode("chop_code"));

		chop.setApplyUser(SessionHelper.getCurrentRealName());
		chop.setApplyTime(new Date());

		String orgId = SessionHelper.getCurrentSysUser().getOrganizationId();
		chop.setOrganizationId(orgService.get(orgId).getOrganizationName());

		model.addAttribute("chop", chop);
		model.addAttribute("page_title", "新建用章申请");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		Chop chop = service.get(id);

		SysOrganization org = orgService.get(chop.getOrganizationId());
		chop.setOrganizationId(org != null ? org.getOrganizationName() : Utility.EMPTY);
		
		SysUser user = sysUserService.get(chop.getApplyUser());
		chop.setApplyUser(user != null ? user.getRealName() : Utility.EMPTY);

		model.addAttribute("chop", chop);
		model.addAttribute("page_title", "修改用章申请");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 审核页面
	 */
	@RequestMapping(value = "/step1/{id}", method = RequestMethod.GET)
	public String step1Form(@PathVariable String id, Model model) {
		Chop chop = service.get(id);
		
		Project project = projectService.get(chop.getProjectId());
		chop.setProjectId(project != null ? "[" + project.getProjectCode() + "]" + project.getProjectName() : Utility.EMPTY);

		SysOrganization org = orgService.get(chop.getOrganizationId());
		chop.setOrganizationId(org != null ? org.getOrganizationName() : Utility.EMPTY);
		
		SysUser user = sysUserService.get(chop.getApplyUser());
		chop.setApplyUser(user != null ? user.getRealName() : Utility.EMPTY);
		
		model.addAttribute("chop", chop);
		model.addAttribute("page_title", "用章申请（部门审核）");
		model.addAttribute("step1", 1);
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 审核页面
	 */
	@RequestMapping(value = "/step2/{id}", method = RequestMethod.GET)
	public String step2Form(@PathVariable String id, Model model) {
		Chop chop = service.get(id);
		
		Project project = projectService.get(chop.getProjectId());
		chop.setProjectId(project != null ? "[" + project.getProjectCode() + "]" + project.getProjectName() : Utility.EMPTY);

		SysOrganization org = orgService.get(chop.getOrganizationId());
		chop.setOrganizationId(org != null ? org.getOrganizationName() : Utility.EMPTY);
		
		SysUser user = sysUserService.get(chop.getApplyUser());
		chop.setApplyUser(user != null ? user.getRealName() : Utility.EMPTY);
		
		SysUser step1User = sysUserService.get(chop.getStep1User());
		chop.setStep1User(step1User != null ? step1User.getRealName() : Utility.EMPTY);
		
		model.addAttribute("chop", chop);
		model.addAttribute("page_title", "用章申请（财务部审批）");
		model.addAttribute("step2", 1);
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 审核页面
	 */
	@RequestMapping(value = "/step3/{id}", method = RequestMethod.GET)
	public String step3Form(@PathVariable String id, Model model) {
		Chop chop = service.get(id);
		
		Project project = projectService.get(chop.getProjectId());
		chop.setProjectId(project != null ? "[" + project.getProjectCode() + "]" + project.getProjectName() : Utility.EMPTY);

		SysOrganization org = orgService.get(chop.getOrganizationId());
		chop.setOrganizationId(org != null ? org.getOrganizationName() : Utility.EMPTY);
		
		SysUser user = sysUserService.get(chop.getApplyUser());
		chop.setApplyUser(user != null ? user.getRealName() : Utility.EMPTY);
		
		SysUser step1User = sysUserService.get(chop.getStep1User());
		chop.setStep1User(step1User != null ? step1User.getRealName() : Utility.EMPTY);

		SysUser step2User = sysUserService.get(chop.getStep2User());
		chop.setStep2User(step2User != null ? step2User.getRealName() : Utility.EMPTY);
		
		model.addAttribute("chop", chop);
		model.addAttribute("page_title", "用章申请（办理）");
		model.addAttribute("step3", 1);
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid Chop chop, BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(chop.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}
		chop.setApplyUser(SessionHelper.getCurrentUserId());
		chop.setApplyTime(new Date());
		chop.setOrganizationId(SessionHelper.getCurrentSysUser().getOrganizationId());

		service.insert(chop);
		redirectAttrs.addFlashAttribute("message", "申请成功");

		redirectAttrs.addFlashAttribute("chop", chop);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid Chop chop, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(chop.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		chop.setApplyUser(SessionHelper.getCurrentUserId());
		chop.setApplyTime(new Date());
		chop.setOrganizationId(SessionHelper.getCurrentSysUser().getOrganizationId());

		service.update(chop);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("chop", chop);
		return "redirect:" + URI;
	}
	


	/*
	 * 处理部门审核的提交动作
	 */
	@RequestMapping(value = "/step1/{id}", method = RequestMethod.POST)
	public String processStep1Submit(@PathVariable String id, @Valid Chop chop, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}
		
		Chop orginChop = service.get(id);
		orginChop.setStep1Idea(chop.getStep1Idea());
		orginChop.setStep1User(SessionHelper.getCurrentUserId());
		orginChop.setStep1Time(new Date());
		orginChop.setStepStatus(chop.getStepStatus());
		
		orginChop.setStep2Idea(null);
		orginChop.setStep2Time(null);
		orginChop.setStep2User(null);
		
		orginChop.setStep3Idea(null);
		orginChop.setStep3Time(null);
		orginChop.setStep3User(null);

		service.update(orginChop);
		redirectAttrs.addFlashAttribute("message", "部门审核成功");

		redirectAttrs.addFlashAttribute("chop", orginChop);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/step2/{id}", method = RequestMethod.POST)
	public String processStep2Submit(@PathVariable String id, @Valid Chop chop, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(chop.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}
		
		Chop orginChop = service.get(id);
		orginChop.setStep2Idea(chop.getStep2Idea());
		orginChop.setStep2User(SessionHelper.getCurrentUserId());
		orginChop.setStep2Time(new Date());
		orginChop.setStepStatus(chop.getStepStatus());

		service.update(orginChop);
		redirectAttrs.addFlashAttribute("message", "财务审批成功");

		redirectAttrs.addFlashAttribute("chop", orginChop);
		return "redirect:" + URI;
	}
	


	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/step3/{id}", method = RequestMethod.POST)
	public String processStep3Submit(@PathVariable String id, @Valid Chop chop, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		
		Chop orginChop = service.get(id);
		orginChop.setStep3Idea(chop.getStep3Idea());
		orginChop.setStep3User(SessionHelper.getCurrentUserId());
		orginChop.setStep3Time(new Date());
		orginChop.setStepStatus(chop.getStepStatus());

		service.update(orginChop);
		redirectAttrs.addFlashAttribute("message", "处理成功");

		redirectAttrs.addFlashAttribute("chop", orginChop);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		Chop chop = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("chop", chop);
		return "redirect:" + URI;
	}
}
