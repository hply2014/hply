package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.CustomerBilling;
import hply.domain.Payment;
import hply.domain.PaymentItem;
import hply.domain.Project;
import hply.domain.SysOrganization;
import hply.domain.SysParameter;
import hply.domain.SysUser;
import hply.domain.Where;
import hply.service.CustomerBillingService;
import hply.service.PaymentItemService;
import hply.service.PaymentService;
import hply.service.ProjectService;
import hply.service.SysOrganizationService;
import hply.service.SysParameterService;
import hply.service.SysUserService;

import java.util.Date;
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
@RequestMapping(value = CustomerBillingController.URI)
public class CustomerBillingController {

	@Autowired
	private CustomerBillingService service;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysParameterService paramService;
	
	@Autowired
	private SysOrganizationService orgService;
	
	@Autowired
	private PaymentService paymentService;

	@Autowired
	private PaymentItemService paymentItemService;
	
	public static final String URI = "/customerbilling";
	public static final String JSP_PAGE_LIST = "customerbilling-list";
	public static final String JSP_PAGE_DETAIL = "customerbilling-detail";
	public static final String JSP_PAGE_MODIFY = "customerbilling-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "p", required = false) Integer p, @RequestParam(value = "oid", required = false) String oid, Model model) {
		model.addAttribute("page_title", "客户开票情况");
		

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
		List<CustomerBilling> list = service.getAllPagedByOrganization(oid, pageIndex * pageSize, pageSize);

		for (CustomerBilling item : list) {
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
		model.addAttribute("page_title", "客户开票情况的详情信息");
		model.addAttribute("customerBilling", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(@RequestParam(value = "projectid", required = false) String projectId, Model model) {
		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		SysParameter billingTypes = paramService.getByEnName("billing_types");
		model.addAttribute("billingTypes", billingTypes.getParamValue().split("/"));
		model.addAttribute("billingTypesId", billingTypes.getId());

		String payTypes = paramService.getByEnName("pay_types").getParamValue();
		model.addAttribute("paymenttypelist", payTypes.split("/"));

		List<PaymentItem> pi = paymentItemService.getAll();
		model.addAttribute("paymentitemlist", pi);
		
		CustomerBilling item = new CustomerBilling();
		item.setProjectId(projectId);
		model.addAttribute("customerBilling", item);
		model.addAttribute("page_title", "新建客户开票情况");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		CustomerBilling customerBilling = service.get(id);
		if("1".equals(customerBilling.getIsAutoCreatePayment())){
			Payment payment = paymentService.getBy(Where.byColumnName("customer_billing_id", id));
			if(payment!=null){
				customerBilling.setPaymentItemId(payment.getPaymentItemId());
				customerBilling.setPayType(payment.getPayType());
			}
		}
		model.addAttribute("customerBilling", customerBilling);
		model.addAttribute("page_title", "修改客户开票情况");
		SysParameter billingTypes = paramService.getByEnName("billing_types");
		model.addAttribute("billingTypes", billingTypes.getParamValue().split("/"));
		model.addAttribute("billingTypesId", billingTypes.getId());

		String payTypes = paramService.getByEnName("pay_types").getParamValue();
		model.addAttribute("paymenttypelist", payTypes.split("/"));

		List<PaymentItem> pi = paymentItemService.getAll();
		model.addAttribute("paymentitemlist", pi);
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid CustomerBilling customerBilling, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(customerBilling.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		if(customerBilling.getIsAutoCreatePayment() == null){
			customerBilling.setIsAutoCreatePayment(0);
		}
		service.insert(customerBilling);
		
		// 自动生成付款记录
		createPament(customerBilling);
		
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("customerBilling", customerBilling);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid CustomerBilling customerBilling,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(customerBilling.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.delete(id);
		if(customerBilling.getIsAutoCreatePayment() == null){
			customerBilling.setIsAutoCreatePayment(0);
		}
		service.insert(customerBilling);
		
		// 自动生成付款记录
		createPament(customerBilling);
		
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("customerBilling", customerBilling);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}
	
	private void createPament(CustomerBilling customerBilling){
		Payment payment = paymentService.getBy(Where.byColumnName("customer_billing_id", customerBilling.getId()));
		if(new Integer(1).equals(customerBilling.getIsAutoCreatePayment())){
			// 先删除
			if(payment!=null){
				paymentService.delete(payment.getId());
			}
			// 后新增
			payment = new Payment();
			payment.setTrice(new Date());
			payment.setProjectId(customerBilling.getProjectId());
			payment.setAmount(customerBilling.getInvoiceAmount());
			payment.setPaymentItemId(customerBilling.getPaymentItemId());
			payment.setPayType(customerBilling.getPayType());
			payment.setCustomerBillingId(customerBilling.getId());
			payment.setStatus(0);
			payment.setDescription(customerBilling.getDescription());
			paymentService.insert(payment);
		}else{
			// 取消自动生成付款记录勾选删除
			if(payment!=null){
				paymentService.delete(payment.getId());
			}
		}
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		CustomerBilling customerBilling = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("customerBilling", customerBilling);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}
	/*
	 * 审核页面
	 */
	@RequestMapping(value = "/check/{id}", method = RequestMethod.GET)
	public String processCheckSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		CustomerBilling customerBilling = service.get(id);
		service.check(id);
		redirectAttrs.addFlashAttribute("delMessage", "审核成功");
		redirectAttrs.addFlashAttribute("customerBilling", customerBilling);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}
}
