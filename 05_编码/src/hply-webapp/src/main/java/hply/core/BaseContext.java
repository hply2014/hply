package hply.core;

import hply.domain.SysUser;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

public class BaseContext {

	public static final String CURRENT_SYS_USER = "__CURRENT_SYS_USER";

	public static Subject getCurrentUser() {
		return SecurityUtils.getSubject();
	}

	public static Session getSession() {
		return SecurityUtils.getSubject().getSession();
	}

	public static SysUser getCurrentSysUser() {
		Object obj = getSession().getAttribute(CURRENT_SYS_USER);
		return obj instanceof SysUser ? (SysUser) obj : null;
	}
}
