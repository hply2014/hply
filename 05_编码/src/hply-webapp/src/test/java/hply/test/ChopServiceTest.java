package hply.test;

import hply.BaseJUnit4TestCase;
import hply.domain.Chop;
import hply.service.ChopService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ChopServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private ChopService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			Chop chop = new Chop();



			chop.setChopCode(this.getRandomString());


			chop.setProjectId(this.getRandomString());


			chop.setProjectCode(this.getRandomString());


			chop.setProjectName(this.getRandomString());


			chop.setManager(this.getRandomString());


			chop.setContent(this.getRandomString());


			chop.setApplyUser(this.getRandomString());        
            chop.setApplyTime(this.getRandomDate()); 


			chop.setOrganizationId(this.getRandomString());


			chop.setStep1Idea(this.getRandomString());


			chop.setStep1User(this.getRandomString());        
            chop.setStep1Time(this.getRandomDate()); 


			chop.setStep2Idea(this.getRandomString());


			chop.setStep2User(this.getRandomString());        
            chop.setStep2Time(this.getRandomDate()); 


			chop.setStep3Idea(this.getRandomString());


			chop.setStep3User(this.getRandomString());        
            chop.setStep3Time(this.getRandomDate()); 


			chop.setStepStatus(this.getRandomString());

			service.insert(chop);

			if (this.getRandomBoolean()) {
				Chop obj = service.get(chop.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + chop.getId());
				service.delete(chop.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<Chop> list = service.getAll();
		for (Chop obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

