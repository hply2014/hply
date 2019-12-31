package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.InformationCertificate;
import hply.domain.SysParameter;
import hply.domain.SysUser;
import hply.service.InformationCertificateService;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping(value = InformationCertificateController.URI)
public class InformationCertificateController {

	@Autowired
	private InformationCertificateService service;

	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysParameterService paramService;
	public static final String URI = "/information/certificate";
	public static final String JSP_PAGE_LIST = "information-certificate-list";
	public static final String JSP_PAGE_DETAIL = "information-certificate-detail";
	public static final String JSP_PAGE_MODIFY = "information-certificate-modify";

	/*
	 * 列表页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "p", required = false) Integer p, @RequestParam(value = "q", required = false) String q,
			Model model) {
		model.addAttribute("page_title", "信息登记证书类别");

		int pageIndex = p != null ? p.intValue() : 0;
		
		int pageSize = paramService.getParamIntValue("page_size", 30);
		int rowCount = service.getRowCount();
		int pageCount = rowCount / pageSize + (rowCount % pageSize == 0 ? 0 : 1);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPageStarted", pageIndex * pageSize);
		List<InformationCertificate> list = service.getAllPaged(pageIndex * pageSize, pageSize);
		for (InformationCertificate item : list) {
			SysUser createUser = sysUserService.get(item.getCreateUser());
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
		model.addAttribute("page_title", "信息登记证书类别的详情信息");
		model.addAttribute("informationCertificate", service.get(id));
		return JSP_PAGE_DETAIL;
	}

	/*
	 * 新建页面
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("informationCertificate", new InformationCertificate());
		// 获取证书类别
		SysParameter certificateType = paramService.getByEnName("certificate_type");
		model.addAttribute("typeId", certificateType.getId());
		model.addAttribute("type", certificateType.getParamValue().split("/"));
		model.addAttribute("page_title", "新建信息登记证书类别");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 修改页面
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable String id, Model model) {
		model.addAttribute("informationCertificate", service.get(id));
		// 获取证书类别
		SysParameter certificateType = paramService.getByEnName("certificate_type");
		model.addAttribute("typeId", certificateType.getId());
		model.addAttribute("type", certificateType.getParamValue().split("/"));
		model.addAttribute("page_title", "修改信息登记证书类别");
		return JSP_PAGE_MODIFY;
	}

	/*
	 * 处理新建页面的提交动作
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processCreateSubmit(@Valid InformationCertificate informationCertificate, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		Utility.println(informationCertificate.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		service.insert(informationCertificate);
		redirectAttrs.addFlashAttribute("message", "插入成功");

		redirectAttrs.addFlashAttribute("informationCertificate", informationCertificate);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 处理修改页面的提交动作
	 */
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String processUpdateSubmit(@PathVariable String id, @Valid InformationCertificate informationCertificate, BindingResult result,
			Model model, RedirectAttributes redirectAttrs) {
		Utility.println(informationCertificate.toString());

		if (result.hasErrors()) {
			model.addAttribute("errors", "1");
			return JSP_PAGE_MODIFY;
		}

		informationCertificate.setLockFlag(StringUtils.isEmpty(informationCertificate.getLockFlag())? "0" : informationCertificate.getLockFlag());
		service.update(informationCertificate);
		redirectAttrs.addFlashAttribute("message", "修改成功");

		redirectAttrs.addFlashAttribute("informationCertificate", informationCertificate);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 删除页面
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String processDeleteSubmit(@PathVariable String id, RedirectAttributes redirectAttrs) {
		InformationCertificate informationCertificate = service.get(id);
		service.delete(id);
		redirectAttrs.addFlashAttribute("delMessage", "删除成功");
		redirectAttrs.addFlashAttribute("informationCertificate", informationCertificate);
		return "redirect:" + SessionHelper.getLastUrl(URI);
	}

	/*
	 * 根据证书类型和是否锁证获取一个对象
	 */
	@RequestMapping(value = "/get.json", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
	public @ResponseBody String get(@RequestParam String type, @RequestParam String lockFlag) {
		return JSON.toJSONString(service.getBy(type, lockFlag), Utility.JSON_FEATURES);
	}
}
