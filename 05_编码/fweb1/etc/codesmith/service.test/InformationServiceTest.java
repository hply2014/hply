package org.hhwy.fweb1.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.hhwy.fweb1.service.InformationService;
import org.hhwy.fweb1.domain.Information;

public class InformationServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private InformationService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			Information information = new Information();



			information.setOrganizationId(this.getRandomString());


			information.setProjectName(this.getRandomString());


			information.setAddress(this.getRandomString());


			information.setDeveloper(this.getRandomString());


			information.setEpcCorporation(this.getRandomString());


			information.setVariety(this.getRandomString());


			information.setTotalArea(this.getRandomString());


			information.setRealName(this.getRandomString());


			information.setIdentification(this.getRandomString());


			information.setContact(this.getRandomString());


			information.setSubscriber(this.getRandomString());        
            information.setTrice(this.getRandomDate());         
            information.setCreateTime(this.getRandomDate()); 


			information.setCreateUser(this.getRandomString());        
            information.setUpdateTime(this.getRandomDate()); 


			information.setUpdateUser(this.getRandomString());


			information.setDescription(this.getRandomString());

			service.insert(information);

			if (this.getRandomBoolean()) {
				Information obj = service.get(information.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + information.getId());
				service.delete(information.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<Information> list = service.getAll();
		for (Information obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

