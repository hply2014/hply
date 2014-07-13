package hply.webapp;

import org.apache.commons.lang3.StringUtils;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.Test;

@ContextConfiguration(locations = { "classpath:**/applicationContext.xml" })
public class T3ServiceTest extends AbstractTestNGSpringContextTests {
	
//	@Autowired
//	private SysUserService sysUserService;

	@Test
	public void hasMatchUser() {
//		System.out.println("sysUserService.getAll().size()="
//				+ sysUserService.getAll().size());
		
		String s1 = null;
		System.out.println("s1=" + StringUtils.trimToEmpty(s1));
	}
}
