package hply;

import hply.core.Utility;

import java.util.Date;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/test/resources/testApplicationContext.xml" })
public abstract class BaseJUnit4TestCase extends
		AbstractTransactionalJUnit4SpringContextTests {

	private static final int MIN = 2;
	private static final int MAX = 10;

	protected int getRandomInt() {
		return (int) (Math.random() * (MAX - MIN) + MIN);
	}

	protected Boolean getRandomBoolean() {
		return getRandomInt() > MAX / 2;
	}

	protected String getRandomString(){
		return Utility.randomString(5) + ",测试";
	}
	
	protected Date getRandomDate(){
		return new Date((long) (Math.random() * 1E8));
	}

	protected double getRandomDouble(){
		return Math.random() * 1E3;
	}
}