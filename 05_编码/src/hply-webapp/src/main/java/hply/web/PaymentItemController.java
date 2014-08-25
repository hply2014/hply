﻿package hply.web;


import java.util.List;
import hply.core.Utility;
import hply.domain.PaymentItem;
import hply.service.PaymentItemService;
import hply.service.SysParameterService;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value = PaymentItemController.URI)
public class PaymentItemController {
    
	@Autowired
    private PaymentItemService service;
    
	@Autowired
	private SysParameterService paramService;

	public static final String URI = "/paymentitem";
	public static final String JSP_PAGE_LIST = "paymentitem-list";
	public static final String JSP_PAGE_DETAIL = "paymentitem-detail";
	public static final String JSP_PAGE_MODIFY = "paymentitem-modify";
    
    
	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value="p", required = false) Integer p, Model model) {
		model.addAttribute("page_title", "付款科目");
        
		int pageIndex = p != null ? p.intValue() : 0;
		int pageSize = paramService.getParamIntValue("page_size", 30);
		int rowCount = service.getRowCount();
		int pageCount = rowCount / pageSize + (rowCount % pageSize == 0 ? 0 : 1);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPageStarted", pageIndex * pageSize);
		List<PaymentItem> list = service.getAllPaged(pageIndex * pageSize, pageSize);
		model.addAttribute("list", list);
        
		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "付款科目的详情信息");
		model.addAttribute("paymentItem", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("paymentItem", new PaymentItem());
		model.addAttribute("page_title", "新建付款科目");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		model.addAttribute("paymentItem", service.get(id));
		model.addAttribute("page_title", "修改付款科目");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid PaymentItem paymentItem,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		Utility.println(paymentItem.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.insert(paymentItem);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("paymentItem", paymentItem);
		return "redirect:" + URI;
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id,
			@Valid PaymentItem paymentItem, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(paymentItem.toString());
		
		if (result.hasErrors()) {
			return JSP_PAGE_MODIFY;
		}

		service.update(paymentItem);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("paymentItem", paymentItem);
		return "redirect:" + URI;
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id,
			RedirectAttributes redirectAttrs) {
		PaymentItem paymentItem = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("paymentItem", paymentItem);
		return "redirect:" + URI;
	}
}

