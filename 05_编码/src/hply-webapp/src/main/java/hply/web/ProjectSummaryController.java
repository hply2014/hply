package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.ProjectSummary;
import hply.domain.SysOrganization;
import hply.domain.SysUser;
import hply.service.ProjectSummaryService;
import hply.service.SysOrganizationService;
import hply.service.SysParameterService;
import hply.service.SysUserService;

import java.lang.reflect.Method;
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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping(value = ProjectSummaryController.URI)
public class ProjectSummaryController {

	@Autowired
	private ProjectSummaryService service;

	@Autowired
	private SysOrganizationService orgService;

	@Autowired
	private SysParameterService paramService;

	@Autowired
	private SysUserService userService;
	

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
	public String listFull(@RequestParam(value = "p1", required = false) String p1,
			@RequestParam(value = "p2", required = false) String p2, @RequestParam(value = "orgid", required = false) String orgId,
			Model model) {
		model.addAttribute("page_title", "项目汇总报表");
		
		//获取列表显示列参数
		SysUser sysUser = SessionHelper.getCurrentSysUser();
		sysUser = userService.get(sysUser.getId());
		JSONObject exportExcelSetting = JSON.parseObject(sysUser.getExportExcelSetting());
		JSONObject full = new JSONObject();
		if(exportExcelSetting!=null){
			full = exportExcelSetting.getJSONObject("full");
		}
		if(full == null){
			full = new JSONObject();
			full.put("columns", "");
		}
		model.addAttribute("columns", full.getString("columns"));

		List<String> months = service.getMonths();
		Utility.println("lst.size()=" + months.size());
		model.addAttribute("months", months);

		if (StringUtils.isBlank(p1)) {
			p1 = months.size() > 0 ? months.get(0) : DateFormatUtils.format(new Date(), "yyyy-MM");
			p2 = p1;
		}

		Calendar c0 = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		try {
			Date d1 = DateUtils.parseDate(p1 + "-01", "yyyy-MM-dd");
			c0.setTime(d1);
			Date d2 = DateUtils.parseDate(p2 + "-01", "yyyy-MM-dd");
			c1.setTime(d2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		c1.add(Calendar.MONTH, 1);
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
		List<ProjectSummary> list = service.getSummaryByMonth(p1, p2, orgId);
		model.addAttribute("projectSummaryTotal", service.getTotal(list));
		model.addAttribute("list", list);

		model.addAttribute("p1", p1);
		model.addAttribute("p2", p2);
		model.addAttribute("orgId", orgId);

		return "projectsummary-list-full";
	}

	/*
	 * 列表页面
	 */
	@RequestMapping(value = "/year", method = RequestMethod.GET)
	public String listYear(@RequestParam(value = "orgid", required = false) String orgId, Model model,HttpServletRequest request,HttpServletResponse response) {
		model.addAttribute("page_title", "年度汇总报表");

		//获取列表显示列参数
		SysUser sysUser = SessionHelper.getCurrentSysUser();
		sysUser = userService.get(sysUser.getId());
		JSONObject exportExcelSetting = JSON.parseObject(sysUser.getExportExcelSetting());
		JSONObject year = new JSONObject();
		if(exportExcelSetting!=null){
			year = exportExcelSetting.getJSONObject("year");
		}
		if(year == null){
			year = new JSONObject();
			year.put("columns", "");
		}
		model.addAttribute("columns", year.getString("columns"));
		
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
	 * 列表页面
	 */
	@RequestMapping(value = "/yeardetail", method = RequestMethod.GET)
	public String listYearDetail(@RequestParam(value = "p1", required = false) String p1,
			@RequestParam(value = "orgid", required = false) String orgId, Model model) {
		model.addAttribute("page_title", "项目汇总报表");
		
		//获取列表显示列参数
		SysUser sysUser = SessionHelper.getCurrentSysUser();
		sysUser = userService.get(sysUser.getId());
		JSONObject exportExcelSetting = JSON.parseObject(sysUser.getExportExcelSetting());
		JSONObject yeardetail = new JSONObject();
		if(exportExcelSetting!=null){
			yeardetail = exportExcelSetting.getJSONObject("yeardetail");
		}
		if(yeardetail == null){
			yeardetail = new JSONObject();
			yeardetail.put("columns", "");
		}
		model.addAttribute("columns", yeardetail.getString("columns"));
		
		SysOrganization sysOrganization =orgService.get(orgId);
		model.addAttribute("orgName", sysOrganization.getOrganizationName());
		
		List<ProjectSummary> list = service.getSummaryByYearDetail(p1, orgId);
		model.addAttribute("projectSummaryTotal", service.getTotal(list));
		model.addAttribute("list", list);

		model.addAttribute("p1", p1);
		model.addAttribute("orgId", orgId);

		return "projectsummary-list-year-detail";
	}

	/*
	 * 列表页面
	 */
	@RequestMapping(value = "/month", method = RequestMethod.GET)
	public String listMonth(@RequestParam(value = "orgid", required = false) String orgId,
			@RequestParam(value = "p1", required = false) String p1, Model model) {
		model.addAttribute("page_title", "新建工程月度汇总报表");
		
		//获取列表显示列参数
		SysUser sysUser = SessionHelper.getCurrentSysUser();
		sysUser = userService.get(sysUser.getId());
		JSONObject exportExcelSetting = JSON.parseObject(sysUser.getExportExcelSetting());
		JSONObject month = new JSONObject();
		if(exportExcelSetting!=null){
			month = exportExcelSetting.getJSONObject("month");
		}
		if(month == null){
			month = new JSONObject();
			month.put("columns", "");
		}
		model.addAttribute("columns", month.getString("columns"));

		List<String> months = service.getMonths();
		Utility.println("lst.size()=" + months.size());
		model.addAttribute("months", months);

		if (StringUtils.isBlank(p1)) {
			p1 = months.size() > 0 ? months.get(0) : DateFormatUtils.format(new Date(), "yyyy-MM");
		}

		Calendar c0 = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		try {
			Date d1 = DateUtils.parseDate(p1 + "-01", "yyyy-MM-dd");
			c0.setTime(d1);
			c1.setTime(d1);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		c1.add(Calendar.MONTH, 1);
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
		List<ProjectSummary> list = service.getSummaryByCurrentMonth(p1, orgId);
		model.addAttribute("projectSummaryTotal", service.getTotal(list));
		model.addAttribute("list", list);

		model.addAttribute("p1", p1);
		model.addAttribute("orgId", orgId);

		return "projectsummary-list-month";
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
		return "redirect:" + SessionHelper.getLastUrl(URI);
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
		return "redirect:" + SessionHelper.getLastUrl(URI);
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
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	@RequestMapping(value = "/export")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "p1", required = false) String p1, @RequestParam(value = "p2", required = false) String p2,
			@RequestParam(value = "orgid", required = false) String orgId) throws Exception {


//		String EXCEL_HEADERS = "序号,时间,摘要,项目编号,项目名称,项目实施人,合同税率,合同金额,合同分类,合同签订日期,合同调增额,合同结算额,金额,销项税金,累计开票,累计收款,回收率,金额,进项税金,累计开票,工程款累计支付,工程余额,异地税金,比率,税负率税金,当期应缴税金,累计已缴税金,比率,应收管理费,本期收管理费,累计收管理费,尚欠管理费,其他收入,管理费及其他收入累计,往来欠款,预计用量（吨）,预计用量（平米）,型材点";
//		String EXCEL_COLUMNS = "trice,description,projectCode,projectName,field03,contractTaxRate,contractAmount,contractType,contractDate,changeTotalAmount,settlementAmount,partyBillingAmount,partyBillingOutputTaxAmount,partyBillingTotalAmount,collectionsTotalAmount,collectionsRate,customerBillingAmount,customerBillingInputTaxAmount,customerBillingTotalAmount,paymentTotalAmount,projectBalance,paymentDifferentTaxAmount,taxRate,taxBearingAmount,taxPlanAmount,taxTotalAmount,managementRate,managementPlanAmount,managementRealAmount,managementTotalAmount,managementOweAmount,field01,field02,arrearsAmount,expectedValueTon,expectedValueSquareMeter,profilePoint";

		String EXCEL_HEADERS = "序号,时间,摘要,项目编号,项目名称,项目实施人,合同税率,合同金额,合同分类,合同签订日期,合同调增额,合同结算额,金额,销项税金,累计开票,累计收款,回收率,金额,进项税金,累计开票,工程款累计支付,工程余额,"
				+ "税负率,应收税负率税金,当期已收税负率税金,累计已收税负率税金,应缴税金,当期异地已缴税金,累计异地已缴税金,"
				+ "比率,应收管理费,本期收管理费,累计收管理费,尚欠管理费,其他收入,管理费及其他收入累计,往来欠款,预计用量（吨）,预计用量（平米）,型材点";
		String EXCEL_COLUMNS = "trice,description,projectCode,projectName,field03,contractTaxRate,contractAmount,contractType,contractDate,changeTotalAmount,settlementAmount,partyBillingAmount,partyBillingOutputTaxAmount,partyBillingTotalAmount,collectionsTotalAmount,collectionsRate,customerBillingAmount,customerBillingInputTaxAmount,customerBillingTotalAmount,paymentTotalAmount,projectBalance,"
				+ "taxBearingRate,taxBearingAmount,taxBearingRealAmount,taxBearingTotalRealAmount,taxPlanAmount,paymentDifferentTaxAmount,paymentTotalDifferentTaxAmount,"
				+ "managementRate,managementPlanAmount,managementRealAmount,managementTotalAmount,managementOweAmount,field01,field02,arrearsAmount,expectedValueTon,expectedValueSquareMeter,profilePoint";
		
		//获取列表显示列参数
		SysUser sysUser = SessionHelper.getCurrentSysUser();
		sysUser = userService.get(sysUser.getId());
		JSONObject exportExcelSetting = JSON.parseObject(sysUser.getExportExcelSetting());
		JSONObject full = new JSONObject();
		if(exportExcelSetting!=null){
			full = exportExcelSetting.getJSONObject("full");
			if(StringUtils.isNotEmpty(full.getString("heads"))){
				EXCEL_HEADERS = "序号," + full.getString("heads");
			}
			if(StringUtils.isNotEmpty(full.getString("columns"))){
				EXCEL_COLUMNS = full.getString("columns");
			}
		}
		// 去掉时间和摘要
		if(EXCEL_HEADERS.contains(",时间,")){
			EXCEL_HEADERS = EXCEL_HEADERS.replace(",时间,", ",");
		}
		if(EXCEL_HEADERS.contains(",摘要,")){
			EXCEL_HEADERS = EXCEL_HEADERS.replace(",摘要,", ",");
		}
		if(EXCEL_COLUMNS.contains("trice,")){
			EXCEL_COLUMNS = EXCEL_COLUMNS.replace("trice,", "");
		}
		if(EXCEL_COLUMNS.contains("description,")){
			EXCEL_COLUMNS = EXCEL_COLUMNS.replace("description,", "");
		}
		
		if (StringUtils.isBlank(orgId)) {
			if (SessionHelper.IsBusinessDepartment()) {
				// 如果是业务部门，并且未指定按单位的过滤条件
				orgId = SessionHelper.getCurrentSysUser().getOrganizationId();
			}
		}

		SysOrganization org = orgService.get(orgId);
		String orgName = org != null ? org.getOrganizationName() : Utility.EMPTY;
		String sheetName = orgName + "合同项目汇总（" + p1 + "至" + p2 + "）";

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		String fileName = URLEncoder.encode("totaldata-" + p1 + "至" + p2 + ".xlsx", "UTF-8");
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
			Cell c0 = r0.createCell(i);
			c0.setCellStyle(styleHeader);

			Cell c1 = r1.createCell(i);
			c1.setCellValue(headers[i]);
			c1.setCellStyle(styleHeader);
		}
		int cellIndex = 0;
		r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
		sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
		cellIndex++;
		int countTotal = 0;
		
		if(EXCEL_COLUMNS.contains("trice")){
			r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
			sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
			cellIndex++;
			countTotal++;
		}
		
		if(EXCEL_COLUMNS.contains("description")){
			r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
			sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
			cellIndex++;
			countTotal++;
		}
		
		if(EXCEL_COLUMNS.contains("projectCode") || EXCEL_COLUMNS.contains("projectName") || EXCEL_COLUMNS.contains("field03") || EXCEL_COLUMNS.contains("contractTaxRate") || EXCEL_COLUMNS.contains("contractAmount") || EXCEL_COLUMNS.contains("contractType") || EXCEL_COLUMNS.contains("contractDate") || EXCEL_COLUMNS.contains("changeTotalAmount") || EXCEL_COLUMNS.contains("settlementAmount")){
			r0.getCell(cellIndex).setCellValue("项目信息");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("projectCode")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("projectName")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("field03")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("contractTaxRate")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("contractAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("contractType")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("contractDate")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("changeTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("settlementAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("partyBillingAmount") || EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount") || EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
			r0.getCell(cellIndex).setCellValue("甲方开票情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("partyBillingAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("collectionsTotalAmount") || EXCEL_COLUMNS.contains("collectionsRate")){
			r0.getCell(cellIndex).setCellValue("收款情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("collectionsTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("collectionsRate")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("customerBillingAmount") || EXCEL_COLUMNS.contains("customerBillingInputTaxAmount") || EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
			r0.getCell(cellIndex).setCellValue("客户开票情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("customerBillingAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("customerBillingInputTaxAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("paymentTotalAmount") || EXCEL_COLUMNS.contains("projectBalance")){
			r0.getCell(cellIndex).setCellValue("支付工程款情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("paymentTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("projectBalance")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}
		
		if(EXCEL_COLUMNS.contains("taxBearingRate") || EXCEL_COLUMNS.contains("taxBearingAmount") || EXCEL_COLUMNS.contains("taxBearingRealAmount") || EXCEL_COLUMNS.contains("taxBearingTotalRealAmount") || EXCEL_COLUMNS.contains("taxPlanAmount") || EXCEL_COLUMNS.contains("paymentDifferentTaxAmount") || EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
			r0.getCell(cellIndex).setCellValue("税金情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("taxBearingRate")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxBearingAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxBearingRealAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxBearingTotalRealAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxPlanAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("paymentDifferentTaxAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("managementRate") || EXCEL_COLUMNS.contains("managementPlanAmount") || EXCEL_COLUMNS.contains("managementRealAmount") || EXCEL_COLUMNS.contains("managementTotalAmount") || EXCEL_COLUMNS.contains("managementOweAmount") || EXCEL_COLUMNS.contains("field01") || EXCEL_COLUMNS.contains("field02")){
			r0.getCell(cellIndex).setCellValue("管理费及其他收入情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("managementRate")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementPlanAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementRealAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementOweAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("field01")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("field02")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}
		
		if(EXCEL_COLUMNS.contains("arrearsAmount")){
			r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
			sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
			cellIndex++;
		}

		if(EXCEL_COLUMNS.contains("expectedValueTon") || EXCEL_COLUMNS.contains("expectedValueSquareMeter") || EXCEL_COLUMNS.contains("profilePoint")){
			r0.getCell(cellIndex).setCellValue("型材");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("expectedValueTon")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("expectedValueSquareMeter")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("profilePoint")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		List<ProjectSummary> list = service.getSummaryByMonth(p1, p2, orgId);

		for (int i = 0; i < list.size(); i++) {
			int j = 0;
			ProjectSummary p = list.get(i);
			Row r = sheet1.createRow(rowIndex++);
			Cell c = r.createCell(j++);
			c.setCellValue(i + 1);
			c.setCellStyle(styleDefault);
			
			if(EXCEL_COLUMNS.contains("trice")){
				c = r.createCell(j++);
				c.setCellValue(p.getTrice());
				c.setCellStyle(styleDate);
			}

			if(EXCEL_COLUMNS.contains("description")){
				c = r.createCell(j++);
				c.setCellValue(p.getDescription());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("projectCode")){
				c = r.createCell(j++);
				c.setCellValue(p.getProjectCode());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("projectName")){
				c = r.createCell(j++);
				c.setCellValue(p.getProjectName());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("field03")){
				c = r.createCell(j++);
				c.setCellValue(p.getField03());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("contractTaxRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getContractTaxRate());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("contractAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getContractAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("contractType")){
				c = r.createCell(j++);
				c.setCellValue(p.getContractType());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("contractDate")){
				c = r.createCell(j++);
				if(p.getContractDate()!=null){
					c.setCellValue(p.getContractDate());
				}
				c.setCellStyle(styleDate);
			}

			/*if(EXCEL_COLUMNS.contains("changeAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getChangeAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("changeTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getChangeTotalAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("settlementAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getSettlementAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("partyBillingAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPartyBillingAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPartyBillingOutputTaxAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPartyBillingTotalAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("collectionsAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("collectionsTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("collectionsRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsRate() / 100);
				c.setCellStyle(stylePercent);
			}

			if(EXCEL_COLUMNS.contains("customerBillingAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCustomerBillingAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("customerBillingInputTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCustomerBillingInputTaxAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCustomerBillingTotalAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("paymentAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("paymentTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentTotalAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("projectBalance")){
				// ///////////
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount() - p.getPaymentTotalAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("taxRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxRate() / 100);
				c.setCellStyle(stylePercent);
			}*/

			
			if(EXCEL_COLUMNS.contains("taxBearingRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingRate());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxBearingAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxBearingRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingRealAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxBearingTotalRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingTotalRealAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxPlanAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxPlanAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("paymentDifferentTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentDifferentTaxAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentTotalDifferentTaxAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("taxRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxRealAmount());
				c.setCellStyle(styleRMB);
			}*/

			/*if(EXCEL_COLUMNS.contains("taxTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxTotalAmount());
				c.setCellStyle(styleRMB);
			}*/

			/*if(EXCEL_COLUMNS.contains("taxOweAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxOweAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("managementRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementRate() / 100);
				c.setCellStyle(stylePercent);
			}

			if(EXCEL_COLUMNS.contains("managementPlanAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementPlanAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("managementRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementRealAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("managementTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementTotalAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("managementOweAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementOweAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("field01")){
				c = r.createCell(j++);
				c.setCellValue(Utility.parseDouble(p.getField01()));
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("field02")){
				c = r.createCell(j++);
				c.setCellValue(Utility.parseDouble(p.getField02()));
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("arrearsAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getArrearsAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("expectedValue")){
				c = r.createCell(j++);
				c.setCellValue(p.getExpectedValue());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("expectedValueTon")){
				c = r.createCell(j++);
				c.setCellValue(p.getExpectedValueTon());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("expectedValueSquareMeter")){
				c = r.createCell(j++);
				c.setCellValue(p.getExpectedValueSquareMeter());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("profilePoint")){
				c = r.createCell(j++);
				c.setCellValue(p.getProfilePoint());
				c.setCellStyle(styleDefault);
			}
		}
		
		
		ProjectSummary p = service.getTotal(list);
		int j = 0;
		Row r = sheet1.createRow(rowIndex++);

		Cell c = r.createCell(j++);
		c.setCellValue(p.getProjectName());
		c.setCellStyle(styleFooter);
		
		for(;j <= countTotal;){
			c = r.createCell(j++);
			c.setCellStyle(styleFooter);
		}
		
		if(EXCEL_COLUMNS.contains("contractAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getContractAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("contractType")){
			c = r.createCell(j++);
			//c.setCellValue(p.getContractType());
			c.setCellStyle(styleDefault);
		}
		
		if(EXCEL_COLUMNS.contains("contractDate")){
			c = r.createCell(j++);
			//c.setCellValue(p.getContractDate());
			c.setCellStyle(styleDate);
		}
		
		/*if(EXCEL_COLUMNS.contains("changeAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getChangeAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("changeTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getChangeTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("settlementAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getSettlementAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("partyBillingAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPartyBillingAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPartyBillingOutputTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPartyBillingTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("collectionsAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCollectionsAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("collectionsTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("collectionsRate")){
			c = r.createCell(j++);
			// c.setCellValue(p.getCollectionsRate() / 100);
			c.setCellStyle(stylePercent);
		}
		
		if(EXCEL_COLUMNS.contains("customerBillingAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCustomerBillingAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("customerBillingInputTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCustomerBillingInputTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCustomerBillingTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("paymentAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("paymentTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("projectBalance")){
			// ///////////
			c = r.createCell(j++);
			// TODO 还是不对
			c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount() - p.getPaymentTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("taxRate")){
			c = r.createCell(j++);
			// c.setCellValue(p.getTaxRate() / 100);
			c.setCellStyle(styleDefault);
		}*/

		if(EXCEL_COLUMNS.contains("taxBearingRate")){
			c = r.createCell(j++);
			// c.setCellValue(p.getTaxBearingRate());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxBearingAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxBearingAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxBearingRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxBearingRealAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxBearingTotalRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxBearingTotalRealAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxPlanAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxPlanAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("paymentDifferentTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentDifferentTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentTotalDifferentTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("taxRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxRealAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		/*if(EXCEL_COLUMNS.contains("taxTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxTotalAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		/*if(EXCEL_COLUMNS.contains("taxOweAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxOweAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("managementRate")){
			c = r.createCell(j++);
			// c.setCellValue(p.getManagementRate() / 100);
			c.setCellStyle(styleDefault);
		}
		
		if(EXCEL_COLUMNS.contains("managementPlanAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementPlanAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("managementRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementRealAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("managementTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("managementOweAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementOweAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("field01")){
			c = r.createCell(j++);
			c.setCellValue(Utility.parseDouble(p.getField01()));
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("field02")){
			c = r.createCell(j++);
			c.setCellValue(Utility.parseDouble(p.getField02()));
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("arrearsAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getArrearsAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("expectedValue")){
			c = r.createCell(j++);
			c.setCellValue(p.getExpectedValue());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("expectedValueTon")){
			c = r.createCell(j++);
			c.setCellValue(p.getExpectedValueTon());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("expectedValueSquareMeter")){
			c = r.createCell(j++);
			c.setCellValue(p.getExpectedValueSquareMeter());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("profilePoint")){
			c = r.createCell(j++);
			// c.setCellValue(p.getProfilePoint());
			c.setCellStyle(styleDefault);
		}
		
		for (int i = 0; i < headers.length; i++) {
			sheet1.autoSizeColumn(i, true);
		}

		sheet1.addMergedRegion(new CellRangeAddress(rowIndex - 1, rowIndex - 1, 0, countTotal));

		wb.write(response.getOutputStream());
	}

	@RequestMapping(value = "/export-month")
	public void exportMonthExcel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "p1", required = false) String p1, @RequestParam(value = "orgid", required = false) String orgId)
			throws Exception {

//		String EXCEL_HEADERS = "序号,时间,摘要,项目编号,项目名称,项目实施人,合同税率,合同金额,合同分类,合同签订日期,合同调增额,合同结算额,金额,销项税金,累计开票,累计收款,回收率,金额,进项税金,累计开票,工程款累计支付,工程余额,异地税金,比率,税负率税金,当期应缴税金,累计已缴税金,比率,应收管理费,本期收管理费,累计收管理费,尚欠管理费,其他收入,管理费及其他收入累计,往来欠款,预计用量（吨）,预计用量（平米）,型材点";
//		String EXCEL_COLUMNS = "trice,description,projectCode,projectName,field03,contractTaxRate,contractAmount,contractType,contractDate,changeTotalAmount,settlementAmount,partyBillingAmount,partyBillingOutputTaxAmount,partyBillingTotalAmount,collectionsTotalAmount,collectionsRate,customerBillingAmount,customerBillingInputTaxAmount,customerBillingTotalAmount,paymentTotalAmount,projectBalance,paymentDifferentTaxAmount,taxRate,taxBearingAmount,taxPlanAmount,taxTotalAmount,managementRate,managementPlanAmount,managementRealAmount,managementTotalAmount,managementOweAmount,field01,field02,arrearsAmount,expectedValueTon,expectedValueSquareMeter,profilePoint";
		
		String EXCEL_HEADERS = "序号,时间,摘要,项目编号,项目名称,项目实施人,合同税率,合同金额,合同分类,合同签订日期,合同调增额,合同结算额,金额,销项税金,累计开票,累计收款,回收率,金额,进项税金,累计开票,工程款累计支付,工程余额,"
				+ "税负率,应收税负率税金,当期已收税负率税金,累计已收税负率税金,应缴税金,当期异地已缴税金,累计异地已缴税金,"
				+ "比率,应收管理费,本期收管理费,累计收管理费,尚欠管理费,其他收入,管理费及其他收入累计,往来欠款,预计用量（吨）,预计用量（平米）,型材点";
		String EXCEL_COLUMNS = "trice,description,projectCode,projectName,field03,contractTaxRate,contractAmount,contractType,contractDate,changeTotalAmount,settlementAmount,partyBillingAmount,partyBillingOutputTaxAmount,partyBillingTotalAmount,collectionsTotalAmount,collectionsRate,customerBillingAmount,customerBillingInputTaxAmount,customerBillingTotalAmount,paymentTotalAmount,projectBalance,"
				+ "taxBearingRate,taxBearingAmount,taxBearingRealAmount,taxBearingTotalRealAmount,taxPlanAmount,paymentDifferentTaxAmount,paymentTotalDifferentTaxAmount,"
				+ "managementRate,managementPlanAmount,managementRealAmount,managementTotalAmount,managementOweAmount,field01,field02,arrearsAmount,expectedValueTon,expectedValueSquareMeter,profilePoint";
		
		//获取列表显示列参数
		SysUser sysUser = SessionHelper.getCurrentSysUser();
		sysUser = userService.get(sysUser.getId());
		JSONObject exportExcelSetting = JSON.parseObject(sysUser.getExportExcelSetting());
		JSONObject month = new JSONObject();
		if(exportExcelSetting!=null){
			month = exportExcelSetting.getJSONObject("month");
			if(StringUtils.isNotEmpty(month.getString("heads"))){
				EXCEL_HEADERS = "序号," + month.getString("heads");
			}
			if(StringUtils.isNotEmpty(month.getString("columns"))){
				EXCEL_COLUMNS = month.getString("columns");
			}
		}
		// 去掉时间和摘要
		if(EXCEL_HEADERS.contains(",时间,")){
			EXCEL_HEADERS = EXCEL_HEADERS.replace(",时间,", ",");
		}
		if(EXCEL_HEADERS.contains(",摘要,")){
			EXCEL_HEADERS = EXCEL_HEADERS.replace(",摘要,", ",");
		}
		if(EXCEL_COLUMNS.contains("trice,")){
			EXCEL_COLUMNS = EXCEL_COLUMNS.replace("trice,", "");
		}
		if(EXCEL_COLUMNS.contains("description,")){
			EXCEL_COLUMNS = EXCEL_COLUMNS.replace("description,", "");
		}
		
		if (StringUtils.isBlank(orgId)) {
			if (SessionHelper.IsBusinessDepartment()) {
				// 如果是业务部门，并且未指定按单位的过滤条件
				orgId = SessionHelper.getCurrentSysUser().getOrganizationId();
			}
		}

		SysOrganization org = orgService.get(orgId);
		String orgName = org != null ? org.getOrganizationName() : Utility.EMPTY;
		String sheetName = orgName + "合同项目汇总（" + p1 + "）";

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		String fileName = URLEncoder.encode("totaldata-" + p1 + ".xlsx", "UTF-8");
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
			Cell c0 = r0.createCell(i);
			c0.setCellStyle(styleHeader);

			Cell c1 = r1.createCell(i);
			c1.setCellValue(headers[i]);
			c1.setCellStyle(styleHeader);
		}
		
		int cellIndex = 0;
		r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
		sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
		cellIndex++;
		int countTotal = 0;
		
		if(EXCEL_COLUMNS.contains("trice")){
			r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
			sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
			cellIndex++;
			countTotal++;
		}
		
		if(EXCEL_COLUMNS.contains("description")){
			r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
			sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
			cellIndex++;
			countTotal++;
		}
		
		if(EXCEL_COLUMNS.contains("projectCode") || EXCEL_COLUMNS.contains("projectName") || EXCEL_COLUMNS.contains("field03") || EXCEL_COLUMNS.contains("contractTaxRate") || EXCEL_COLUMNS.contains("contractAmount") || EXCEL_COLUMNS.contains("contractType") || EXCEL_COLUMNS.contains("contractDate") || EXCEL_COLUMNS.contains("changeTotalAmount") || EXCEL_COLUMNS.contains("settlementAmount")){
			r0.getCell(cellIndex).setCellValue("项目信息");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("projectCode")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("projectName")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("field03")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("contractTaxRate")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("contractAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("contractType")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("contractDate")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("changeTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("settlementAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("partyBillingAmount") || EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount") || EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
			r0.getCell(cellIndex).setCellValue("甲方开票情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("partyBillingAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("collectionsTotalAmount") || EXCEL_COLUMNS.contains("collectionsRate")){
			r0.getCell(cellIndex).setCellValue("收款情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("collectionsTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("collectionsRate")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("customerBillingAmount") || EXCEL_COLUMNS.contains("customerBillingInputTaxAmount") || EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
			r0.getCell(cellIndex).setCellValue("客户开票情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("customerBillingAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("customerBillingInputTaxAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("paymentTotalAmount") || EXCEL_COLUMNS.contains("projectBalance")){
			r0.getCell(cellIndex).setCellValue("支付工程款情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("paymentTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("projectBalance")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}
		if(EXCEL_COLUMNS.contains("taxBearingRate") || EXCEL_COLUMNS.contains("taxBearingAmount") || EXCEL_COLUMNS.contains("taxBearingRealAmount") || EXCEL_COLUMNS.contains("taxBearingTotalRealAmount") || EXCEL_COLUMNS.contains("taxPlanAmount") || EXCEL_COLUMNS.contains("paymentDifferentTaxAmount") || EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
			r0.getCell(cellIndex).setCellValue("税金情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("taxBearingRate")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxBearingAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxBearingRealAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxBearingTotalRealAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxPlanAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("paymentDifferentTaxAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("managementRate") || EXCEL_COLUMNS.contains("managementPlanAmount") || EXCEL_COLUMNS.contains("managementRealAmount") || EXCEL_COLUMNS.contains("managementTotalAmount") || EXCEL_COLUMNS.contains("managementOweAmount") || EXCEL_COLUMNS.contains("field01") || EXCEL_COLUMNS.contains("field02")){
			r0.getCell(cellIndex).setCellValue("管理费及其他收入情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("managementRate")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementPlanAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementRealAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementOweAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("field01")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("field02")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}
		
		if(EXCEL_COLUMNS.contains("arrearsAmount")){
			r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
			sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
			cellIndex++;
		}

		if(EXCEL_COLUMNS.contains("expectedValueTon") || EXCEL_COLUMNS.contains("expectedValueSquareMeter") || EXCEL_COLUMNS.contains("profilePoint")){
			r0.getCell(cellIndex).setCellValue("型材");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("expectedValueTon")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("expectedValueSquareMeter")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("profilePoint")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		List<ProjectSummary> list = service.getSummaryByCurrentMonth(p1, orgId);

		for (int i = 0; i < list.size(); i++) {
			int j = 0;
			ProjectSummary p = list.get(i);
			Row r = sheet1.createRow(rowIndex++);
			Cell c = r.createCell(j++);
			c.setCellValue(i + 1);
			c.setCellStyle(styleDefault);
			
			if(EXCEL_COLUMNS.contains("trice")){
				c = r.createCell(j++);
				c.setCellValue(p.getTrice());
				c.setCellStyle(styleDate);
			}

			if(EXCEL_COLUMNS.contains("description")){
				c = r.createCell(j++);
				c.setCellValue(p.getDescription());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("projectCode")){
				c = r.createCell(j++);
				c.setCellValue(p.getProjectCode());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("projectName")){
				c = r.createCell(j++);
				c.setCellValue(p.getProjectName());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("field03")){
				c = r.createCell(j++);
				c.setCellValue(p.getField03());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("contractTaxRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getContractTaxRate());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("contractAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getContractAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("contractType")){
				c = r.createCell(j++);
				c.setCellValue(p.getContractType());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("contractDate")){
				c = r.createCell(j++);
				if(p.getContractDate()!=null){
					c.setCellValue(p.getContractDate());
				}
				c.setCellStyle(styleDate);
			}

			/*if(EXCEL_COLUMNS.contains("changeAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getChangeAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("changeTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getChangeTotalAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("settlementAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getSettlementAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("partyBillingAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPartyBillingAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPartyBillingOutputTaxAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPartyBillingTotalAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("collectionsAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("collectionsTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("collectionsRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsRate() / 100);
				c.setCellStyle(stylePercent);
			}

			if(EXCEL_COLUMNS.contains("customerBillingAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCustomerBillingAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("customerBillingInputTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCustomerBillingInputTaxAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCustomerBillingTotalAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("paymentAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("paymentTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentTotalAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("projectBalance")){
				// ///////////
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount() - p.getPaymentTotalAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("taxRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxRate() / 100);
				c.setCellStyle(stylePercent);
			}*/


			
			if(EXCEL_COLUMNS.contains("taxBearingRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingRate());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxBearingAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxBearingRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingRealAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxBearingTotalRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingTotalRealAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxPlanAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxPlanAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("paymentDifferentTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentDifferentTaxAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentTotalDifferentTaxAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("taxRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxRealAmount());
				c.setCellStyle(styleRMB);
			}*/

			/*if(EXCEL_COLUMNS.contains("taxTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxTotalAmount());
				c.setCellStyle(styleRMB);
			}*/

			/*if(EXCEL_COLUMNS.contains("taxOweAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxOweAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("managementRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementRate() / 100);
				c.setCellStyle(stylePercent);
			}

			if(EXCEL_COLUMNS.contains("managementPlanAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementPlanAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("managementRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementRealAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("managementTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementTotalAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("managementOweAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementOweAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("field01")){
				c = r.createCell(j++);
				c.setCellValue(Utility.parseDouble(p.getField01()));
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("field02")){
				c = r.createCell(j++);
				c.setCellValue(Utility.parseDouble(p.getField02()));
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("arrearsAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getArrearsAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("expectedValue")){
				c = r.createCell(j++);
				c.setCellValue(p.getExpectedValue());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("expectedValueTon")){
				c = r.createCell(j++);
				c.setCellValue(p.getExpectedValueTon());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("expectedValueSquareMeter")){
				c = r.createCell(j++);
				c.setCellValue(p.getExpectedValueSquareMeter());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("profilePoint")){
				c = r.createCell(j++);
				c.setCellValue(p.getProfilePoint());
				c.setCellStyle(styleDefault);
			}
		}
		
		
		ProjectSummary p = service.getTotal(list);
		int j = 0;
		Row r = sheet1.createRow(rowIndex++);

		Cell c = r.createCell(j++);
		c.setCellValue(p.getProjectName());
		c.setCellStyle(styleFooter);
		
		for(;j <= countTotal;){
			c = r.createCell(j++);
			c.setCellStyle(styleFooter);
		}
		
		if(EXCEL_COLUMNS.contains("contractAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getContractAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("contractType")){
			c = r.createCell(j++);
			//c.setCellValue(p.getContractType());
			c.setCellStyle(styleDefault);
		}
		
		if(EXCEL_COLUMNS.contains("contractDate")){
			c = r.createCell(j++);
			//c.setCellValue(p.getContractDate());
			c.setCellStyle(styleDate);
		}
		
		/*if(EXCEL_COLUMNS.contains("changeAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getChangeAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("changeTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getChangeTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("settlementAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getSettlementAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("partyBillingAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPartyBillingAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPartyBillingOutputTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPartyBillingTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("collectionsAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCollectionsAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("collectionsTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("collectionsRate")){
			c = r.createCell(j++);
			// c.setCellValue(p.getCollectionsRate() / 100);
			c.setCellStyle(stylePercent);
		}
		
		if(EXCEL_COLUMNS.contains("customerBillingAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCustomerBillingAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("customerBillingInputTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCustomerBillingInputTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCustomerBillingTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("paymentAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("paymentTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("projectBalance")){
			// ///////////
			c = r.createCell(j++);
			// TODO 还是不对
			c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount() - p.getPaymentTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("taxRate")){
			c = r.createCell(j++);
			// c.setCellValue(p.getTaxRate() / 100);
			c.setCellStyle(styleDefault);
		}*/
		
		if(EXCEL_COLUMNS.contains("taxBearingRate")){
			c = r.createCell(j++);
			//c.setCellValue(p.getTaxBearingRate());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxBearingAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxBearingAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxBearingRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxBearingRealAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxBearingTotalRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxBearingTotalRealAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxPlanAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxPlanAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("paymentDifferentTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentDifferentTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentTotalDifferentTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("taxRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxRealAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		/*if(EXCEL_COLUMNS.contains("taxTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxTotalAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		/*if(EXCEL_COLUMNS.contains("taxOweAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxOweAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("managementRate")){
			c = r.createCell(j++);
			// c.setCellValue(p.getManagementRate() / 100);
			c.setCellStyle(styleDefault);
		}
		
		if(EXCEL_COLUMNS.contains("managementPlanAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementPlanAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("managementRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementRealAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("managementTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("managementOweAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementOweAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("field01")){
			c = r.createCell(j++);
			c.setCellValue(Utility.parseDouble(p.getField01()));
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("field02")){
			c = r.createCell(j++);
			c.setCellValue(Utility.parseDouble(p.getField02()));
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("arrearsAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getArrearsAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("expectedValue")){
			c = r.createCell(j++);
			c.setCellValue(p.getExpectedValue());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("expectedValueTon")){
			c = r.createCell(j++);
			c.setCellValue(p.getExpectedValueTon());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("expectedValueSquareMeter")){
			c = r.createCell(j++);
			c.setCellValue(p.getExpectedValueSquareMeter());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("profilePoint")){
			c = r.createCell(j++);
			// c.setCellValue(p.getProfilePoint());
			c.setCellStyle(styleDefault);
		}
		
		for (int i = 0; i < headers.length; i++) {
			sheet1.autoSizeColumn(i, true);
		}

		sheet1.addMergedRegion(new CellRangeAddress(rowIndex - 1, rowIndex - 1, 0, countTotal));

		wb.write(response.getOutputStream());
	}

	@RequestMapping(value = "/export-year")
	public void exportYearExcel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "orgid", required = false) String orgId) throws Exception {
//		String EXCEL_HEADERS = "年份,工程数,累计合同金额,合同调增额,合同结算额,累计甲方开票,累计收款,累计客户开票,累计支付工程款,累计已缴税金,应收管理费,累计收管理费,其他收入,管理费及其他收入累计,往来欠款,预计用量（吨）,预计用量（平米）";
//		String EXCEL_COLUMNS = "field01,field04,contractAmount,changeTotalAmount,settlementAmount,partyBillingAmount,collectionsAmount,customerBillingAmount,paymentAmount,taxRealAmount,managementPlanAmount,managementRealAmount,field02,field03,arrearsAmount,expectedValueTon,expectedValueSquareMeter";
		String EXCEL_HEADERS = "年份,工程数,累计合同金额,合同调增额,合同结算额,累计甲方开票,累计收款,累计客户开票,累计支付工程款,累计已收税负率税金,应收管理费,累计收管理费,其他收入,管理费及其他收入累计,往来欠款,预计用量（吨）,预计用量（平米）";
		String EXCEL_COLUMNS = "field01,field04,contractAmount,changeTotalAmount,settlementAmount,partyBillingAmount,collectionsAmount,customerBillingAmount,paymentAmount,taxBearingTotalRealAmount,managementPlanAmount,managementRealAmount,field02,field03,arrearsAmount,expectedValueTon,expectedValueSquareMeter";
		//获取列表显示列参数
		SysUser sysUser = SessionHelper.getCurrentSysUser();
		sysUser = userService.get(sysUser.getId());
		JSONObject exportExcelSetting = JSON.parseObject(sysUser.getExportExcelSetting());
		JSONObject year = new JSONObject();
		if(exportExcelSetting!=null){
			year = exportExcelSetting.getJSONObject("year");
			if(StringUtils.isNotEmpty(year.getString("heads"))){
				EXCEL_HEADERS = year.getString("heads");
			}
			if(StringUtils.isNotEmpty(year.getString("columns"))){
				EXCEL_COLUMNS = year.getString("columns");
			}
		}
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

		Row r0 = sheet1.createRow(0);
		String[] headers = EXCEL_HEADERS.split(",");
		for (int i = 0; i < headers.length; i++) {
			Cell c = r0.createCell(i);
			c.setCellValue(headers[i]);
			c.setCellStyle(styleHeader);
		}

		List<ProjectSummary> list = service.getSummaryByYear(orgId);
		Class clazz = ProjectSummary.class;
		for (int i = 0; i < list.size(); i++) {
			ProjectSummary p = list.get(i);
			Row r = sheet1.createRow(i+1);

			String[] columns = EXCEL_COLUMNS.split(",");
			for (int j = 0; j < columns.length; j++) {
				String column = columns[j];
				Cell c = r.createCell(j);
				Method get = clazz.getMethod("get"+Utility.captureName(column), new Class[]{});
				if("field01".equals(column)){
					c.setCellValue((String)get.invoke(p, new Object[]{}));
					c.setCellStyle(styleDefault);
				}else if("field02".equals(column)){
					c.setCellValue(Utility.parseDouble((String)get.invoke(p, new Object[]{})));
					c.setCellStyle(styleInt);
				}else if("field03".equals(column)){
					c.setCellValue(Utility.parseDouble((String)get.invoke(p, new Object[]{})));
					c.setCellStyle(styleInt);
				}else if("field04".equals(column)){
					c.setCellValue(Utility.parseInt((String)get.invoke(p, new Object[]{})));
					c.setCellStyle(styleInt);
				}else{
					c.setCellValue((Double)get.invoke(p, new Object[]{}));
					c.setCellStyle(styleRMB);
				}
			}
		}

		for (int i = 0; i < headers.length; i++) {
			sheet1.autoSizeColumn(i, true);
		}

		wb.write(response.getOutputStream());
	}

	@RequestMapping(value = "/export-year-detail")
	public void exportYearDetailExcel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "p1", required = false) String p1, @RequestParam(value = "orgid", required = false) String orgId) throws Exception {

//		String EXCEL_HEADERS = "序号,时间,摘要,项目编号,项目名称,项目实施人,合同税率,合同金额,合同分类,合同签订日期,合同调增额,合同结算额,金额,销项税金,累计开票,累计收款,回收率,金额,进项税金,累计开票,工程款累计支付,工程余额,异地税金,比率,税负率税金,当期应缴税金,累计已缴税金,比率,应收管理费,本期收管理费,累计收管理费,尚欠管理费,其他收入,管理费及其他收入累计,往来欠款,预计用量（吨）,预计用量（平米）,型材点";
//		String EXCEL_COLUMNS = "trice,description,projectCode,projectName,field03,contractTaxRate,contractAmount,contractType,contractDate,changeTotalAmount,settlementAmount,partyBillingAmount,partyBillingOutputTaxAmount,partyBillingTotalAmount,collectionsTotalAmount,collectionsRate,customerBillingAmount,customerBillingInputTaxAmount,customerBillingTotalAmount,paymentTotalAmount,projectBalance,paymentDifferentTaxAmount,taxRate,taxBearingAmount,taxPlanAmount,taxTotalAmount,managementRate,managementPlanAmount,managementRealAmount,managementTotalAmount,managementOweAmount,field01,field02,arrearsAmount,expectedValueTon,expectedValueSquareMeter,profilePoint";
		
		String EXCEL_HEADERS = "序号,时间,摘要,项目编号,项目名称,项目实施人,合同税率,合同金额,合同分类,合同签订日期,合同调增额,合同结算额,金额,销项税金,累计开票,累计收款,回收率,金额,进项税金,累计开票,工程款累计支付,工程余额,"
				+ "税负率,应收税负率税金,当期已收税负率税金,累计已收税负率税金,应缴税金,当期异地已缴税金,累计异地已缴税金,"
				+ "比率,应收管理费,本期收管理费,累计收管理费,尚欠管理费,其他收入,管理费及其他收入累计,往来欠款,预计用量（吨）,预计用量（平米）,型材点";
		String EXCEL_COLUMNS = "trice,description,projectCode,projectName,field03,contractTaxRate,contractAmount,contractType,contractDate,changeTotalAmount,settlementAmount,partyBillingAmount,partyBillingOutputTaxAmount,partyBillingTotalAmount,collectionsTotalAmount,collectionsRate,customerBillingAmount,customerBillingInputTaxAmount,customerBillingTotalAmount,paymentTotalAmount,projectBalance,"
				+ "taxBearingRate,taxBearingAmount,taxBearingRealAmount,taxBearingTotalRealAmount,taxPlanAmount,paymentDifferentTaxAmount,paymentTotalDifferentTaxAmount,"
				+ "managementRate,managementPlanAmount,managementRealAmount,managementTotalAmount,managementOweAmount,field01,field02,arrearsAmount,expectedValueTon,expectedValueSquareMeter,profilePoint";
		
		//获取列表显示列参数
		SysUser sysUser = SessionHelper.getCurrentSysUser();
		sysUser = userService.get(sysUser.getId());
		JSONObject exportExcelSetting = JSON.parseObject(sysUser.getExportExcelSetting());
		JSONObject yeardetail = new JSONObject();
		if(exportExcelSetting!=null){
			yeardetail = exportExcelSetting.getJSONObject("yeardetail");
			if(StringUtils.isNotEmpty(yeardetail.getString("heads"))){
				EXCEL_HEADERS = "序号," + yeardetail.getString("heads");
			}
			if(StringUtils.isNotEmpty(yeardetail.getString("columns"))){
				EXCEL_COLUMNS = yeardetail.getString("columns");
			}
		}
		// 去掉时间和摘要
		if(EXCEL_HEADERS.contains(",时间,")){
			EXCEL_HEADERS = EXCEL_HEADERS.replace(",时间,", ",");
		}
		if(EXCEL_HEADERS.contains(",摘要,")){
			EXCEL_HEADERS = EXCEL_HEADERS.replace(",摘要,", ",");
		}
		if(EXCEL_COLUMNS.contains("trice,")){
			EXCEL_COLUMNS = EXCEL_COLUMNS.replace("trice,", "");
		}
		if(EXCEL_COLUMNS.contains("description,")){
			EXCEL_COLUMNS = EXCEL_COLUMNS.replace("description,", "");
		}
		
		SysOrganization org = orgService.get(orgId);
		String orgName = org != null ? org.getOrganizationName() : Utility.EMPTY;
		String sheetName = orgName + "合同项目汇总（" + p1 + "）";

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		String fileName = URLEncoder.encode("totaldata-" + p1 + ".xlsx", "UTF-8");
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
			Cell c0 = r0.createCell(i);
			c0.setCellStyle(styleHeader);

			Cell c1 = r1.createCell(i);
			c1.setCellValue(headers[i]);
			c1.setCellStyle(styleHeader);
		}
		int cellIndex = 0;
		r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
		sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
		cellIndex++;
		int countTotal = 0;
		
		if(EXCEL_COLUMNS.contains("trice")){
			r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
			sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
			cellIndex++;
			countTotal++;
		}
		
		if(EXCEL_COLUMNS.contains("description")){
			r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
			sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
			cellIndex++;
			countTotal++;
		}
		
		if(EXCEL_COLUMNS.contains("projectCode") || EXCEL_COLUMNS.contains("projectName") || EXCEL_COLUMNS.contains("field03") || EXCEL_COLUMNS.contains("contractTaxRate") || EXCEL_COLUMNS.contains("contractAmount") || EXCEL_COLUMNS.contains("contractType") || EXCEL_COLUMNS.contains("contractDate") || EXCEL_COLUMNS.contains("changeTotalAmount") || EXCEL_COLUMNS.contains("settlementAmount")){
			r0.getCell(cellIndex).setCellValue("项目信息");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("projectCode")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("projectName")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("field03")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("contractTaxRate")){
				count++;
				cellIndex++;
				countTotal++;
			}
			if(EXCEL_COLUMNS.contains("contractAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("contractType")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("contractDate")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("changeTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("settlementAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("partyBillingAmount") || EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount") || EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
			r0.getCell(cellIndex).setCellValue("甲方开票情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("partyBillingAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("collectionsTotalAmount") || EXCEL_COLUMNS.contains("collectionsRate")){
			r0.getCell(cellIndex).setCellValue("收款情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("collectionsTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("collectionsRate")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("customerBillingAmount") || EXCEL_COLUMNS.contains("customerBillingInputTaxAmount") || EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
			r0.getCell(cellIndex).setCellValue("客户开票情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("customerBillingAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("customerBillingInputTaxAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("paymentTotalAmount") || EXCEL_COLUMNS.contains("projectBalance")){
			r0.getCell(cellIndex).setCellValue("支付工程款情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("paymentTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("projectBalance")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}
		
		if(EXCEL_COLUMNS.contains("taxBearingRate") || EXCEL_COLUMNS.contains("taxBearingAmount") || EXCEL_COLUMNS.contains("taxBearingRealAmount") || EXCEL_COLUMNS.contains("taxBearingTotalRealAmount") || EXCEL_COLUMNS.contains("taxPlanAmount") || EXCEL_COLUMNS.contains("paymentDifferentTaxAmount") || EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
			r0.getCell(cellIndex).setCellValue("税金情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("taxBearingRate")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxBearingAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxBearingRealAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxBearingTotalRealAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("taxPlanAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("paymentDifferentTaxAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		if(EXCEL_COLUMNS.contains("managementRate") || EXCEL_COLUMNS.contains("managementPlanAmount") || EXCEL_COLUMNS.contains("managementRealAmount") || EXCEL_COLUMNS.contains("managementTotalAmount") || EXCEL_COLUMNS.contains("managementOweAmount") || EXCEL_COLUMNS.contains("field01") || EXCEL_COLUMNS.contains("field02")){
			r0.getCell(cellIndex).setCellValue("管理费及其他收入情况");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("managementRate")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementPlanAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementRealAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementTotalAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("managementOweAmount")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("field01")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("field02")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}
		
		if(EXCEL_COLUMNS.contains("arrearsAmount")){
			r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
			sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
			cellIndex++;
		}

		if(EXCEL_COLUMNS.contains("expectedValueTon") || EXCEL_COLUMNS.contains("expectedValueSquareMeter") || EXCEL_COLUMNS.contains("profilePoint")){
			r0.getCell(cellIndex).setCellValue("型材");
			int beginIndex = cellIndex;
			int count = 0;
			if(EXCEL_COLUMNS.contains("expectedValueTon")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("expectedValueSquareMeter")){
				count++;
				cellIndex++;
			}
			if(EXCEL_COLUMNS.contains("profilePoint")){
				count++;
				cellIndex++;
			}
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, beginIndex, beginIndex + count - 1));
		}

		List<ProjectSummary> list = service.getSummaryByYearDetail(p1, orgId);

		for (int i = 0; i < list.size(); i++) {
			int j = 0;
			ProjectSummary p = list.get(i);
			Row r = sheet1.createRow(rowIndex++);
			Cell c = r.createCell(j++);
			c.setCellValue(i + 1);
			c.setCellStyle(styleDefault);
			
			if(EXCEL_COLUMNS.contains("trice")){
				c = r.createCell(j++);
				c.setCellValue(p.getTrice());
				c.setCellStyle(styleDate);
			}

			if(EXCEL_COLUMNS.contains("description")){
				c = r.createCell(j++);
				c.setCellValue(p.getDescription());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("projectCode")){
				c = r.createCell(j++);
				c.setCellValue(p.getProjectCode());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("projectName")){
				c = r.createCell(j++);
				c.setCellValue(p.getProjectName());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("field03")){
				c = r.createCell(j++);
				c.setCellValue(p.getField03());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("contractTaxRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getContractTaxRate());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("contractAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getContractAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("contractType")){
				c = r.createCell(j++);
				c.setCellValue(p.getContractType());
				c.setCellStyle(styleDefault);
			}

			if(EXCEL_COLUMNS.contains("contractDate")){
				c = r.createCell(j++);
				if(p.getContractDate()!=null){
					c.setCellValue(p.getContractDate());
				}
				c.setCellStyle(styleDate);
			}

			/*if(EXCEL_COLUMNS.contains("changeAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getChangeAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("changeTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getChangeTotalAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("settlementAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getSettlementAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("partyBillingAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPartyBillingAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPartyBillingOutputTaxAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPartyBillingTotalAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("collectionsAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("collectionsTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("collectionsRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsRate() / 100);
				c.setCellStyle(stylePercent);
			}

			if(EXCEL_COLUMNS.contains("customerBillingAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCustomerBillingAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("customerBillingInputTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCustomerBillingInputTaxAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getCustomerBillingTotalAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("paymentAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("paymentTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentTotalAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("projectBalance")){
				// ///////////
				c = r.createCell(j++);
				c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount() - p.getPaymentTotalAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("taxRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxRate() / 100);
				c.setCellStyle(stylePercent);
			}*/
			
			if(EXCEL_COLUMNS.contains("taxBearingRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingRate());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxBearingAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxBearingRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingRealAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxBearingTotalRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxBearingTotalRealAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("taxPlanAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxPlanAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("paymentDifferentTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentDifferentTaxAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getPaymentTotalDifferentTaxAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("taxRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxRealAmount());
				c.setCellStyle(styleRMB);
			}*/

			/*if(EXCEL_COLUMNS.contains("taxTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxTotalAmount());
				c.setCellStyle(styleRMB);
			}*/

			/*if(EXCEL_COLUMNS.contains("taxOweAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getTaxOweAmount());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("managementRate")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementRate() / 100);
				c.setCellStyle(stylePercent);
			}

			if(EXCEL_COLUMNS.contains("managementPlanAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementPlanAmount());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("managementRealAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementRealAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("managementTotalAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementTotalAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("managementOweAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getManagementOweAmount());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("field01")){
				c = r.createCell(j++);
				c.setCellValue(Utility.parseDouble(p.getField01()));
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("field02")){
				c = r.createCell(j++);
				c.setCellValue(Utility.parseDouble(p.getField02()));
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("arrearsAmount")){
				c = r.createCell(j++);
				c.setCellValue(p.getArrearsAmount());
				c.setCellStyle(styleRMB);
			}

			/*if(EXCEL_COLUMNS.contains("expectedValue")){
				c = r.createCell(j++);
				c.setCellValue(p.getExpectedValue());
				c.setCellStyle(styleRMB);
			}*/

			if(EXCEL_COLUMNS.contains("expectedValueTon")){
				c = r.createCell(j++);
				c.setCellValue(p.getExpectedValueTon());
				c.setCellStyle(styleRMB);
			}

			if(EXCEL_COLUMNS.contains("expectedValueSquareMeter")){
				c = r.createCell(j++);
				c.setCellValue(p.getExpectedValueSquareMeter());
				c.setCellStyle(styleRMB);
			}
			
			if(EXCEL_COLUMNS.contains("profilePoint")){
				c = r.createCell(j++);
				c.setCellValue(p.getProfilePoint());
				c.setCellStyle(styleDefault);
			}
		}
		
		
		ProjectSummary p = service.getTotal(list);
		int j = 0;
		Row r = sheet1.createRow(rowIndex++);

		Cell c = r.createCell(j++);
		c.setCellValue(p.getProjectName());
		c.setCellStyle(styleFooter);
		
		for(;j <= countTotal;){
			c = r.createCell(j++);
			c.setCellStyle(styleFooter);
		}
		
		if(EXCEL_COLUMNS.contains("contractAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getContractAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("contractType")){
			c = r.createCell(j++);
			//c.setCellValue(p.getContractType());
			c.setCellStyle(styleDefault);
		}
		
		if(EXCEL_COLUMNS.contains("contractDate")){
			c = r.createCell(j++);
			//c.setCellValue(p.getContractDate());
			c.setCellStyle(styleDate);
		}
		
		/*if(EXCEL_COLUMNS.contains("changeAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getChangeAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("changeTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getChangeTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("settlementAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getSettlementAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("partyBillingAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPartyBillingAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("partyBillingOutputTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPartyBillingOutputTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("partyBillingTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPartyBillingTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("collectionsAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCollectionsAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("collectionsTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("collectionsRate")){
			c = r.createCell(j++);
			// c.setCellValue(p.getCollectionsRate() / 100);
			c.setCellStyle(stylePercent);
		}
		
		if(EXCEL_COLUMNS.contains("customerBillingAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCustomerBillingAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("customerBillingInputTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCustomerBillingInputTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("customerBillingTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getCustomerBillingTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("paymentAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("paymentTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("projectBalance")){
			// ///////////
			c = r.createCell(j++);
			// TODO 还是不对
			c.setCellValue(p.getCollectionsTotalProjectAmount()+p.getCollectionsTotalIncomeAmount() - p.getPaymentTotalAmount());
			c.setCellStyle(styleRMB);
		}

		/*
		if(EXCEL_COLUMNS.contains("taxRate")){
			c = r.createCell(j++);
			// c.setCellValue(p.getTaxRate() / 100);
			c.setCellStyle(styleDefault);
		}*/
		
		if(EXCEL_COLUMNS.contains("taxBearingRate")){
			c = r.createCell(j++);
			//c.setCellValue(p.getTaxBearingRate());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxBearingAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxBearingAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxBearingRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxBearingRealAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxBearingTotalRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxBearingTotalRealAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("taxPlanAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxPlanAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("paymentDifferentTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentDifferentTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("paymentTotalDifferentTaxAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getPaymentTotalDifferentTaxAmount());
			c.setCellStyle(styleRMB);
		}
		
		
		/*if(EXCEL_COLUMNS.contains("taxRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxRealAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		/*if(EXCEL_COLUMNS.contains("taxTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxTotalAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		/*if(EXCEL_COLUMNS.contains("taxOweAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getTaxOweAmount());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("managementRate")){
			c = r.createCell(j++);
			// c.setCellValue(p.getManagementRate() / 100);
			c.setCellStyle(styleDefault);
		}
		
		if(EXCEL_COLUMNS.contains("managementPlanAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementPlanAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("managementRealAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementRealAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("managementTotalAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementTotalAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("managementOweAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getManagementOweAmount());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("field01")){
			c = r.createCell(j++);
			c.setCellValue(Utility.parseDouble(p.getField01()));
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("field02")){
			c = r.createCell(j++);
			c.setCellValue(Utility.parseDouble(p.getField02()));
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("arrearsAmount")){
			c = r.createCell(j++);
			c.setCellValue(p.getArrearsAmount());
			c.setCellStyle(styleRMB);
		}
		
		/*if(EXCEL_COLUMNS.contains("expectedValue")){
			c = r.createCell(j++);
			c.setCellValue(p.getExpectedValue());
			c.setCellStyle(styleRMB);
		}*/
		
		if(EXCEL_COLUMNS.contains("expectedValueTon")){
			c = r.createCell(j++);
			c.setCellValue(p.getExpectedValueTon());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("expectedValueSquareMeter")){
			c = r.createCell(j++);
			c.setCellValue(p.getExpectedValueSquareMeter());
			c.setCellStyle(styleRMB);
		}
		
		if(EXCEL_COLUMNS.contains("profilePoint")){
			c = r.createCell(j++);
			// c.setCellValue(p.getProfilePoint());
			c.setCellStyle(styleDefault);
		}
		
		for (int i = 0; i < headers.length; i++) {
			sheet1.autoSizeColumn(i, true);
		}

		sheet1.addMergedRegion(new CellRangeAddress(rowIndex - 1, rowIndex - 1, 0, countTotal));

		wb.write(response.getOutputStream());
	}

}
