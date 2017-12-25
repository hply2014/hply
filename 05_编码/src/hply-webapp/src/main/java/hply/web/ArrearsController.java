package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.Arrears;
import hply.domain.Project;
import hply.domain.SysOrganization;
import hply.domain.SysUser;
import hply.service.ArrearsService;
import hply.service.ProjectService;
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
@RequestMapping(value = ArrearsController.URI)
public class ArrearsController {

	@Autowired
	private ArrearsService service;
	@Autowired
	private SysParameterService paramService;

	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private ProjectService projectService;

	@Autowired
	private SysOrganizationService orgService;

	public static final String URI = "/arrears";
	public static final String JSP_PAGE_LIST = "arrears-list";
	public static final String JSP_PAGE_DETAIL = "arrears-detail";
	public static final String JSP_PAGE_MODIFY = "arrears-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "p", required = false) Integer p, @RequestParam(value = "oid", required = false) String oid,
			Model model) {
		model.addAttribute("page_title", "往来欠款");

		List<SysOrganization> orglist = orgService.getAllBusiness();
		if (SessionHelper.IsBusinessDepartment()) {
			// 如果是业务部门，并且未指定按单位的过滤条件
			oid = SessionHelper.getCurrentSysUser().getOrganizationId();
		} else {
			model.addAttribute("orglist", orglist);
			if (StringUtils.isBlank(oid)) {
				oid = orglist.get(0).getId();
			}
		}
		model.addAttribute("oid", oid);

		int pageIndex = p != null ? p.intValue() : 0;
		int pageSize = paramService.getParamIntValue("page_size", 30);
		int rowCount = service.getRowCount(oid);
		int pageCount = rowCount / pageSize + (rowCount % pageSize == 0 ? 0 : 1);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPageStarted", pageIndex * pageSize);
		List<Arrears> list = service.getAllPagedByOrganization(oid, pageIndex * pageSize, pageSize);

		for (Arrears item : list) {
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
		model.addAttribute("page_title", "往来欠款的详情信息");
		model.addAttribute("arrears", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(@RequestParam(value = "projectid", required = false) String projectId, Model model) {
		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		String arrearsTypes = paramService.getByEnName("arrears_type").getParamValue();
		String payTypes = paramService.getByEnName("pay_types").getParamValue();
		model.addAttribute("arrearsTypes", arrearsTypes.split("/"));
		model.addAttribute("payTypes", payTypes.split("/"));

		Arrears item = new Arrears();
		item.setInterestRate(paramService.getParamDoubleValue("interest_rate"));
		item.setArrearsCode(paramService.getNextCode("arrears_code"));
		item.setProjectId(projectId);
		model.addAttribute("arrears", item);
		model.addAttribute("page_title", "新建往来欠款");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);

		String arrearsTypes = paramService.getByEnName("arrears_type").getParamValue();
		String payTypes = paramService.getByEnName("pay_types").getParamValue();
		model.addAttribute("arrearsTypes", arrearsTypes.split("/"));
		model.addAttribute("payTypes", payTypes.split("/"));

		model.addAttribute("arrears", service.get(id));
		model.addAttribute("page_title", "修改往来欠款");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid Arrears arrears, BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(arrears.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.insert(arrears);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("arrears", arrears);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid Arrears arrears, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(arrears.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}
		service.delete(id);
		service.insert(arrears);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("arrears", arrears);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		Arrears arrears = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("arrears", arrears);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 审核页面
	 */
	@RequestMapping(value = "/check/{id}", method = RequestMethod.GET)
	public String processCheckSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		Arrears arrears = service.get(id);
		service.check(id);
		redirectAttrs.addFlashAttribute("delMessage", "审核通过");
		redirectAttrs.addFlashAttribute("arrears", arrears);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}
}
