/**
 * 
 */
package hply.core;

import hply.mapper.SysAuthorizationMapper;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Administrator
 *
 */
public class MyAuthenticationFilter extends AuthorizationFilter {

	@Autowired
	private SysAuthorizationMapper sysAuthorizationMapper;

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {

		Subject subject = getSubject(request, response);
		ShiroHttpServletRequest shiroRequest = request instanceof ShiroHttpServletRequest ? (ShiroHttpServletRequest) request : null;
		Utility.println("shiroRequest.getServletPath()=" + shiroRequest.getServletPath());
		if (subject.isAuthenticated() == false) {
			return false;
		}
		
		
		
		return true;
	}

}
