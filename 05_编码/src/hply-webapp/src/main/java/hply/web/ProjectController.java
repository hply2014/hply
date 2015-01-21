package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.Arrears;
import hply.domain.Collections;
import hply.domain.ContractChange;
import hply.domain.CustomerBilling;
import hply.domain.PartyBilling;
import hply.domain.Payment;
import hply.domain.PaymentItem;
import hply.domain.Profile;
import hply.domain.Project;
import hply.domain.ProjectSummary;
import hply.domain.SysOrganization;
import hply.domain.SysUser;
import hply.service.ArrearsService;
import hply.service.CollectionsService;
import hply.service.ContractChangeService;
import hply.service.CustomerBillingService;
import hply.service.PartyBillingService;
import hply.service.PaymentItemService;
import hply.service.PaymentService;
import hply.service.ProfileService;
import hply.service.ProjectService;
import hply.service.ProjectSummaryService;
import hply.service.SysOrganizationService;
import hply.service.SysParameterService;
import hply.service.SysUserService;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
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

	@Autowired
	private ProjectSummaryService summaryService;

	@Autowired
	private ArrearsService arrearsService;

	@Autowired
	private CollectionsService collectionService;

	@Autowired
	private ContractChangeService contractChangeService;

	@Autowired
	private CustomerBillingService customerBillingService;

	@Autowired
	private PartyBillingService partyBillingService;

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private ProfileService profileService;

	@Autowired
	private PaymentItemService paymentItemService;

	public static final String URI = "/project";
	public static final String JSP_PAGE_LIST = "project-list";
	public static final String JSP_PAGE_DETAIL = "project-detail";
	public static final String JSP_PAGE_MODIFY = "project-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "p", required = false) Integer p, @RequestParam(value = "oid", required = false) String oid,
			@RequestParam(value = "q", required = false) String q, Model model) {
		model.addAttribute("page_title", "合同项目信息");

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
		String queryText = StringUtils.isBlank(q) ? "%" : "%" + q.replaceAll(" ", "%") + "%";

		int pageSize = paramService.getParamIntValue("page_size", 30);
		int rowCount = service.getRowCount(queryText, oid);
		int pageCount = rowCount / pageSize + (rowCount % pageSize == 0 ? 0 : 1);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPageStarted", pageIndex * pageSize);
		model.addAttribute("queryText", q);

		List<Project> list = service.getAllPagedByOrganization(queryText, oid, pageIndex * pageSize, pageSize);

		for (Project item : list) {
			// SysOrganization org = orgService.get(item.getOrganizationId());
			// item.setOrganizationId(org != null ? org.getOrganizationName() :
			// Utility.EMPTY);

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
	public String detail(@RequestParam(value = "target", required = false) String target, @PathVariable String id, Model model) {
		if (StringUtils.isEmpty(target)) {
			target = Utility.EMPTY;
		} else {
			model.addAttribute("target", target);
		}
		switch (target) {
		case "summary":
			break;
		case "project":
			// model.addAttribute("target", target);
			break;
		case "contractchange":
			// model.addAttribute("target", target);
			ContractChange cc = contractChangeService.get(id);
			if (cc != null) {
				id = cc.getProjectId();
			}
			break;
		case "partybilling":
			// model.addAttribute("target", target);
			PartyBilling pb = partyBillingService.get(id);
			if (pb != null) {
				id = pb.getProjectId();
			}
			break;
		case "customerbilling":
			// model.addAttribute("target", target);
			CustomerBilling cb = customerBillingService.get(id);
			if (cb != null) {
				id = cb.getProjectId();
			}
			break;
		case "collections":
			// model.addAttribute("target", target);
			Collections c = collectionService.get(id);
			if (c != null) {
				id = c.getProjectId();
			}
			break;
		case "payment":
			// model.addAttribute("target", target);
			Payment p = paymentService.get(id);
			if (p != null) {
				id = p.getProjectId();
			}
			break;
		case "arrears":
			// model.addAttribute("target", target);
			Arrears a = arrearsService.get(id);
			if (a != null) {
				id = a.getProjectId();
			}
			break;
		case "profile":
			// model.addAttribute("target", target);
			Profile pr = profileService.get(id);
			if (pr != null) {
				id = pr.getProjectId();
			}
			break;
		case "history":
			break;
		default:
			model.addAttribute("target", "summary");

		}

		model.addAttribute("projectId", id);

		Project project = service.get(id);
		if(project == null){
			model.addAttribute("page_title", "此合同项目信息不存在。");
			return JSP_PAGE_DETAIL;
		}
		model.addAttribute("page_title", "合同项目信息的详情信息：" + project.getProjectName() + "（" + project.getProjectCode() + "）");
		SysOrganization org = orgService.get(project.getOrganizationId());
		project.setOrganizationId(org != null ? org.getOrganizationName() : Utility.EMPTY);

		SysUser u1 = sysUserService.get(project.getCreateUser());
		project.setCreateUser(u1 != null ? u1.getRealName() : Utility.EMPTY);

		SysUser u2 = sysUserService.get(project.getUpdateUser());
		project.setUpdateUser(u2 != null ? u2.getRealName() : Utility.EMPTY);

		ProjectSummary ps = summaryService.getSummaryByProject(id);
		model.addAttribute("projectSummary", ps);

		model.addAttribute("project", project);

		List<Arrears> lArrears = arrearsService.getAllByProject(id);
		for (Arrears item : lArrears) {
			SysUser user = sysUserService.get(item.getCreateUser());
			item.setCreateUser(user != null ? user.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("lArrears", lArrears);

		List<Collections> lCollections = collectionService.getAllByProject(id);
		for (Collections item : lCollections) {

			SysUser user = sysUserService.get(item.getCreateUser());
			item.setCreateUser(user != null ? user.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("lCollections", lCollections);

		List<ContractChange> lContractChange = contractChangeService.getAllByProject(id);

		for (ContractChange item : lContractChange) {
			SysUser user = sysUserService.get(item.getCreateUser());
			item.setCreateUser(user != null ? user.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("lContractChange", lContractChange);

		List<CustomerBilling> lCustomerBilling = customerBillingService.getAllByProject(id);

		for (CustomerBilling item : lCustomerBilling) {
			SysUser user = sysUserService.get(item.getCreateUser());
			item.setCreateUser(user != null ? user.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("lCustomerBilling", lCustomerBilling);

		List<PartyBilling> lPartyBilling = partyBillingService.getAllByProject(id);
		for (PartyBilling item : lPartyBilling) {
			SysUser user = sysUserService.get(item.getCreateUser());
			item.setCreateUser(user != null ? user.getRealName() : Utility.EMPTY);

			SysUser user1 = sysUserService.get(item.getStep1User());
			item.setStep1User(user1 != null ? user.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("lPartyBilling", lPartyBilling);

		List<Payment> lPayment = paymentService.getAllByProject(id);
		for (Payment item : lPayment) {
			SysUser user = sysUserService.get(item.getCreateUser());
			item.setCreateUser(user != null ? user.getRealName() : Utility.EMPTY);

			PaymentItem pi = paymentItemService.get(item.getPaymentItemId());
			item.setPaymentItemId(pi != null ? pi.getItemName() : Utility.EMPTY);

		}

		model.addAttribute("lPayment", lPayment);

		List<Profile> lProfile = profileService.getAllByProject(id);
		for (Profile item : lProfile) {
			SysUser user = sysUserService.get(item.getCreateUser());
			item.setCreateUser(user != null ? user.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("lProfile", lProfile);

		List<ProjectSummary> lHistory = summaryService.getHistoryByProject(id);
		for (ProjectSummary item : lHistory) {
			SysUser user = sysUserService.get(item.getField01());
			item.setField01(user != null ? user.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("lHistory", lHistory);

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
		model.addAttribute("orglist", getOrgList());
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
		model.addAttribute("orglist", getOrgList());
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
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid Project project, BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(project.toString());

		if (result.hasErrors()) {
			model.addAttribute("orglist", getOrgList());
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
			model.addAttribute("orglist", getOrgList());
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
	

	/*
	 * 审核页面
	 */
	@RequestMapping(value = "/check/{id}", method = RequestMethod.GET)
	public String processCheckSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		Project project = service.get(id);
		service.check(id);
		redirectAttrs.addFlashAttribute("delMessage", "审核通过");
		redirectAttrs.addFlashAttribute("project", project);
		return "redirect:" + URI;
	}

	private final static String EXCEL_HEADERS = "序号,项目编号,项目名称,项目经理,管理费率,税金比率,合同金额,印花税上缴金额,登记时间";

	@RequestMapping(value = "/export")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		String fileName = URLEncoder.encode("PROJECT-" + new SimpleDateFormat("yyyyMMdd-ss").format(new Date()) + ".xlsx", "UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);

		int rowIndex = 0;

		Workbook wb = new XSSFWorkbook();
		CreationHelper createHelper = wb.getCreationHelper();

		Sheet sheet1 = wb.createSheet("合同项目信息");


		CellStyle styleDefault = wb.createCellStyle();
		styleDefault.setBorderTop(CellStyle.BORDER_THIN);
		styleDefault.setTopBorderColor(IndexedColors.BLACK.getIndex());
		styleDefault.setBorderRight(CellStyle.BORDER_THIN);
		styleDefault.setRightBorderColor(IndexedColors.BLACK.getIndex());
		styleDefault.setBorderBottom(CellStyle.BORDER_THIN);
		styleDefault.setBottomBorderColor(IndexedColors.BLACK.getIndex());
		styleDefault.setBorderLeft(CellStyle.BORDER_THIN);
		styleDefault.setLeftBorderColor(IndexedColors.BLACK.getIndex());

		CellStyle stylePercent = wb.createCellStyle();
		stylePercent.cloneStyleFrom(styleDefault);
		stylePercent.setDataFormat(createHelper.createDataFormat().getFormat("0.00%"));

		CellStyle styleRMB = wb.createCellStyle();
		styleRMB.cloneStyleFrom(styleDefault);
		styleRMB.setDataFormat(createHelper.createDataFormat().getFormat("#,##0.00"));

		CellStyle styleDate = wb.createCellStyle();
		styleDate.cloneStyleFrom(styleDefault);
		styleDate.setDataFormat(createHelper.createDataFormat().getFormat("yyyy-mm-dd"));
		
		CellStyle styleHeader = wb.createCellStyle();
		styleHeader.cloneStyleFrom(styleDefault);
		styleHeader.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        styleHeader.setFillPattern(CellStyle.SOLID_FOREGROUND);
		

		Row r = sheet1.createRow(rowIndex++);
		String[] headers = EXCEL_HEADERS.split(",");
		for (int i = 0; i < headers.length; i++) {
			Cell c = r.createCell(i);
			c.setCellValue(headers[i]);
			c.setCellStyle(styleHeader);
		}

		List<Project> list = service.getAll();
		for (int i = 0; i < list.size(); i++) {
			int j = 0;
			Project p = list.get(i);
			r = sheet1.createRow(rowIndex++);
			Cell c0 = r.createCell(j++);
			c0.setCellValue(i);
			c0.setCellStyle(styleDefault);
			
			Cell c1 = r.createCell(j++);
			c1.setCellValue(p.getProjectCode());
			c1.setCellStyle(styleDefault);
			
			Cell c2 = r.createCell(j++);
			c2.setCellValue(p.getProjectName());
			c2.setCellStyle(styleDefault);
			
			Cell c3 = r.createCell(j++);
			c3.setCellValue(p.getManager());
			c3.setCellStyle(styleDefault);
			
			Cell c4 = r.createCell(j++);
			c4.setCellValue(p.getManagementRate()/100);
			c4.setCellStyle(stylePercent);
			
			Cell c5 = r.createCell(j++);
			c5.setCellValue(p.getTaxRate()/100);
			c5.setCellStyle(stylePercent);
			
			Cell c6 = r.createCell(j++);
			c6.setCellValue(p.getContractAmount());
			c6.setCellStyle(styleRMB);
			
			Cell c7 = r.createCell(j++);
			c7.setCellValue(p.getDutyPaidAmount());
			c7.setCellStyle(styleRMB);
			
			Cell c8 = r.createCell(j++);
			c8.setCellValue(p.getTrice());
			c8.setCellStyle(styleDate);
		}

//		sheet1.setColumnWidth(0, 45*256);
//		sheet1.setColumnWidth(1, 100*256);
//		sheet1.setColumnWidth(2, 300*256);
//		sheet1.setColumnWidth(3, 100*256);
//		sheet1.setColumnWidth(4, 72*256);
//		sheet1.setColumnWidth(5, 72*256);
//		sheet1.setColumnWidth(6, 150*256);
//		sheet1.setColumnWidth(7, 150*256);
//		sheet1.setColumnWidth(8, 100*256);

		for (int i = 0; i < headers.length; i++) {
			sheet1.autoSizeColumn(i, true);
		}
		wb.write(response.getOutputStream());
	}
	
}
