package hply.web;

import hply.core.Utility;
import hply.domain.SysUser;
import hply.service.SysUserService;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BaseController {

	@Autowired
	private static SysUserService service;

	public static final String CURRENT_SYS_USER = "__CURRENT_SYS_USER";
	public static final String CURRENT_LOGIN_TIME = "__CURRENT_LOGIN_TIME";

	public static void login(String loginName, String password) {
		Subject currentUser = SecurityUtils.getSubject();
		SysUser user = service.getByLoginName(loginName);
		if (user == null) {
			throw new AccountException("登陆用户不存在");
		}
		getSession().setAttribute(CURRENT_SYS_USER, user);
		getSession().setAttribute(CURRENT_LOGIN_TIME, new Date());
		UsernamePasswordToken token = new UsernamePasswordToken(loginName,
				password);
		// ”Remember Me” built-in, just do this:
		token.setRememberMe(false);

		currentUser.login(token);
	}

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

	public static String getCurrentRealName() {
		SysUser user = getCurrentSysUser();
		return user != null ? user.getRealName() : Utility.EMPTY;
	}

	public static String getLoginTime() {
		Object obj = (Date) getSession().getAttribute(CURRENT_LOGIN_TIME);
		if (obj instanceof Date) {
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			return formatter.format((Date) obj);
		}

		return Utility.EMPTY;
	}
}
