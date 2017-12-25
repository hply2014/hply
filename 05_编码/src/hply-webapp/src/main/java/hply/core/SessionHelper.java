package hply.core;

import hply.domain.SysOrganization;
import hply.domain.SysUser;
import hply.domain.TreeNode;
import hply.service.SysResourceService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

public class SessionHelper {

	public static final String CURRENT_SYS_USER = "__CURRENT_SYS_USER";
	public static final String CURRENT_LOGIN_TIME = "__CURRENT_LOGIN_TIME";
	public static final String CURRENT_ROOT_TREE_NODE = "__CURRENT_PERMISSION";
	public static final String CURRENT_ORGANIZATION = "__CURRENT_ORGANIZATION";
	public static final String CURRENT_LAST_URL = "__CURRENT_LAST_URL";
	public static final String SSO = "__SSO";

	public static SysResourceService sysResourceService;
	
	public static void login(String userId, String password) {
		Subject currentUser = SecurityUtils.getSubject();
		setAttribute(CURRENT_LOGIN_TIME, new Date());
		UsernamePasswordToken token = new UsernamePasswordToken(userId, password);
		// ”Remember Me” built-in, just do this:
		token.setRememberMe(false);
		
		currentUser.login(token);
	}
	
	public static void login(String userId, String password, String flag) {
		Subject currentUser = SecurityUtils.getSubject();
		setAttribute(CURRENT_LOGIN_TIME, new Date());
		UsernamePasswordToken token = new UsernamePasswordToken(userId, password, flag);
		// ”Remember Me” built-in, just do this:
		token.setRememberMe(false);

		currentUser.login(token);
	}

	public static Subject getCurrentUser() {
		return SecurityUtils.getSubject();
	}

	public static SysUser getCurrentSysUser() {
		Object obj = getAttribute(CURRENT_SYS_USER);
		return obj instanceof SysUser ? (SysUser) obj : null;
	}
	
	public static String getCurrentUserId(){
		return getCurrentSysUser() != null ? getCurrentSysUser().getId() : Utility.EMPTY;
	}

	public static String getCurrentRealName() {
		SysUser user = getCurrentSysUser();
		return user != null ? user.getRealName() : Utility.EMPTY;
	}

	public static String getLoginTime() {
		Object obj = (Date) getAttribute(CURRENT_LOGIN_TIME);
		if (obj instanceof Date) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return formatter.format((Date) obj);
		}

		return Utility.EMPTY;
	}
	
	public static boolean IsBusinessDepartment(){
		SysOrganization org = (SysOrganization) getAttribute(CURRENT_ORGANIZATION);
		return org != null && org.getDescription() != null && org.getDescription().indexOf("业务") >= 0;
	}

	public static void setAttribute(Object key, Object value) {
		SecurityUtils.getSubject().getSession().setAttribute(key, value);
	}

	public static Object getAttribute(Object key) {
		return SecurityUtils.getSubject().getSession().getAttribute(key);
	}
	
	public static Model putAllIntoModel(Model model){
//		model.addAttribute("navigationTree", getMenuRoot().getChildren());
		return model;
	}

	public static TreeNode getMenuRoot() {
		SysUser user = getCurrentSysUser();
		Utility.println("user=" + user);
		if (user != null && user.getMustChangePassword() == false && sysResourceService != null) {
			try {
				TreeNode root = sysResourceService.getMenuRoot(user.getId());
				if (root != null && root.getChildren() != null)
					return root;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		TreeNode root = new TreeNode();
		root.setChildren(new ArrayList<TreeNode>());
		return root;
	}
	
	public static String getLastUrl(String refUrl){
		return getAttribute(CURRENT_LAST_URL) + Utility.EMPTY;
	}
	
	public static void setLastUrl(String str){
		setAttribute(CURRENT_LAST_URL, str);
	}

}
