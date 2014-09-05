package hply.web;

import hply.core.Utility;
import hply.domain.ProjectSummary;
import hply.service.ProjectSummaryService;
import hply.service.SysOrganizationService;
import hply.service.SysParameterService;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
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
@RequestMapping(value = ProjectSummaryController.URI)
public class ProjectSummaryController {

	@Autowired
	private ProjectSummaryService service;

	@Autowired
	private SysOrganizationService orgService;

	@Autowired
	private SysParameterService paramService;

	public static final String URI = "/projectsummary";
	public static final String JSP_PAGE_LIST = "projectsummary-list";
	public static final String JSP_PAGE_DETAIL = "projectsummary-detail";
	public static final String JSP_PAGE_MODIFY = "projectsummary-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "p", required = false) Integer p, Model model) {
		model.addAttribute("page_title", "多项目汇总");

		int pageIndex = p != null ? p.intValue() : 0;
		int pageSize = paramService.getParamIntValue("page_size", 30);
		int rowCount = service.getRowCount();
		int pageCount = rowCount / pageSize + (rowCount % pageSize == 0 ? 0 : 1);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPageStarted", pageIndex * pageSize);
		List<ProjectSummary> list = service.getAllPaged(pageIndex * pageSize, pageSize);

		model.addAttribute("list", list);

		return JSP_PAGE_LIST;
	}

	/*
	 * 列表页面
	 */
	@RequestMapping(value = "/full", method = RequestMethod.GET)
	public String listFull(@RequestParam(value = "pharse", required = false) String pharse,
			@RequestParam(value = "orgid", required = false) String orgId, Model model) {
		model.addAttribute("page_title", "多项目汇总");

		List<String> months = service.getMonths();
		System.out.print("lst.size()=" + months.size());
		model.addAttribute("months", months);

		if (StringUtils.isBlank(pharse)) {
			pharse = months.size() > 0 ? months.get(0) : DateFormatUtils.format(new Date(), "yyyy-mm");
		}

		Calendar c0 = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		try {
			Date d = DateUtils.parseDate(pharse + "-21", "yyyy-MM-dd");
			c0.setTime(d);
			c1.setTime(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		c0.add(Calendar.MONTH, -1);
		c1.add(Calendar.DATE, -1);
		
		String dateRange = DateFormatUtils.format(c0, "yyyy年MM月dd日") + " ~ " + DateFormatUtils.format(c1, "yyyy年MM月dd日");
		model.addAttribute("dateRange", dateRange);

		if (StringUtils.isBlank(orgId)) {
			// 默认项目部
			orgId = "0ed44f90-0c3a-11e4-9300-001c42328937";
		}
		List<ProjectSummary> list = service.getSummaryByMonth(pharse, orgId);
		model.addAttribute("list", list);
		
		model.addAttribute("pharse", pharse);
		model.addAttribute("orgId", orgId);
		
		return "projectsummary-list-full";
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
	public String processCreateSubmit(@Valid ProjectSummary projectSummary, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
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
	public String processUpdateSubmit(@PathVariable String id, @Valid ProjectSummary projectSummary, BindingResult result, Model model,
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
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		ProjectSummary projectSummary = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("projectSummary", projectSummary);
		return "redirect:" + URI;
	}
}
