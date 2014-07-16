package hply.webapp;

import hply.domain.NewTable;
import hply.service.NewTableService;

import java.util.Calendar;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "file:src/main/resources/applicationContext.xml" })
public class NewTableServiceTest extends
		AbstractTransactionalJUnit4SpringContextTests {

	@Autowired
	private NewTableService newTableService;

	@Test
	public void insertTest() {

		NewTable newTable = new NewTable();
		newTable.setId("THIS IS TEST中文文字");
		newTable.setT2(21);
		newTable.setT3(Calendar.getInstance().getTime());
		newTable.setT4(21.35);
		newTableService.insert(newTable);
		
		NewTable nt1 = newTableService.get(newTable.getId());
		nt1.setT1("再更新一次");
		
		
		
	}

}
