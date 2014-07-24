package hply.test;

import hply.BaseJUnit4TestCase;
import hply.domain.Collections;
import hply.service.CollectionsService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class CollectionsServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private CollectionsService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			Collections collections = new Collections();



			collections.setProjectId(this.getRandomString());


			collections.setTicketCode(this.getRandomString());


			collections.setSourceOf(this.getRandomString());


			collections.setPaymentType(this.getRandomString());

            collections.setAmount(this.getRandomDouble()); 


			collections.setBankAccount(this.getRandomString());


			collections.setBankName(this.getRandomString());        
            collections.setTrice(this.getRandomDate());         
            collections.setCreateTime(this.getRandomDate()); 


			collections.setCreateUser(this.getRandomString());        
            collections.setUpdateTime(this.getRandomDate()); 


			collections.setUpdateUser(this.getRandomString());


			collections.setDescription(this.getRandomString());

			service.insert(collections);

			if (this.getRandomBoolean()) {
				Collections obj = service.get(collections.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + collections.getId());
				service.delete(collections.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<Collections> list = service.getAll();
		for (Collections obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

