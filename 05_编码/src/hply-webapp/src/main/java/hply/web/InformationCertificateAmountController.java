package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.Information;
import hply.domain.InformationCertificateAmount;
import hply.domain.SysParameter;
import hply.domain.SysUser;
import hply.service.InformationCertificateAmountService;
import hply.service.InformationService;
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
@RequestMapping(value = InformationCertificateAmountController.URI)
public class InformationCertificateAmountController {

	@Autowired
	private InformationCertificateAmountService service;

	@Autowired
	private SysOrganizationService orgService;

	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysParameterService paramService;

	@Autowired
	private InformationService informationservice;
	
	
	public static final String URI = "/information/certificate/amount";
	public static final String JSP_PAGE_LIST = "information-certificate-amount-list";
	public static final String JSP_PAGE_DETAIL = "information-certificate-amount-detail";
	public static final String JSP_PAGE_MODIFY = "information-certificate-amount-modify";
	public static final String JSP_PAGE_CHARGE = "information-certificate-amount-charge";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "p", required = false) Integer p, @RequestParam(value = "q", required = false) String q,
			Model model) {
		model.addAttribute("page_title", "信息登记证书费");

		int pageIndex = p != null ? p.intValue() : 0;
		
		int pageSize = paramService.getParamIntValue("page_size", 30);
		int rowCount = service.getRowCount();
		int pageCount = rowCount / pageSize + (rowCount % pageSize == 0 ? 0 : 1);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPageStarted", pageIndex * pageSize);
		List<InformationCertificateAmount> list = service.getAllPaged(pageIndex * pageSize, pageSize);
		for (InformationCertificateAmount item : list) {
			SysUser createUser = sysUserService.get(item.getCreateUser());
			item.setField01(item.getCreateUser());
			item.setCreateUser(createUser != null ? createUser.getRealName() : Utility.EMPTY);
		}
		model.addAttribute("list", list);
		return JSP_PAGE_LIST;
	}

	/*
	 * 详情页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		model.addAttribute("page_title", "信息登记证书费的详情信息");
		model.addAttribute("informationCertificateAmount", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model,@RequestParam String informationId) {
		Information information = informationservice.get(informationId);
		information.setOrganizationId(orgService.get(information.getOrganizationId()).getOrganizationName());
		model.addAttribute("information", information);
		InformationCertificateAmount informationCertificateAmount = new InformationCertificateAmount();
		informationCertificateAmount.setInformationId(informationId);
		model.addAttribute("informationCertificateAmount", informationCertificateAmount);
		// 获取证书费
		SysParameter certificateType = paramService.getByEnName("certificate_type");
		model.addAttribute("typeId", certificateType.getId());
		model.addAttribute("type", certificateType.getParamValue().split("/"));
		model.addAttribute("page_title", "新建信息登记证书费");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		InformationCertificateAmount informationCertificateAmount = service.get(id);
		model.addAttribute("informationCertificateAmount", informationCertificateAmount);
		Information information = informationservice.get(informationCertificateAmount.getInformationId());
		information.setOrganizationId(orgService.get(information.getOrganizationId()).getOrganizationName());
		model.addAttribute("information", information);
		// 获取证书费
		SysParameter certificateType = paramService.getByEnName("certificate_type");
		model.addAttribute("typeId", certificateType.getId());
		model.addAttribute("type", certificateType.getParamValue().split("/"));
		model.addAttribute("page_title", "修改信息登记证书费");
		return JSP_PAGE_MODIFY;
	}


	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/charge/{id}", method = RequestMethod.GET)
	public String chargeForm(Model model,@PathVariable String id) {
		InformationCertificateAmount informationCertificateAmount = service.get(id);
		model.addAttribute("informationCertificateAmount", informationCertificateAmount);
		Information information = informationservice.get(informationCertificateAmount.getInformationId());
		information.setOrganizationId(orgService.get(information.getOrganizationId()).getOrganizationName());
		model.addAttribute("information", information);
		model.addAttribute("statusName", Utility.getStatusName(information.getStatus()));
		model.addAttribute("page_title", "信息登记证书费收费");
		return JSP_PAGE_CHARGE;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid InformationCertificateAmount informationCertificateAmount, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(informationCertificateAmount.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}
		informationCertificateAmount.setCreateUser(SessionHelper.getCurrentUserId());
		service.insert(informationCertificateAmount);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("informationCertificateAmount", informationCertificateAmount);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid InformationCertificateAmount informationCertificateAmount, BindingResult result,
			Model model, RedirectAttributes redirectAttrs) {
		Utility.println(informationCertificateAmount.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		informationCertificateAmount.setLockFlag(StringUtils.isEmpty(informationCertificateAmount.getLockFlag())? "0" : informationCertificateAmount.getLockFlag());
		InformationCertificateAmount old = service.get(id);
		service.delete(id);
		informationCertificateAmount.setInformationId(old.getInformationId());
		service.insert(informationCertificateAmount);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("informationCertificateAmount", informationCertificateAmount);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}
	
	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/charge/{id}", method = RequestMethod.POST)
	public String processChargeSubmit(@PathVariable String id, @Valid InformationCertificateAmount informationCertificateAmount, BindingResult result,
			Model model, RedirectAttributes redirectAttrs) {
		Utility.println(informationCertificateAmount.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_CHARGE;
		}

		InformationCertificateAmount old = service.get(id);
		old.setId(Utility.getRandomUUID());
		old.setRealAmount(informationCertificateAmount.getRealAmount());
		service.delete(id);
		service.insert(old);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("informationCertificateAmount", old);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		InformationCertificateAmount informationCertificateAmount = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("informationCertificateAmount", informationCertificateAmount);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}
}
