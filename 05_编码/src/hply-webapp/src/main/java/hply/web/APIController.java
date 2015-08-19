package hply.web;

import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.ArrearsInterest;
import hply.domain.PaymentItem;
import hply.domain.Project;
import hply.domain.SysAuthorization;
import hply.domain.SysUser;
import hply.domain.TreeNode;
import hply.service.ArrearsInterestService;
import hply.service.ArrearsService;
import hply.service.CollectionsService;
import hply.service.PartyBillingService;
import hply.service.PaymentItemService;
import hply.service.PaymentService;
import hply.service.ProjectService;
import hply.service.SysAuthorizationService;
import hply.service.SysOrganizationService;
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

	@Autowired
	private SysOrganizationService orgService;

	@Autowired
	private ArrearsInterestService arrearsInterestService;

	@RequestMapping(value = "/tree/{userId}")
	public @ResponseBody TreeNode getTreeNode(@PathVariable String userId) {
		Utility.println("getTreeData ..." + userId);
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

	/*
	 * 
	 */
	@RequestMapping(value = "/camounts/{projectId}", method = RequestMethod.POST)
	public @ResponseBody String getCollectionsTooltipAmounts(@PathVariable String projectId) {
		// 工程款剩余
		double d1 = collectionsService.getSurplusProjectAmount(projectId);

		// 计算的往来欠款总额
		Double val2 = arrearsService.getTotalByProject(projectId);
		double d2 = val2 != null ? val2.doubleValue() : 0;

		// 计算工程款结存
		double j0 = collectionsService.getTotalCollectionsAmount(projectId) - paymentService.getToalPayment(projectId);

		DecimalFormat dformat = new DecimalFormat("#,##0.00");

		// 工程款剩余（合同款 - 收款）|往来欠款总额|工程款结存（收-付）
		return dformat.format(d1) + "|" + dformat.format(d2) + "|" + dformat.format(j0);
	}

	/*
	 * 
	 */
	@RequestMapping(value = "/pamounts/{projectId}", method = RequestMethod.POST)
	public @ResponseBody String getPaymentTooltipAmounts(@PathVariable String projectId) {
		// 计算的已开发票欠款额：已审核的发票金额 - 收款中的工程款
		// 已审核通过的开票额，所有的
		double d1 = paryBillingService.getAllCheckedAmount(projectId);
		// 收到的工程款总额
		double g1 = collectionsService.getTotalCollectionsAmount(projectId);

		// 计算的往来欠款总额
		double d2 = arrearsService.getTotalByProject(projectId);

		// 计算工程款结存
		// double j0 = g1 - paymentService.getToalPayment(projectId);
		double j0 = g1 - paymentService.getAllToalPayment(projectId);

		DecimalFormat dformat = new DecimalFormat("#,##0.00");

		// 已开发票欠款额|往来欠款总额|工程款结存（收-付）
		return dformat.format(d1 - g1) + "|" + dformat.format(d2) + "|" + dformat.format(j0);
	}

	@RequestMapping(value = "/alllimitamount/{projectId}/{itemId}", method = RequestMethod.POST)
	public @ResponseBody String getAllLimitAmount(@PathVariable String projectId, @PathVariable String itemId) {

		// 已审核通过的开票额，今年的
		double d1 = paryBillingService.getCheckedAmount(projectId);

		// 该期间费用的累计报销额
		double d2 = paymentService.getTotalPaymentByItem(projectId, itemId);

		// 计算某工程指定期间费用项目的限额
		PaymentItem pi = paymentItemService.get(itemId);
		double limitA = d1 * pi.getReimbursementCap() / 100;

		DecimalFormat dformat = new DecimalFormat("#,##0.00");

		// 已开票额|报销上限|报销累计|报销剩余
		return dformat.format(d1) + "|" + dformat.format(limitA) + "|" + dformat.format(d2) + "|" + dformat.format(limitA - d2);
	}

	@RequestMapping(value = "/getprojectmanager/{projectId}", method = RequestMethod.POST)
	public @ResponseBody String getProjectManager(@PathVariable String projectId) {
		Project pjt = projectService.get(projectId);
		return pjt.getManager();
	}

	@RequestMapping(value = "/getinterestdetail/{arrearsId}", method = RequestMethod.POST)
	public @ResponseBody List<ArrearsInterest> getInterestDetail(@PathVariable String arrearsId) {
		return arrearsInterestService.getDetail(arrearsId);
	}

	// "<s:url value='/api/repay/'/>" + aid +"/" + $("#repay_amount0").val() +
	// "/" + $("#repay_amount1").val()
	@RequestMapping(value = "/repay/{arrearsId}/{amount}/{interest}", method = RequestMethod.POST)
	public @ResponseBody String repay(@PathVariable String arrearsId, @PathVariable Double amount, @PathVariable Double interest) {
		// TODO 还款，
		System.out.println(arrearsId + "," + amount + "," + interest);
		arrearsService.repay(arrearsId, amount, interest);
		return "{\"message\":\"OK\"}";
	}

	@RequestMapping(value = "/setlasturl", method = RequestMethod.POST)
	public @ResponseBody String setLastUrl(@RequestParam String url) {
		System.out.println("Last URL=" + url);
		SessionHelper.setLastUrl(url);
		return "{\"message\":\"OK\"}";
	}

	@RequestMapping(value = "/getarrearsamount/{projectId}", method = RequestMethod.POST)
	public @ResponseBody String getArrearsAmount(@PathVariable String projectId) {

		// 计算的往来欠款总额
		Double val2 = arrearsService.getTotalByProject(projectId);
		double q1 = val2 != null ? val2.doubleValue() : 0;

		// 应收利息总额
		Double q2 = arrearsInterestService.getPlanInterest(projectId);

		// 已收利息总额
		Double q3 = arrearsService.getInterestAmount(projectId);

		DecimalFormat dformat = new DecimalFormat("#,##0.00");

		// 往来欠款总额|应收利息总额|已收利息总额
		return dformat.format(q1) + "|" + dformat.format(q2) + "|" + dformat.format(q3);

	}

	@RequestMapping(value = "/projectdetail/{projectId}", method = RequestMethod.POST)
	public @ResponseBody String getProjectdetail(@PathVariable String projectId) {
		// 工程欠款=IF（结算额>0，结算额，合同额+累计调增）-已收工程款
		double q1 = collectionsService.getSurplusProjectAmount(projectId);

		Double val2 = arrearsService.getTotalByProject(projectId);

		// 往来欠款（本金）=
		double q2 = val2 != null ? val2.doubleValue() : 0;

		// 应收利息总额
		Double j1 = arrearsInterestService.getPlanInterest(projectId);

		// 已收利息总额
		Double j2 = arrearsService.getInterestAmount(projectId);

		// 已审核通过的开票额
		double k1 = paryBillingService.getAllCheckedAmount(projectId);

		// 收到的工程款总额
		double g1 = collectionsService.getTotalCollectionsAmount(projectId);

		// 计算的已开发票欠款额：已审核的发票金额 - 收款中的工程款
		double k2 = k1 - g1;

		// 计算工程款结存
		double k3 = g1 - paymentService.getAllToalPayment(projectId);

		DecimalFormat dformat = new DecimalFormat("#,##0.00");

		// 工程欠款|应收利息总额|已收利息总额
		return dformat.format(q1) + "|" + dformat.format(q2) + "|" + dformat.format(j1) + "|" + dformat.format(j2) + "|"
				+ dformat.format(k1) + "|" + dformat.format(k2) + "|" + dformat.format(k3);

	}

	@RequestMapping(value = "/batchcheck", method = RequestMethod.POST)
	public @ResponseBody String batchCheck(@RequestParam String projectId, @RequestParam String modelId) {
		System.out.println(projectId + "," + modelId);
		projectService.batchCheck(projectId, modelId);
		return "OK|" + SessionHelper.getLastUrl(null);
	}

}
