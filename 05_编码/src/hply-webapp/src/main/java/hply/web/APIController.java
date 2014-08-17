package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.PaymentItem;
import hply.domain.SysAuthorization;
import hply.domain.SysUser;
import hply.domain.TreeNode;
import hply.service.ArrearsService;
import hply.service.CollectionsService;
import hply.service.PartyBillingService;
import hply.service.PaymentItemService;
import hply.service.PaymentService;
import hply.service.ProjectService;
import hply.service.SysAuthorizationService;
import hply.service.SysResourceService;
import hply.service.SysUserService;

import java.text.DecimalFormat;
import java.util.List;

import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class APIController {

	@Autowired
	private SysResourceService sysResourceService;

	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysAuthorizationService sysAuthorizationService;

	@Autowired
	private ProjectService projectService;

	@Autowired
	private ArrearsService arrearsService;

	@Autowired
	private CollectionsService collectionsService;

	@Autowired
	private PartyBillingService paryBillingService;

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private PaymentItemService paymentItemService;

	@RequestMapping(value = "/tree/{userId}")
	public @ResponseBody TreeNode getTreeNode(@PathVariable String userId) {
		System.out.println("getTreeData ..." + userId);
		return sysResourceService.getRootTreeNode(userId);
	}

	@RequestMapping(value = "/resetall/{password}")
	public @ResponseBody String resetAllPasswords(@PathVariable String password) {
		String str = Utility.EMPTY;
		List<SysUser> list = sysUserService.getAll();
		for (SysUser user : list) {
			user.setPassword(password);
			sysUserService.hashedPassword(user);
			sysUserService.update(user);
			str += "RESET PASSWORD:" + user.getLoginName() + "," + user.getRealName() + "\r\n";
		}
		return str;
	}

	@RequestMapping(value = "/reset/{loginName}/{password}")
	public @ResponseBody String reset(@PathVariable String loginName, @PathVariable String password) {
		SysUser user = sysUserService.getByLoginName(loginName);
		user.setPassword(password);
		sysUserService.hashedPassword(user);
		sysUserService.update(user);
		return "RESET PASSWORD:" + user + "\r\n";
	}

	@RequestMapping(value = "/resetpassword", method = RequestMethod.POST)
	public @ResponseBody String resetPassword(@RequestParam String id, @RequestParam String password) {
		SysUser user = sysUserService.get(id);
		user.setPassword(password);
		sysUserService.hashedPassword(user);
		sysUserService.update(user);
		return "密码重置成功，" + user.getRealName();
	}

	@RequestMapping(value = "/changepassword", method = RequestMethod.POST)
	public @ResponseBody String changePassword(@RequestParam String id, @RequestParam String password0, @RequestParam String password) {
		SysUser user = sysUserService.get(id);
		String hashedPassword = new Sha256Hash(password0, user.getId(), 1).toString();
		if (password0.equals(password)) {
			return "原密码与新密码不能一样。";
		}
		if (!hashedPassword.equals(user.getPassword())) {
			return "原密码输入错误，请重新输入。";
		}
		user.setPassword(password);
		sysUserService.hashedPassword(user);
		user.setMustChangePassword(false);
		sysUserService.update(user);
		SessionHelper.setAttribute(SessionHelper.CURRENT_SYS_USER, user);
		return "密码修改成功，" + user.getRealName();
	}

	@RequestMapping(value = "/auth/{userId}/{resourceId}", method = RequestMethod.POST)
	public @ResponseBody String authorization(@PathVariable String userId, @PathVariable String resourceId) {
		SysAuthorization auth = sysAuthorizationService.getByUserIdAndResource(userId, resourceId);
		if (auth != null) {
			sysAuthorizationService.delete(auth.getId());
			return "授权取消，执行成功";
		} else {
			SysAuthorization sysAuthorization = new SysAuthorization();
			sysAuthorization.setUserId(userId);
			sysAuthorization.setResourceId(resourceId);
			sysAuthorizationService.insert(sysAuthorization);
		}
		return "授权设置，执行成功";
	}

	/*
	 * 
	 */
	@RequestMapping(value = "/capitaloccupied/{projectId}", method = RequestMethod.POST)
	public @ResponseBody String getCapitalOccupied(@PathVariable String projectId) {
		// 计算占用资金情况
		DecimalFormat df = new DecimalFormat("#,##0.00");
		Double v = arrearsService.getTotalByProject(projectId);
		double d = v != null ? v.doubleValue() : 0;
		return df.format(d);
	}

	// @RequestMapping(value = "/taxplanamount", method = RequestMethod.POST)
	// public @ResponseBody String updateTaxPlanAmount(@RequestParam String id,
	// @RequestParam Double data) {
	// // 修改应缴税金
	// if (data == null || data == 0) {
	// return "应缴税金修改失败，可能是输入的值无效。";
	// }
	// projectService.updateTaxPlanAmount(id, data);
	// return "应缴税金修改成功，额度： " + data;
	// }
	//
	// @RequestMapping(value = "/managementplanamount", method =
	// RequestMethod.POST)
	// public @ResponseBody String updateManagementPlanAmount(@RequestParam
	// String id, @RequestParam Double data) {
	// // 修改应收管理费
	// if (data == null || data == 0) {
	// return "应收管理费修改失败，可能是输入的值无效。";
	// }
	// projectService.updateManagementPlanAmount(id, data);
	// return "应收管理费修改成功，额度： " + data;
	// }

	@RequestMapping(value = "/suprplusamounts/{projectId}", method = RequestMethod.POST)
	public @ResponseBody String getSurplusAmounts(@PathVariable String projectId) {
		// 计算的工程款剩余
		double d1 = collectionsService.getSurplusProjectAmount(projectId);

		// 计算的往来欠款总额
		Double val2 = arrearsService.getTotalByProject(projectId);
		double d2 = val2 != null ? val2.doubleValue() : 0;

		DecimalFormat dformat = new DecimalFormat("#,##0.00");
		return dformat.format(d1) + "|" + dformat.format(d2);
	}

	@RequestMapping(value = "/alllimitamount/{projectId}/{itemId}", method = RequestMethod.POST)
	public @ResponseBody String getAllLimitAmount(@PathVariable String projectId, @PathVariable String itemId) {
		// 计算某工程指定期间费用项目的限额

		// 已审核通过的开票额
		double d1 = paryBillingService.getCheckedAmount(projectId);

		// 该期间费用的累计报销额
		double d2 = paymentService.getTotalPaymentByItem(projectId, itemId);

		PaymentItem pi = paymentItemService.get(itemId);
		double limitA = d1 * pi.getReimbursementCap() / 100;

		DecimalFormat dformat = new DecimalFormat("#,##0.00");

		// 已开票额|报销上限|报销累计|报销剩余
		return dformat.format(d1) + "|" + dformat.format(limitA) + "|" + dformat.format(d2) + "|" + dformat.format(limitA - d2);
	}

}
