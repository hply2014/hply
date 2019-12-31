package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.Information;
import hply.domain.InformationCertificateAmount;
import hply.domain.InformationChange;
import hply.domain.ProjectSummary;
import hply.domain.SysOrganization;
import hply.domain.SysParameter;
import hply.domain.SysUser;
import hply.domain.Where;
import hply.service.InformationCertificateAmountService;
import hply.service.InformationChangeService;
import hply.service.InformationService;
import hply.service.SysOrganizationService;
import hply.service.SysParameterService;
import hply.service.SysUserService;

import java.net.URLEncoder;
import java.text.MessageFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Font;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping(value = InformationController.URI)
public class InformationController {

	@Autowired
	private InformationService service;

	@Autowired
	private SysOrganizationService orgService;

	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysParameterService paramService;
	
	@Autowired
	private InformationChangeService informationChangeService;
	
	@Autowired
	private InformationCertificateAmountService informationCertificateAmountService;
	
	
	public static final String URI = "/information";
	public static final String JSP_PAGE_LIST = "information-list";
	public static final String JSP_PAGE_DETAIL = "information-detail";
	public static final String JSP_PAGE_MODIFY = "information-modify";
	public static final String JSP_PAGE_LIST_FULL = "information-list-full";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "p", required = false) Integer p, @RequestParam(value = "organizationId", required = false) String organizationId,
			@RequestParam(value = "projectName", required = false) String projectName,
			@RequestParam(value = "triceBeginTime", required = false) String triceBeginTime,
			@RequestParam(value = "triceEndTime", required = false) String triceEndTime,
			@RequestParam(value = "payFlag", required = false) String payFlag,
			@RequestParam(value = "sealFlag", required = false) String sealFlag,
			Model model) {
		model.addAttribute("page_title", "信息登记");
		SysUser user = SessionHelper.getCurrentSysUser();
		int pageIndex = p != null ? p.intValue() : 0;
		int pageSize = paramService.getParamIntValue("page_size", 30);
		
		StringBuffer whereSql = new StringBuffer(" 1=1 ");
		Where where = new Where();
		if(StringUtils.isNotEmpty(organizationId)){
			whereSql.append(" and organization_id = #{organizationId} ");
			where.add("organizationId", StringUtils.trimToEmpty(organizationId));
		}
		if(StringUtils.isNotEmpty(StringUtils.trimToEmpty(projectName))){
			if("0ed4d3a1-0c3a-11e4-9300-001c42328937".equals(user.getOrganizationId())){
				whereSql.append(" and concat(ifnull(project_name, ''), ifnull(address,	''), ifnull(construction_company, ''), ifnull(general_contractor, ''), ifnull(join_real_name, '')) like concat('%', #{projectName}, '%') ");
				where.add("projectName", StringUtils.trimToEmpty(projectName));
			}else{
				whereSql.append(" and (concat(ifnull(project_name, ''), ifnull(address,	''), ifnull(construction_company, ''), ifnull(general_contractor, '')) like concat('%', #{projectName}, '%') or (concat(ifnull(project_name, ''), ifnull(address,	''), ifnull(construction_company, ''), ifnull(general_contractor, ''), ifnull(join_real_name, '')) like concat('%', #{projectName}, '%') and organization_id = #{organizationId1}))");
				where.add("projectName", StringUtils.trimToEmpty(projectName));
				where.add("organizationId1", StringUtils.trimToEmpty(user.getOrganizationId()));
			}
		}
		if(StringUtils.isNotEmpty(StringUtils.trimToEmpty(triceBeginTime)) && StringUtils.isNotEmpty(StringUtils.trimToEmpty(triceEndTime))){
			whereSql.append(" and date(trice) between #{triceBeginTime} and #{triceEndTime} ");
			where.add("triceBeginTime", StringUtils.trimToEmpty(triceBeginTime));
			where.add("triceEndTime", StringUtils.trimToEmpty(triceEndTime));
		}else if(StringUtils.isNotEmpty(StringUtils.trimToEmpty(triceBeginTime))){
			whereSql.append(" and date(trice) >= #{triceBeginTime} ");
			where.add("triceBeginTime", StringUtils.trimToEmpty(triceBeginTime));
		}else if(StringUtils.isNotEmpty(StringUtils.trimToEmpty(triceEndTime))){
			whereSql.append(" and date(trice) <= #{triceEndTime} ");
			where.add("triceEndTime", StringUtils.trimToEmpty(triceEndTime));
		}
		if(StringUtils.isNotEmpty(StringUtils.trimToEmpty(payFlag))){
			whereSql.append(" and pay_flag = #{payFlag} ");
			where.add("payFlag", StringUtils.trimToEmpty(payFlag));
		}
		if(StringUtils.isNotEmpty(StringUtils.trimToEmpty(sealFlag))){
			whereSql.append(" and seal_flag = #{sealFlag} ");
			where.add("sealFlag", StringUtils.trimToEmpty(sealFlag));
		}
		where.add("where", whereSql.toString());
		
		int rowCount = service.getRowCount(where);
		int pageCount = rowCount / pageSize + (rowCount % pageSize == 0 ? 0 : 1);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPageStarted", pageIndex * pageSize);
		model.addAttribute("currentUser", SessionHelper.getCurrentSysUser());
		model.addAttribute("organizationId", StringUtils.trimToEmpty(organizationId));
		model.addAttribute("projectName", StringUtils.trimToEmpty(projectName));
		model.addAttribute("triceBeginTime", StringUtils.trimToEmpty(triceBeginTime));
		model.addAttribute("triceEndTime", StringUtils.trimToEmpty(triceEndTime));
		model.addAttribute("payFlag", StringUtils.trimToEmpty(payFlag));
		model.addAttribute("sealFlag", StringUtils.trimToEmpty(sealFlag));

		where.add("pageIndex", pageIndex * pageSize);
		where.add("pageSize", pageSize);
		List<Information> list = service.getAllPaged(where);
		for (Information item : list) {
			SysOrganization org = orgService.get(item.getOrganizationId());
			item.setField01(item.getOrganizationId());
			item.setOrganizationId(org != null ? org.getOrganizationName() : Utility.EMPTY);
			SysUser subscriber = sysUserService.get(item.getSubscriber());
			item.setField02(item.getSubscriber());
			item.setSubscriber(subscriber != null ? subscriber.getRealName() : Utility.EMPTY);
			SysUser updateUser = sysUserService.get(item.getUpdateUser());
			item.setUpdateUser(updateUser != null ? updateUser.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("list", list);
		model.addAttribute("orglist", orgService.getAll());

		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "信息登记的详情信息");
		Information information = service.get(id);
		model.addAttribute("information", information);
		// 补充修改记录
		List<InformationChange> list= informationChangeService.getAllBy(id);
		for (InformationChange item : list) {
			SysUser createUser = sysUserService.get(item.getCreateUser());
			item.setCreateUser(createUser != null ? createUser.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("list", list);
		Map<String, String> refInfo = new HashMap<String, String>();
		refInfo.put("organizationName", orgService.get(information.getOrganizationId()).getOrganizationName());
		refInfo.put("subscriberName", sysUserService.get(information.getSubscriber()).getRealName());
		refInfo.put("statusName", Utility.getStatusName(information.getStatus()));
		model.addAttribute("refInfo", refInfo);

		if(information.getStatus() == 3 || information.getStatus() == 4){
			List<InformationCertificateAmount> listCertificateAmount = informationCertificateAmountService.getAllByInfo(id);
			for (InformationCertificateAmount item : listCertificateAmount) {
				SysUser createUser = sysUserService.get(item.getCreateUser());
				item.setField01(item.getCreateUser());
				item.setCreateUser(createUser != null ? createUser.getRealName() : Utility.EMPTY);
			}
			model.addAttribute("lCertificateAmount", listCertificateAmount);
		}
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		Information information = new Information();
		model.addAttribute("orglist", orgService.getAll());
		SysUser curUser = SessionHelper.getCurrentSysUser();
		model.addAttribute("currentUser", curUser);
		Map<String, String> refInfo = new HashMap<String, String>();
		if(!"0ed4d3a1-0c3a-11e4-9300-001c42328937".equals(curUser.getOrganizationId())){
			refInfo.put("organizationName", orgService.get(curUser.getOrganizationId()).getOrganizationName());
			information.setOrganizationId(curUser.getOrganizationId());
		}
		model.addAttribute("information", information);
		refInfo.put("subscriberName", sysUserService.get(information.getSubscriber()).getRealName());
		model.addAttribute("refInfo", refInfo);
		model.addAttribute("page_title", "新建信息登记");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model,@RequestParam(required = false) String target) {
		if(StringUtils.isEmpty(target)){
			target = "information";
		}
		model.addAttribute("target", target);
		Information information = service.get(id);
		model.addAttribute("information", information);
		model.addAttribute("currentUser", SessionHelper.getCurrentSysUser());
		Map<String, String> refInfo = new HashMap<String, String>();
		refInfo.put("organizationName", orgService.get(information.getOrganizationId()).getOrganizationName());
		refInfo.put("subscriberName", sysUserService.get(information.getSubscriber()).getRealName());
		refInfo.put("statusName", Utility.getStatusName(information.getStatus()));
		model.addAttribute("refInfo", refInfo);
		// 获取证书类别
		SysParameter certificateType = paramService.getByEnName("certificate_type");
		model.addAttribute("certificateTypeId", certificateType.getId());
		model.addAttribute("certificateType", certificateType.getParamValue().split("/"));
		
		// 补充修改记录
		List<InformationChange> list= informationChangeService.getAllBy(id);
		for (InformationChange item : list) {
			SysUser createUser = sysUserService.get(item.getCreateUser());
			item.setCreateUser(createUser != null ? createUser.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("list", list);
		
		if(information.getStatus() == 3 || information.getStatus() == 4){
			List<InformationCertificateAmount> listCertificateAmount = informationCertificateAmountService.getAllByInfo(id);
			for (InformationCertificateAmount item : listCertificateAmount) {
				SysUser createUser = sysUserService.get(item.getCreateUser());
				item.setField01(item.getCreateUser());
				item.setCreateUser(createUser != null ? createUser.getRealName() : Utility.EMPTY);
			}
			model.addAttribute("lCertificateAmount", listCertificateAmount);
		}
		model.addAttribute("page_title", Utility.informationStatusName(information.getStatus()));
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid Information information, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(information.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}
		if(information.getStatus() == 0){
			information.setStatus(1);
		}
		if(information.getStatus() == -1){
			// 替换保存查重备注
			information.setDescription(information.getField01()+information.getDescription());
			information.setField01("");
		}
		service.insert(information);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("information", information);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid Information information, BindingResult result,
			Model model, RedirectAttributes redirectAttrs) {
		Utility.println(information.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}
		
		Information informationOld = service.get(id);

		if (informationOld.getStatus() == 1) {
			// 补充修改
			InformationChange informationChange = new InformationChange();
			informationChange.setInformationId(id);
			StringBuffer originalData = new StringBuffer();
			StringBuffer newData = new StringBuffer();
			if(!StringUtils.trimToEmpty(informationOld.getProjectName()).equals(StringUtils.trimToEmpty(information.getProjectName()))){
				originalData.append("工程名称：").append(StringUtils.trimToEmpty(informationOld.getProjectName()));
				newData.append("工程名称：").append(StringUtils.trimToEmpty(information.getProjectName()));
				informationOld.setProjectName(StringUtils.trimToEmpty(information.getProjectName()));
			}
			if(!StringUtils.trimToEmpty(informationOld.getAddress()).equals(StringUtils.trimToEmpty(information.getAddress()))){
				if(originalData.length() > 0 || newData.length() > 0){
					originalData.append("<br>");
					newData.append("<br>");
				}
				originalData.append("工程地点：").append(StringUtils.trimToEmpty(informationOld.getAddress()));
				newData.append("工程地点：").append(StringUtils.trimToEmpty(information.getAddress()));
				informationOld.setAddress(StringUtils.trimToEmpty(information.getAddress()));
			}
			if(!StringUtils.trimToEmpty(informationOld.getConstructionCompany()).equals(StringUtils.trimToEmpty(information.getConstructionCompany()))){
				if(originalData.length() > 0 || newData.length() > 0){
					originalData.append("<br>");
					newData.append("<br>");
				}
				originalData.append("建设单位：").append(StringUtils.trimToEmpty(informationOld.getConstructionCompany()));
				newData.append("建设单位：").append(StringUtils.trimToEmpty(information.getConstructionCompany()));
				informationOld.setConstructionCompany(StringUtils.trimToEmpty(information.getConstructionCompany()));
			}
			if(!StringUtils.trimToEmpty(informationOld.getGeneralContractor()).equals(StringUtils.trimToEmpty(information.getGeneralContractor()))){
				if(originalData.length() > 0 || newData.length() > 0){
					originalData.append("<br>");
					newData.append("<br>");
				}
				originalData.append("总包方：").append(StringUtils.trimToEmpty(informationOld.getGeneralContractor()));
				newData.append("总包方：").append(StringUtils.trimToEmpty(information.getGeneralContractor()));
				informationOld.setGeneralContractor(StringUtils.trimToEmpty(information.getGeneralContractor()));
			}
			if(!StringUtils.trimToEmpty(informationOld.getJoinRealName()).equals(StringUtils.trimToEmpty(information.getJoinRealName()))){
				if(originalData.length() > 0 || newData.length() > 0){
					originalData.append("<br>");
					newData.append("<br>");
				}
				originalData.append("加盟客户姓名：").append(StringUtils.trimToEmpty(informationOld.getJoinRealName()));
				newData.append("加盟客户姓名：").append(StringUtils.trimToEmpty(information.getJoinRealName()));
				informationOld.setJoinRealName(StringUtils.trimToEmpty(information.getJoinRealName()));
			}
			if(!StringUtils.trimToEmpty(informationOld.getDecorationType()).equals(StringUtils.trimToEmpty(information.getDecorationType()))){
				if(originalData.length() > 0 || newData.length() > 0){
					originalData.append("<br>");
					newData.append("<br>");
				}
				originalData.append("装饰类别：").append(StringUtils.trimToEmpty(informationOld.getDecorationType()));
				newData.append("装饰类别：").append(StringUtils.trimToEmpty(information.getDecorationType()));
				informationOld.setDecorationType(StringUtils.trimToEmpty(information.getDecorationType()));
			}
			if(!StringUtils.trimToEmpty(informationOld.getQuantities()).equals(StringUtils.trimToEmpty(information.getQuantities()))){
				if(originalData.length() > 0 || newData.length() > 0){
					originalData.append("<br>");
					newData.append("<br>");
				}
				originalData.append("工程量：").append(StringUtils.trimToEmpty(informationOld.getQuantities()));
				newData.append("工程量：").append(StringUtils.trimToEmpty(information.getQuantities()));
				informationOld.setQuantities(StringUtils.trimToEmpty(information.getQuantities()));
			}
			if(!originalData.toString().equals(newData.toString())){
				informationChange.setOriginalData(originalData.toString());
				informationChange.setNewData(newData.toString());
				// 保存变更记录
				informationChangeService.insert(informationChange);
			}
		}
		informationOld.setDescription(StringUtils.trimToEmpty(information.getDescription()));
		service.update(informationOld);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("information", information);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		Information information = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("information", information);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}


	/*
	 * 确认缴费
	 */
	@RequestMapping(value = "/pay/{id}", method = RequestMethod.GET)
	public String processPaySubmit(@PathVariable String id,@RequestParam double serviceAmount, RedirectAttributes redirectAttrs) {
		Information information = service.get(id);
		information.setServiceAmount(serviceAmount);
		information.setPayFlag("1");
		information.setPayTime(new Date());
		information.setPayUser(Utility.getCurrentUserId());
		information.setStatus(2);
		service.update(information);
		redirectAttrs.addFlashAttribute("delMessage", "缴费成功");
		redirectAttrs.addFlashAttribute("information", information);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}


	/*
	 * 确认盖章
	 */
	@RequestMapping(value = "/seal/{id}", method = RequestMethod.GET)
	public String processSealSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		Information information = service.get(id);
		information.setSealFlag("1");
		information.setSealTime(new Date());
		information.setSealUser(Utility.getCurrentUserId());
		information.setStatus(3);
		service.update(information);
		redirectAttrs.addFlashAttribute("delMessage", "盖章成功");
		redirectAttrs.addFlashAttribute("information", information);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}


	/*
	 * 最终审核
	 */
	@RequestMapping(value = "/audit/{id}", method = RequestMethod.GET)
	public String processAuditSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		Information information = service.get(id);
		information.setStatus(4);
		information.setAuditTime(new Date());
		information.setAuditUser(Utility.getCurrentUserId());
		service.update(information);
		redirectAttrs.addFlashAttribute("delMessage", "审核成功");
		redirectAttrs.addFlashAttribute("information", information);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}


	/*
	 * 同意
	 */
	@RequestMapping(value = "/agree/{id}", method = RequestMethod.GET)
	public String agree(@PathVariable String id, RedirectAttributes redirectAttrs) {
		Information information = service.get(id);
		information.setStatus(1);
		information.setTrice(new Date());
		service.update(information);
		redirectAttrs.addFlashAttribute("delMessage", "同意成功");
		redirectAttrs.addFlashAttribute("information", information);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}
	



	/*
	 * 相似度
	 */
	@ResponseBody
	@RequestMapping(value = "/similarity", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
	public Map<String,Object> similarity(@RequestParam String text) {
		return service.getSimilarity(text);
	}
	
	
	/*
	 * 汇总报表页面
	 */
	@RequestMapping(value = "/full", method = RequestMethod.GET)
	public String full(@RequestParam(value = "p1", required = false) String p1,
			@RequestParam(value = "p2", required = false) String p2, @RequestParam(value = "orgid", required = false) String orgId,
			Model model) {
		model.addAttribute("page_title", "信息登记的详情信息");
		//获取列表显示列参数
		SysUser sysUser = SessionHelper.getCurrentSysUser();
		sysUser = sysUserService.get(sysUser.getId());
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
		List<Information> list = service.getAllBy(p1, p2, orgId);
		List<Map<String,Object>> listExport = service.getExport(list);
		model.addAttribute("list", listExport);
		model.addAttribute("total", service.getTotal(listExport));

		model.addAttribute("p1", p1);
		model.addAttribute("p2", p2);
		model.addAttribute("orgId", orgId);
		return JSP_PAGE_LIST_FULL;
	}
	

	@RequestMapping(value = "/export")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "p1", required = false) String p1, @RequestParam(value = "p2", required = false) String p2,
			@RequestParam(value = "orgid", required = false) String orgId) throws Exception {
		if (StringUtils.isBlank(orgId)) {
			if (SessionHelper.IsBusinessDepartment()) {
				// 如果是业务部门，并且未指定按单位的过滤条件
				orgId = SessionHelper.getCurrentSysUser().getOrganizationId();
			}
		}
		String EXCEL_HEADERS = "序号,登记日期,所属部门,加盟客户名称,工程名称,工程地点,建设单位,总包方,综合服务费,证书类别,证书使用人员姓名,使用起止时间,应收证书费,已收证书费,尚欠证书费";

		SysOrganization org = orgService.get(orgId);
		String orgName = org != null ? org.getOrganizationName() : Utility.EMPTY;
		String sheetName = orgName + "信息汇总（" + p1 + "至" + p2 + "）";

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
		styleDefault.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

		CellStyle styleHeader = wb.createCellStyle();
		styleHeader.cloneStyleFrom(styleDefault);
		styleHeader.setAlignment(CellStyle.ALIGN_CENTER);
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
		
		CellStyle styleTotal = wb.createCellStyle();
		styleTotal.cloneStyleFrom(styleDefault);
		styleTotal.setAlignment(CellStyle.ALIGN_RIGHT);
		Font font = wb.createFont();
		font.setBoldweight(Font.BOLDWEIGHT_BOLD);
		styleTotal.setFont(font);

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
		for (; cellIndex < 9; cellIndex++) {
			r0.getCell(cellIndex).setCellValue(r1.getCell(cellIndex).getStringCellValue());
			sheet1.addMergedRegion(new CellRangeAddress(0, 1, cellIndex, cellIndex));
		}
		r0.getCell(cellIndex).setCellValue("证书收费情况");
		sheet1.addMergedRegion(new CellRangeAddress(0, 0, cellIndex, cellIndex + 6 - 1));

		
		List<Information> list = service.getAllBy(p1, p2, orgId);
		List<Map<String,Object>> listExport = service.getExport(list);

		for (int i = 0; i < listExport.size(); i++) {
			Map<String,Object> information = listExport.get(i);
			int rowSize = Integer.parseInt(information.get("childSize").toString());
			if(rowSize > 0){
				int beginRowIndex = rowIndex;
				int endRowIndex = rowIndex + rowSize - 1;
				
				// 初始化表格（行+列）
				for(int j = 0; j < rowSize; j++){
					Row r = sheet1.createRow(rowIndex++);
					for(int k = 0;k < headers.length;k++){
						r.createCell(k).setCellStyle(styleDefault);
					}
				}
				// 信息行
				Row firstRow = sheet1.getRow(beginRowIndex);
				firstRow.getCell(0).setCellValue(i+1);
				firstRow.getCell(1).setCellValue(DateUtils.parseDate(information.get("trice").toString(), "yyyy-MM-dd"));
				firstRow.getCell(1).setCellStyle(styleDate);
				firstRow.getCell(2).setCellValue(information.get("organizationName").toString());
				firstRow.getCell(3).setCellValue(information.get("joinRealName").toString());
				firstRow.getCell(4).setCellValue(information.get("projectName").toString());
				firstRow.getCell(5).setCellValue(information.get("address").toString());
				firstRow.getCell(6).setCellValue(information.get("constructionCompany").toString());
				firstRow.getCell(7).setCellValue(information.get("generalContractor").toString());
				firstRow.getCell(8).setCellValue(Double.parseDouble(information.get("serviceAmount").toString()));
				firstRow.getCell(8).setCellStyle(styleRMB);
				// 合并单元格
				for(int j = 0; j < 9; j++){
					sheet1.addMergedRegion(new CellRangeAddress(beginRowIndex, endRowIndex, j, j));
				}
				
				// 证书费用行
				List<InformationCertificateAmount> listAmount = (List<InformationCertificateAmount>) information.get("listAmount");
				for (int j = 0; j < listAmount.size(); j++) {
					InformationCertificateAmount amount = listAmount.get(j);
					Row row = sheet1.getRow(beginRowIndex + j);
					row.getCell(9).setCellValue(amount.getType());
					row.getCell(10).setCellValue(amount.getRealName());
					row.getCell(11).setCellValue(DateFormatUtils.format(amount.getBeginTime(), "yyyy-MM-dd") + "至" + DateFormatUtils.format(amount.getEndTime(), "yyyy-MM-dd"));
					row.getCell(12).setCellValue(amount.getPlanAmount());
					row.getCell(12).setCellStyle(styleRMB);
					row.getCell(13).setCellValue(amount.getRealAmount());
					row.getCell(13).setCellStyle(styleRMB);
					row.getCell(14).setCellValue(amount.getOweAmount());
					row.getCell(14).setCellStyle(styleRMB);
				}
				// 小计行
				Row lastRow = sheet1.getRow(endRowIndex);
				Map<String,Object> subtotal = (Map<String, Object>) information.get("subtotal");
				lastRow.getCell(9).setCellValue(subtotal.get("title").toString());
				lastRow.getCell(9).setCellStyle(styleTotal);
				sheet1.addMergedRegion(new CellRangeAddress(endRowIndex, endRowIndex, 9, 11));
				lastRow.getCell(12).setCellValue(Double.parseDouble(subtotal.get("planAmount").toString()));
				lastRow.getCell(12).setCellStyle(styleRMB);
				lastRow.getCell(13).setCellValue(Double.parseDouble(subtotal.get("realAmount").toString()));
				lastRow.getCell(13).setCellStyle(styleRMB);
				lastRow.getCell(14).setCellValue(Double.parseDouble(subtotal.get("oweAmount").toString()));
				lastRow.getCell(14).setCellStyle(styleRMB);
			}else{
				Row firstRow = sheet1.createRow(rowIndex++);
				for(int k = 0;k < headers.length;k++){
					firstRow.createCell(k).setCellStyle(styleDefault);
				}
				// 信息行
				firstRow.getCell(0).setCellValue(i+1);
				firstRow.getCell(1).setCellValue(information.get("trice").toString());
				firstRow.getCell(1).setCellStyle(styleDate);
				firstRow.getCell(2).setCellValue(information.get("organizationName").toString());
				firstRow.getCell(3).setCellValue(information.get("joinRealName").toString());
				firstRow.getCell(4).setCellValue(information.get("projectName").toString());
				firstRow.getCell(5).setCellValue(information.get("address").toString());
				firstRow.getCell(6).setCellValue(information.get("constructionCompany").toString());
				firstRow.getCell(7).setCellValue(information.get("generalContractor").toString());
				firstRow.getCell(8).setCellValue(information.get("serviceAmount").toString());
				firstRow.getCell(8).setCellStyle(styleRMB);
			}
		}
		// 合计行
		Row totalRow = sheet1.createRow(rowIndex);
		for(int i = 0;i < headers.length;i++){
			totalRow.createCell(i).setCellStyle(styleFooter);
		}
		sheet1.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, 0, 7));
		sheet1.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, 9, 11));

		Map<String,Object> total = service.getTotal(listExport);
		totalRow.getCell(0).setCellValue("合计");
		totalRow.getCell(0).setCellStyle(styleTotal);
		totalRow.getCell(8).setCellValue(total.get("serviceAmount").toString());
		totalRow.getCell(8).setCellStyle(styleRMB);
		totalRow.getCell(12).setCellValue(Double.parseDouble(total.get("planAmount").toString()));
		totalRow.getCell(12).setCellStyle(styleRMB);
		totalRow.getCell(13).setCellValue(Double.parseDouble(total.get("realAmount").toString()));
		totalRow.getCell(13).setCellStyle(styleRMB);
		totalRow.getCell(14).setCellValue(Double.parseDouble(total.get("oweAmount").toString()));
		totalRow.getCell(14).setCellStyle(styleRMB);
		
		for (int i = 0; i < headers.length; i++) {
			sheet1.autoSizeColumn(i, true);
		}
		
		wb.write(response.getOutputStream());
	}
}
