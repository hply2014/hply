package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.Chop;
import hply.domain.Project;
import hply.domain.ProjectSummary;
import hply.domain.SysOrganization;
import hply.domain.SysUser;
import hply.service.ChopService;
import hply.service.ProjectService;
import hply.service.SysOrganizationService;
import hply.service.SysParameterService;
import hply.service.SysUserService;

import java.net.URLEncoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
	public static final String JSP_PAGE_SUMMARY = "chop-summary";
	public static final String JSP_PAGE_DETAIL = "chop-detail";
	public static final String JSP_PAGE_MODIFY = "chop-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "p", required = false) Integer p, @RequestParam(value = "oid", required = false) String oid,
			Model model) {
		model.addAttribute("page_title", "盖章管理");

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
		int rowCount = service.getRowCountByOrganization(oid);
		int pageCount = rowCount / pageSize + (rowCount % pageSize == 0 ? 0 : 1);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPageStarted", pageIndex * pageSize);
		List<Chop> list = service.getAllPaged(oid, pageIndex * pageSize, pageSize);

		for (Chop item : list) {
			// Project pjt = projectService.get(item.getProjectId());
			// item.setProjectId(pjt != null ? "[" + pjt.getProjectCode() + "]"
			// + pjt.getProjectName() : Utility.EMPTY);

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
	 * 列表页面
	 */
	@RequestMapping(value = "/summary", method = RequestMethod.GET)
	public String summary(@RequestParam(value = "p1", required = false) String p1, @RequestParam(value = "p2", required = false) String p2,
			@RequestParam(value = "oid", required = false) String oid, Model model) {

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
		List<String> months = service.getMonths();
		model.addAttribute("months", months);

		if (StringUtils.isBlank(p1)) {
			p1 = months.size() > 0 ? months.get(0) : DateFormatUtils.format(new Date(), "yyyy-MM");
			p2 = p1;
		}

		Calendar c0 = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		try {
			Date d1 = DateUtils.parseDate(p1 + "-21", "yyyy-MM-dd");
			Date d2 = DateUtils.parseDate(p2 + "-21", "yyyy-MM-dd");
			c0.setTime(d1);
			c1.setTime(d2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		c0.add(Calendar.MONTH, -1);
		c1.add(Calendar.DATE, -1);

		String dateRange = DateFormatUtils.format(c0, "yyyy年MM月dd日") + " ~ " + DateFormatUtils.format(c1, "yyyy年MM月dd日");

		List<Chop> list = service.getChopReport(p1, p2, oid);

		for (Chop item : list) {
			// Project pjt = projectService.get(item.getProjectId());
			// item.setProjectId(pjt != null ? "[" + pjt.getProjectCode() + "]"
			// + pjt.getProjectName() : Utility.EMPTY);

			SysUser user = sysUserService.get(item.getApplyUser());
			item.setApplyUser(user != null ? user.getRealName() : Utility.EMPTY);

			SysUser step3User = sysUserService.get(item.getStep3User());
			item.setStep3User(step3User != null ? step3User.getRealName() : Utility.EMPTY);
		}

		model.addAttribute("list", list);
		model.addAttribute("p1", p1);
		model.addAttribute("p2", p2);
		model.addAttribute("rowCount", list.size());
		model.addAttribute("page_title", dateRange + orgService.get(oid).getOrganizationName() + "盖章明细表");

		return JSP_PAGE_SUMMARY;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "盖章管理的详情信息");
		Chop item = service.get(id);

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

		model.addAttribute("chop", item);
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {

		model.addAttribute("orglist", getOrgList());

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

		model.addAttribute("orglist", getOrgList());

		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		Chop chop = service.get(id);

		// SysOrganization org = orgService.get(chop.getOrganizationId());
		// chop.setOrganizationId(org != null ? org.getOrganizationName() :
		// Utility.EMPTY);

		SysUser user = sysUserService.get(chop.getApplyUser());
		chop.setApplyUser(user != null ? user.getRealName() : Utility.EMPTY);

		model.addAttribute("chop", chop);
		model.addAttribute("page_title", "修改用章申请");
		return JSP_PAGE_MODIFY;
	}

	private List<SysOrganization> getOrgList() {
		if (SessionHelper.IsBusinessDepartment()) {
			List<SysOrganization> ol = new ArrayList<SysOrganization>();
			ol.add((SysOrganization) SessionHelper.getAttribute(SessionHelper.CURRENT_ORGANIZATION));
			return ol;
		}
		return orgService.getAllBusiness();
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
		// chop.setOrganizationId(SessionHelper.getCurrentSysUser().getOrganizationId());

		service.insert(chop);
		redirectAttrs.addFlashAttribute("message", "申请成功");

		redirectAttrs.addFlashAttribute("chop", chop);
		return "redirect:" + SessionHelper.getLastUrl(URI);
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
		return "redirect:" + SessionHelper.getLastUrl(URI);
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
		return "redirect:" + SessionHelper.getLastUrl(URI);
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
		return "redirect:" + SessionHelper.getLastUrl(URI);
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
		return "redirect:" + SessionHelper.getLastUrl(URI);
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
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	@RequestMapping(value = "/export")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "p1", required = false) String p1, @RequestParam(value = "p2", required = false) String p2,
			@RequestParam(value = "oid", required = false) String oid) throws Exception {

		final String EXCEL_HEADERS = "序号,编号,项目实施人,日期,项目名称,盖章内容,经办人,项目经理";

		if (StringUtils.isBlank(oid)) {
			if (SessionHelper.IsBusinessDepartment()) {
				// 如果是业务部门，并且未指定按单位的过滤条件
				oid = SessionHelper.getCurrentSysUser().getOrganizationId();
			}
		}

		Calendar c0 = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		try {
			Date d1 = DateUtils.parseDate(p1 + "-21", "yyyy-MM-dd");
			Date d2 = DateUtils.parseDate(p2 + "-21", "yyyy-MM-dd");
			c0.setTime(d1);
			c1.setTime(d2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		c0.add(Calendar.MONTH, -1);
		c1.add(Calendar.DATE, -1);

		String dateRange = DateFormatUtils.format(c0, "yyyy年MM月dd日") + " ~ " + DateFormatUtils.format(c1, "yyyy年MM月dd日");

		List<Chop> list = service.getChopReport(p1, p2, oid);
		for (Chop item : list) {
			// Project pjt = projectService.get(item.getProjectId());
			// item.setProjectId(pjt != null ? "[" + pjt.getProjectCode() + "]"
			// + pjt.getProjectName() : Utility.EMPTY);

			SysUser user = sysUserService.get(item.getApplyUser());
			item.setApplyUser(user != null ? user.getRealName() : Utility.EMPTY);

			SysUser step3User = sysUserService.get(item.getStep3User());
			item.setStep3User(step3User != null ? step3User.getRealName() : Utility.EMPTY);
		}

		SysOrganization org = orgService.get(oid);
		String orgName = org != null ? org.getOrganizationName() : Utility.EMPTY;
		String sheetName = dateRange + orgName + "盖章明细表";

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		String fileName = URLEncoder.encode("chop-report.xlsx", "UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);

		int rowIndex = 0;

		Workbook wb = new XSSFWorkbook();
		CreationHelper createHelper = wb.getCreationHelper();

		Sheet sheet1 = wb.createSheet(sheetName);

		CellStyle styleDefault = wb.createCellStyle();
		styleDefault.setBorderTop(CellStyle.BORDER_THIN);
		styleDefault.setTopBorderColor(IndexedColors.BLACK.getIndex());
		styleDefault.setBorderRight(CellStyle.BORDER_THIN);
		styleDefault.setRightBorderColor(IndexedColors.BLACK.getIndex());
		styleDefault.setBorderBottom(CellStyle.BORDER_THIN);
		styleDefault.setBottomBorderColor(IndexedColors.BLACK.getIndex());
		styleDefault.setBorderLeft(CellStyle.BORDER_THIN);
		styleDefault.setLeftBorderColor(IndexedColors.BLACK.getIndex());

		CellStyle styleHeader = wb.createCellStyle();
		styleHeader.cloneStyleFrom(styleDefault);
		styleHeader.setAlignment(CellStyle.ALIGN_CENTER);
		styleHeader.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		styleHeader.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		styleHeader.setFillPattern(CellStyle.SOLID_FOREGROUND);

		CellStyle styleDate = wb.createCellStyle();
		styleDate.cloneStyleFrom(styleDefault);
		styleDate.setDataFormat(createHelper.createDataFormat().getFormat("yyyy-mm-dd"));

		Row r0 = sheet1.createRow(rowIndex++);
		String[] headers = EXCEL_HEADERS.split(",");
		for (int i = 0; i < headers.length; i++) {
			Cell c = r0.createCell(i);
			c.setCellStyle(styleHeader);
			c.setCellValue(headers[i]);
			c.setCellStyle(styleHeader);
		}

		// // List<ProjectSummary> list = service.getSummaryByMonth(p1, p2,
		// orgId);
		for (int i = 0; i < list.size(); i++) {
			int j = 0;
			Chop p = list.get(i);
			Row r = sheet1.createRow(rowIndex++);
			Cell _c0 = r.createCell(j++);
			_c0.setCellValue(i + 1);
			_c0.setCellStyle(styleDefault);

			Cell c01 = r.createCell(j++);
			c01.setCellValue(p.getChopCode());
			c01.setCellStyle(styleDefault);

			Cell c2 = r.createCell(j++);
			c2.setCellValue(p.getField01());
			c2.setCellStyle(styleDefault);

			Cell _c1 = r.createCell(j++);
			_c1.setCellValue(p.getApplyTime());
			_c1.setCellStyle(styleDate);

			Cell c4 = r.createCell(j++);
			c4.setCellValue(p.getProjectName());
			c4.setCellStyle(styleDefault);

			Cell c5 = r.createCell(j++);
			c5.setCellValue(p.getContent());
			c5.setCellStyle(styleDefault);

			Cell c6 = r.createCell(j++);
			c6.setCellValue(p.getStep3User());
			c6.setCellStyle(styleDefault);

			Cell c7 = r.createCell(j++);
			c7.setCellValue(p.getManager());
			c7.setCellStyle(styleDefault);
		}

		for (int i = 0; i < headers.length; i++) {
			sheet1.setColumnWidth(i, 256 * 20);
		}

		wb.write(response.getOutputStream());
	}

}
