package org.hhwy.fweb1.core;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.hhwy.fweb1.domain.SysUser;
import org.hhwy.fweb1.domain.TreeNode;

public class SessionHelper {

	public static final String CURRENT_SYS_USER = "__CURRENT_SYS_USER";
	public static final String CURRENT_LOGIN_TIME = "__CURRENT_LOGIN_TIME";
	public static final String CURRENT_ROOT_TREE_NODE = "__CURRENT_PERMISSION";

	public static void login(String loginName, String password) {
		Subject currentUser = SecurityUtils.getSubject();
		setAttribute(CURRENT_LOGIN_TIME, new Date());
		UsernamePasswordToken token = new UsernamePasswordToken(loginName,
				password);
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

	public static String getCurrentRealName() {
		SysUser user = getCurrentSysUser();
		return user != null ? user.getRealName() : Utility.EMPTY;
	}

	public static String getLoginTime() {
		Object obj = (Date) getAttribute(CURRENT_LOGIN_TIME);
		if (obj instanceof Date) {
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			return formatter.format((Date) obj);
		}

		return Utility.EMPTY;
	}

	public static void setAttribute(Object key, Object value) {
		SecurityUtils.getSubject().getSession().setAttribute(key, value);
	}

	public static Object getAttribute(Object key) {
		return SecurityUtils.getSubject().getSession().getAttribute(key);
	}

	public static TreeNode getMenuRoot() {
		try {
			TreeNode root = (TreeNode) getAttribute(CURRENT_ROOT_TREE_NODE);
			if (root != null && root.getChildren() != null)
				return root;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		TreeNode root = new TreeNode();
		root.setChildren(new ArrayList<TreeNode>());
		return root;
	}

	public static String getCurrentUserId() {
		return getCurrentSysUser().getId();
	}

}
