﻿package hply.web;

import hply.core.Utility;
import hply.domain.Payment;
import hply.domain.PaymentItem;
import hply.domain.Project;
import hply.domain.SysUser;
import hply.service.PaymentItemService;
import hply.service.PaymentService;
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
@RequestMapping(value = PaymentController.URI)
public class PaymentController {

	@Autowired
	private PaymentService service;

	@Autowired
	private SysParameterService paramService;

	@Autowired
	private ProjectService projectService;

	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private PaymentItemService paymentItemService;
	
	public static final String URI = "/payment";
	public static final String JSP_PAGE_LIST = "payment-list";
	public static final String JSP_PAGE_DETAIL = "payment-detail";
	public static final String JSP_PAGE_MODIFY = "payment-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("page_title", "付款情况");

		List<Payment> list = service.getAll();
		for (Payment item : list) {
			Project pjt = projectService.get(item.getProjectId());
			item.setProjectId(pjt != null ? "[" + pjt.getProjectCode() + "]" + pjt.getProjectName() : Utility.EMPTY);

			SysUser user = sysUserService.get(item.getCreateUser());
			item.setCreateUser(user != null ? user.getRealName() : Utility.EMPTY);

			PaymentItem pi = paymentItemService.get(item.getPaymentItemId());
			item.setPaymentItemId(pi != null ? pi.getItemName() : Utility.EMPTY);

		}
		model.addAttribute("list", list);

		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "付款情况的详情信息");
		model.addAttribute("payment", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {

		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		Payment payment = new Payment();
		payment.setTicketCode(paramService.getNextCode("payment_code"));

		String payTypes = paramService.getByEnName("pay_types").getParamValue();
		model.addAttribute("paymenttypelist", payTypes.split("/"));

		List<PaymentItem> pi = paymentItemService.getAll();
		model.addAttribute("paymentitemlist", pi);
		
		model.addAttribute("payment", payment);
		model.addAttribute("page_title", "新建付款情况");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		List<Project> projectlist = projectService.getAllNames();
		model.addAttribute("projectlist", projectlist);
		model.addAttribute("payment", service.get(id));
		model.addAttribute("page_title", "修改付款情况");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid Payment payment, BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(payment.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.insert(payment);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("payment", payment);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid Payment payment, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(payment.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.update(payment);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("payment", payment);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		Payment payment = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("payment", payment);
		return "redirect:" + URI;
	}
}
