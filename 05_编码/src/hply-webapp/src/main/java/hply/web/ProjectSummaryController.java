package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.ProjectSummary;
import hply.domain.SysOrganization;
import hply.service.ProjectSummaryService;
import hply.service.SysOrganizationService;
import hply.service.SysParameterService;

import java.net.URLEncoder;
import java.text.ParseException;
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
	public String list(@RequestParam(value = "p", required = false) Integer p, @RequestParam(value = "oid", required = false) String oid,
			Model model) {
		model.addAttribute("page_title", "多项目汇总");

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
		List<ProjectSummary> list = service.getAllPagedByOrganization(oid, pageIndex * pageSize, pageSize);

		model.addAttribute("list", list);

		return JSP_PAGE_LIST;
	}

	/*
	 * 列表页面
	 */
	@RequestMapping(value = "/full", method = RequestMethod.GET)
	public String listFull(@RequestParam(value = "pharse", required = false) String pharse,
			@RequestParam(value = "orgid", required = false) String orgId, Model model) {
		model.addAttribute("page_title", "项目汇总报表");

		List<String> months = service.getMonths();
		Utility.println("lst.size()=" + months.size());
		model.addAttribute("months", months);

		if (StringUtils.isBlank(pharse)) {
			pharse = months.size() > 0 ? months.get(0) : DateFormatUtils.format(new Date(), "yyyy-MM");
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

		if (SessionHelper.IsBusinessDepartment()) {
			// 如果是业务部门，并且未指定按单位的过滤条件
			orgId = SessionHelper.getCurrentSysUser().getOrganizationId();

		} else {
			List<SysOrganization> orglist = orgService.getAllBusiness();
			model.addAttribute("orglist", orglist);

			if (StringUtils.isBlank(orgId)) {
				// 默认项目部
				orgId = orglist.get(0).getId();
			}
		}
		List<ProjectSummary> list = service.getSummaryByMonth(pharse, orgId);
		model.addAttribute("projectSummaryTotal", service.getTotal(list));
		model.addAttribute("list", list);

		model.addAttribute("pharse", pharse);
		model.addAttribute("orgId", orgId);

		return "projectsummary-list-full";
	}

	/*
	 * 列表页面
	 */
	@RequestMapping(value = "/year", method = RequestMethod.GET)
	public String listYear(@RequestParam(value = "orgid", required = false) String orgId, Model model) {
		model.addAttribute("page_title", "年度汇总报表");

		if (SessionHelper.IsBusinessDepartment()) {
			// 如果是业务部门，并且未指定按单位的过滤条件
			orgId = SessionHelper.getCurrentSysUser().getOrganizationId();

		} else {
			List<SysOrganization> orglist = orgService.getAllBusiness();
			model.addAttribute("orglist", orglist);

			if (StringUtils.isBlank(orgId)) {
				// 默认项目部
				orgId = orglist.get(0).getId();
			}
		}
		List<ProjectSummary> list = service.getSummaryByYear(orgId);
		model.addAttribute("list", list);

		model.addAttribute("orgId", orgId);

		return "projectsummary-list-year";
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

	@RequestMapping(value = "/export")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "pharse") String pharse,
			@RequestParam(value = "orgid", required = false) String orgId) throws Exception {

		final String EXCEL_HEADERS = "序号,时间,摘要,项目编号,项目名称,合同金额,合同调增额,累计调增额,合同结算额,发票金额,累计开票,收款金额,累计收款,回收率,发票金额,累计开票,支付金额,累计,工程余额,比率,应缴税金,已缴税金,累计已缴税金,尚欠税金,比率,应收管理费,实收管理费,累计收管理费,尚欠管理费,其他收入,管理费及其他收入累计,垫付资金,预计用量,型材点";

		if (StringUtils.isBlank(orgId)) {
			if (SessionHelper.IsBusinessDepartment()) {
				// 如果是业务部门，并且未指定按单位的过滤条件
				orgId = SessionHelper.getCurrentSysUser().getOrganizationId();
			}
		}

		SysOrganization org = orgService.get(orgId);
		String orgName = org != null ? org.getOrganizationName() : Utility.EMPTY;
		String sheetName = orgName + "合同项目汇总（" + pharse + "）";

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		String fileName = URLEncoder.encode("totaldata-" + pharse + ".xlsx", "UTF-8");
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

		CellStyle stylePercent = wb.createCellStyle();
		stylePercent.cloneStyleFrom(styleDefault);
		stylePercent.setDataFormat(createHelper.createDataFormat().getFormat("0.00%"));

		CellStyle styleRMB = wb.createCellStyle();
		styleRMB.cloneStyleFrom(styleDefault);
		styleRMB.setDataFormat(createHelper.createDataFormat().getFormat("#,##0.00"));

		CellStyle styleDate = wb.createCellStyle();
		styleDate.cloneStyleFrom(styleDefault);
		styleDate.setDataFormat(createHelper.createDataFormat().getFormat("yyyy-mm-dd"));

		CellStyle styleFooter = wb.createCellStyle();
		styleFooter.cloneStyleFrom(styleDefault);
		styleFooter.setAlignment(CellStyle.ALIGN_RIGHT);

		Row r0 = sheet1.createRow(rowIndex++);
		Row r1 = sheet1.createRow(rowIndex++);
		String[] headers = EXCEL_HEADERS.split(",");
		for (int i = 0; i < headers.length; i++) {
			Cell c = r0.createCell(i);
			c.setCellStyle(styleHeader);

			Cell c1 = r1.createCell(i);
			c1.setCellValue(headers[i]);
			c1.setCellStyle(styleHeader);
		}
		r0.getCell(3).setCellValue("项目信息");
		r0.getCell(9).setCellValue("甲方开票情况");
		r0.getCell(11).setCellValue("收款情况");
		r0.getCell(14).setCellValue("客户开票情况");
		r0.getCell(16).setCellValue("支付工程款情况");
		r0.getCell(19).setCellValue("税金情况");
		r0.getCell(24).setCellValue("管理费及其他收入情况");
		r0.getCell(32).setCellValue("型材（吨）");

		r0.getCell(0).setCellValue(headers[0]);
		r0.getCell(1).setCellValue(headers[1]);
		r0.getCell(2).setCellValue(headers[2]);
		r0.getCell(31).setCellValue(headers[31]);

		sheet1.addMergedRegion(new CellRangeAddress(0, 1, 0, 0));
		sheet1.addMergedRegion(new CellRangeAddress(0, 1, 1, 1));
		sheet1.addMergedRegion(new CellRangeAddress(0, 1, 2, 2));
		sheet1.addMergedRegion(new CellRangeAddress(0, 0, 3, 8));
		sheet1.addMergedRegion(new CellRangeAddress(0, 0, 9, 10));
		sheet1.addMergedRegion(new CellRangeAddress(0, 0, 11, 13));
		sheet1.addMergedRegion(new CellRangeAddress(0, 0, 14, 15));
		sheet1.addMergedRegion(new CellRangeAddress(0, 0, 16, 18));
		sheet1.addMergedRegion(new CellRangeAddress(0, 0, 19, 23));
		sheet1.addMergedRegion(new CellRangeAddress(0, 0, 24, 30));
		sheet1.addMergedRegion(new CellRangeAddress(0, 1, 31, 31));
		sheet1.addMergedRegion(new CellRangeAddress(0, 0, 32, 33));

		List<ProjectSummary> list = service.getSummaryByMonth(pharse, orgId);
		for (int i = 0; i < list.size(); i++) {
			int j = 0;
			ProjectSummary p = list.get(i);
			Row r = sheet1.createRow(rowIndex++);
			Cell c0 = r.createCell(j++);
			c0.setCellValue(i + 1);
			c0.setCellStyle(styleDefault);

			Cell c1 = r.createCell(j++);
			c1.setCellValue(p.getTrice());
			c1.setCellStyle(styleDate);

			Cell c2 = r.createCell(j++);
			c2.setCellValue(p.getDescription());
			c2.setCellStyle(styleDefault);

			Cell c3 = r.createCell(j++);
			c3.setCellValue(p.getProjectCode());
			c3.setCellStyle(styleDefault);

			Cell c4 = r.createCell(j++);
			c4.setCellValue(p.getProjectName());
			c4.setCellStyle(styleDefault);

			Cell c5 = r.createCell(j++);
			c5.setCellValue(p.getContractAmount());
			c5.setCellStyle(styleRMB);

			Cell c6 = r.createCell(j++);
			c6.setCellValue(p.getChangeAmount());
			c6.setCellStyle(styleRMB);

			Cell c7 = r.createCell(j++);
			c7.setCellValue(p.getChangeTotalAmount());
			c7.setCellStyle(styleRMB);

			Cell c8 = r.createCell(j++);
			c8.setCellValue(p.getSettlementAmount());
			c8.setCellStyle(styleRMB);

			Cell c14 = r.createCell(j++);
			c14.setCellValue(p.getPartyBillingAmount());
			c14.setCellStyle(styleRMB);

			Cell c15 = r.createCell(j++);
			c15.setCellValue(p.getPartyBillingTotalAmount());
			c15.setCellStyle(styleRMB);

			Cell c16 = r.createCell(j++);
			c16.setCellValue(p.getCollectionsAmount());
			c16.setCellStyle(styleRMB);

			Cell c17 = r.createCell(j++);
			c17.setCellValue(p.getCollectionsTotalAmount());
			c17.setCellStyle(styleRMB);

			Cell c18 = r.createCell(j++);
			c18.setCellValue(p.getCollectionsRate() / 100);
			c18.setCellStyle(stylePercent);

			Cell c19 = r.createCell(j++);
			c19.setCellValue(p.getCustomerBillingAmount());
			c19.setCellStyle(styleRMB);

			Cell c20 = r.createCell(j++);
			c20.setCellValue(p.getCustomerBillingTotalAmount());
			c20.setCellStyle(styleRMB);

			Cell c21 = r.createCell(j++);
			c21.setCellValue(p.getPaymentAmount());
			c21.setCellStyle(styleRMB);

			Cell c22 = r.createCell(j++);
			c22.setCellValue(p.getPaymentTotalAmount());
			c22.setCellStyle(styleRMB);

			// ///////////
			Cell c23 = r.createCell(j++);
			c23.setCellValue(p.getCollectionsTotalAmount() - p.getPaymentTotalAmount());
			c23.setCellStyle(styleRMB);

			Cell c24 = r.createCell(j++);
			c24.setCellValue(p.getTaxRate() / 100);
			c24.setCellStyle(stylePercent);

			Cell c25 = r.createCell(j++);
			c25.setCellValue(p.getTaxPlanAmount());
			c25.setCellStyle(styleRMB);

			Cell c26 = r.createCell(j++);
			c26.setCellValue(p.getTaxRealAmount());
			c26.setCellStyle(styleRMB);

			Cell c27 = r.createCell(j++);
			c27.setCellValue(p.getTaxTotalAmount());
			c27.setCellStyle(styleRMB);

			Cell c28 = r.createCell(j++);
			c28.setCellValue(p.getTaxOweAmount());
			c28.setCellStyle(styleRMB);

			Cell c9 = r.createCell(j++);
			c9.setCellValue(p.getManagementRate() / 100);
			c9.setCellStyle(stylePercent);

			Cell c10 = r.createCell(j++);
			c10.setCellValue(p.getManagementPlanAmount());
			c10.setCellStyle(styleRMB);

			Cell c11 = r.createCell(j++);
			c11.setCellValue(p.getManagementRealAmount());
			c11.setCellStyle(styleRMB);

			Cell c12 = r.createCell(j++);
			c12.setCellValue(p.getManagementTotalAmount());
			c12.setCellStyle(styleRMB);

			Cell c13 = r.createCell(j++);
			c13.setCellValue(p.getManagementOweAmount());
			c13.setCellStyle(styleRMB);

			Cell c32 = r.createCell(j++);
			c32.setCellValue(Utility.parseDouble(p.getField01()));
			c32.setCellStyle(styleRMB);

			Cell c33 = r.createCell(j++);
			c33.setCellValue(Utility.parseDouble(p.getField02()));
			c33.setCellStyle(styleRMB);

			Cell c29 = r.createCell(j++);
			c29.setCellValue(p.getArrearsAmount());
			c29.setCellStyle(styleRMB);

			Cell c30 = r.createCell(j++);
			c30.setCellValue(p.getExpectedValue());
			c30.setCellStyle(styleRMB);

			Cell c31 = r.createCell(j++);
			c31.setCellValue(p.getProfilePoint());
			c31.setCellStyle(styleDefault);
		}

		ProjectSummary p = service.getTotal(list);
		int j = 0;
		Row r = sheet1.createRow(rowIndex++);

		Cell c0 = r.createCell(j++);
		c0.setCellValue(p.getProjectName());
		c0.setCellStyle(styleFooter);

		Cell c1 = r.createCell(j++);
		c1.setCellValue(p.getProjectName());
		c1.setCellStyle(styleFooter);

		Cell c2 = r.createCell(j++);
		c2.setCellValue(p.getProjectName());
		c2.setCellStyle(styleFooter);

		Cell c3 = r.createCell(j++);
		c3.setCellValue(p.getProjectName());
		c3.setCellStyle(styleFooter);

		Cell c4 = r.createCell(j++);
		c4.setCellValue(p.getProjectName());
		c4.setCellStyle(styleFooter);

		Cell c5 = r.createCell(j++);
		c5.setCellValue(p.getContractAmount());
		c5.setCellStyle(styleRMB);

		Cell c6 = r.createCell(j++);
		c6.setCellValue(p.getChangeAmount());
		c6.setCellStyle(styleRMB);

		Cell c7 = r.createCell(j++);
		c7.setCellValue(p.getChangeTotalAmount());
		c7.setCellStyle(styleRMB);

		Cell c8 = r.createCell(j++);
		c8.setCellValue(p.getSettlementAmount());
		c8.setCellStyle(styleRMB);

		Cell c14 = r.createCell(j++);
		c14.setCellValue(p.getPartyBillingAmount());
		c14.setCellStyle(styleRMB);

		Cell c15 = r.createCell(j++);
		c15.setCellValue(p.getPartyBillingTotalAmount());
		c15.setCellStyle(styleRMB);

		Cell c16 = r.createCell(j++);
		c16.setCellValue(p.getCollectionsAmount());
		c16.setCellStyle(styleRMB);

		Cell c17 = r.createCell(j++);
		c17.setCellValue(p.getCollectionsTotalAmount());
		c17.setCellStyle(styleRMB);

		Cell c18 = r.createCell(j++);
		// c18.setCellValue(p.getCollectionsRate() / 100);
		c18.setCellStyle(stylePercent);

		Cell c19 = r.createCell(j++);
		c19.setCellValue(p.getCustomerBillingAmount());
		c19.setCellStyle(styleRMB);

		Cell c20 = r.createCell(j++);
		c20.setCellValue(p.getCustomerBillingTotalAmount());
		c20.setCellStyle(styleRMB);

		Cell c21 = r.createCell(j++);
		c21.setCellValue(p.getPaymentAmount());
		c21.setCellStyle(styleRMB);

		Cell c22 = r.createCell(j++);
		c22.setCellValue(p.getPaymentTotalAmount());
		c22.setCellStyle(styleRMB);

		// ///////////
		Cell c23 = r.createCell(j++);
		c23.setCellValue(p.getCollectionsTotalAmount() - p.getPaymentTotalAmount());
		c23.setCellStyle(styleRMB);

		Cell c24 = r.createCell(j++);
		// c24.setCellValue(p.getTaxRate() / 100);
		c24.setCellStyle(styleDefault);

		Cell c25 = r.createCell(j++);
		c25.setCellValue(p.getTaxPlanAmount());
		c25.setCellStyle(styleRMB);

		Cell c26 = r.createCell(j++);
		c26.setCellValue(p.getTaxRealAmount());
		c26.setCellStyle(styleRMB);

		Cell c27 = r.createCell(j++);
		c27.setCellValue(p.getTaxTotalAmount());
		c27.setCellStyle(styleRMB);

		Cell c28 = r.createCell(j++);
		c28.setCellValue(p.getTaxOweAmount());
		c28.setCellStyle(styleRMB);

		Cell c9 = r.createCell(j++);
		// c9.setCellValue(p.getManagementRate() / 100);
		c9.setCellStyle(styleDefault);

		Cell c10 = r.createCell(j++);
		c10.setCellValue(p.getManagementPlanAmount());
		c10.setCellStyle(styleRMB);

		Cell c11 = r.createCell(j++);
		c11.setCellValue(p.getManagementRealAmount());
		c11.setCellStyle(styleRMB);

		Cell c12 = r.createCell(j++);
		c12.setCellValue(p.getManagementTotalAmount());
		c12.setCellStyle(styleRMB);

		Cell c13 = r.createCell(j++);
		c13.setCellValue(p.getManagementOweAmount());
		c13.setCellStyle(styleRMB);

		Cell c32 = r.createCell(j++);
		c32.setCellValue(Utility.parseDouble(p.getField01()));
		c32.setCellStyle(styleRMB);

		Cell c33 = r.createCell(j++);
		c33.setCellValue(Utility.parseDouble(p.getField02()));
		c33.setCellStyle(styleRMB);

		Cell c29 = r.createCell(j++);
		c29.setCellValue(p.getArrearsAmount());
		c29.setCellStyle(styleRMB);

		Cell c30 = r.createCell(j++);
		c30.setCellValue(p.getExpectedValue());
		c30.setCellStyle(styleRMB);

		Cell c31 = r.createCell(j++);
		// c31.setCellValue(p.getProfilePoint());
		c31.setCellStyle(styleDefault);

		for (int i = 0; i < headers.length; i++) {
			sheet1.autoSizeColumn(i, true);
		}

		sheet1.addMergedRegion(new CellRangeAddress(rowIndex - 1, rowIndex - 1, 0, 4));

		wb.write(response.getOutputStream());
	}

	@RequestMapping(value = "/export-year")
	public void exportYearExcel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "orgid", required = false) String orgId) throws Exception {

		final String EXCEL_HEADERS = "年份,工程数,累计合同金额,累计调增额,合同结算额,累计甲方开票,累计收款,累计客户开票,累计支付工程款,累计已缴税金,应收管理费,累计收管理费,其他收入,管理费及其他收入累计,垫付资金,型材（吨）";

		if (StringUtils.isBlank(orgId)) {
			if (SessionHelper.IsBusinessDepartment()) {
				// 如果是业务部门，并且未指定按单位的过滤条件
				orgId = SessionHelper.getCurrentSysUser().getOrganizationId();
			}
		}

		SysOrganization org = orgService.get(orgId);
		String orgName = org != null ? org.getOrganizationName() : Utility.EMPTY;
		String sheetName = orgName + "年度汇总报表";

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		String fileName = URLEncoder.encode("total-year-data.xlsx", "UTF-8");
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

		CellStyle styleInt = wb.createCellStyle();
		styleInt.cloneStyleFrom(styleDefault);
		styleInt.setDataFormat(createHelper.createDataFormat().getFormat("#,##0"));

		CellStyle styleRMB = wb.createCellStyle();
		styleRMB.cloneStyleFrom(styleDefault);
		styleRMB.setDataFormat(createHelper.createDataFormat().getFormat("#,##0.00"));

		Row r0 = sheet1.createRow(rowIndex++);
		String[] headers = EXCEL_HEADERS.split(",");
		for (int i = 0; i < headers.length; i++) {
			Cell c = r0.createCell(i);
			c.setCellValue(headers[i]);
			c.setCellStyle(styleHeader);
		}

		List<ProjectSummary> list = service.getSummaryByYear(orgId);
		for (int i = 0; i < list.size(); i++) {
			int j = 0;
			ProjectSummary p = list.get(i);
			Row r = sheet1.createRow(rowIndex++);
			Cell c0 = r.createCell(j++);
			c0.setCellValue(p.getField01());
			c0.setCellStyle(styleDefault);

			Cell c1 = r.createCell(j++);
			c1.setCellValue(Utility.parseInt(p.getField04()));
			c1.setCellStyle(styleInt);

			Cell c2 = r.createCell(j++);
			c2.setCellValue(p.getContractAmount());
			c2.setCellStyle(styleRMB);

			Cell c3 = r.createCell(j++);
			c3.setCellValue(p.getChangeAmount());
			c3.setCellStyle(styleRMB);

			Cell c6 = r.createCell(j++);
			c6.setCellValue(p.getSettlementAmount());
			c6.setCellStyle(styleRMB);

			Cell c7 = r.createCell(j++);
			c7.setCellValue(p.getPartyBillingAmount());
			c7.setCellStyle(styleRMB);

			Cell c8 = r.createCell(j++);
			c8.setCellValue(p.getCollectionsAmount());
			c8.setCellStyle(styleRMB);

			Cell c9 = r.createCell(j++);
			c9.setCellValue(p.getCustomerBillingAmount());
			c9.setCellStyle(styleRMB);

			Cell c10 = r.createCell(j++);
			c10.setCellValue(p.getPaymentAmount());
			c10.setCellStyle(styleRMB);

			Cell c11 = r.createCell(j++);
			c11.setCellValue(p.getTaxRealAmount());
			c11.setCellStyle(styleRMB);

			Cell c12 = r.createCell(j++);
			c12.setCellValue(p.getManagementPlanAmount());
			c12.setCellStyle(styleRMB);

			Cell c13 = r.createCell(j++);
			c13.setCellValue(p.getManagementRealAmount());
			c13.setCellStyle(styleRMB);

			Cell c14 = r.createCell(j++);
			c14.setCellValue(Utility.parseDouble(p.getField02()));
			c14.setCellStyle(styleRMB);

			Cell c15 = r.createCell(j++);
			c15.setCellValue(Utility.parseDouble(p.getField03()));
			c15.setCellStyle(styleRMB);

			Cell c16 = r.createCell(j++);
			c16.setCellValue(p.getArrearsAmount());
			c16.setCellStyle(styleRMB);

			Cell c17 = r.createCell(j++);
			c17.setCellValue(p.getExpectedValue());
			c17.setCellStyle(styleRMB);
		}

		for (int i = 0; i < headers.length; i++) {
			sheet1.autoSizeColumn(i, true);
		}

		wb.write(response.getOutputStream());
	}

}
