package hply.webapp;

import hply.service.SysUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.Test;

@ContextConfiguration(locations = { "classpath:**/applicationContext.xml" })
public class T3ServiceTest extends AbstractTestNGSpringContextTests {
	
	@Autowired
	private SysUserService sysUserService;

	@Test
	public void hasMatchUser() {
		System.out.println("sysUserService.getAll().size()="
				+ sysUserService.getAll().size());
	}
}
