package hply.webapp;

import hply.service.T3Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.Test;

@ContextConfiguration(locations = { "classpath:**/applicationContext.xml" })
public class T3ServiceTest extends AbstractTestNGSpringContextTests {
	
	@Autowired
	private T3Service t3Service;

	@Test
	public void hasMatchUser() {
		boolean b = t3Service.hasMatchUser();
		Assert.assertEquals(true, b);
	}
}
