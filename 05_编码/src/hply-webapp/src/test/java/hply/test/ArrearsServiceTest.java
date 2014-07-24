package hply.test;

import hply.BaseJUnit4TestCase;
import hply.domain.Arrears;
import hply.service.ArrearsService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ArrearsServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private ArrearsService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			Arrears arrears = new Arrears();



			arrears.setProjectId(this.getRandomString());


			arrears.setFundsUsing(this.getRandomString());


			arrears.setArrearsType(this.getRandomString());


			arrears.setPayType(this.getRandomString());

            arrears.setAmount(this.getRandomDouble()); 

            arrears.setInterestAmount(this.getRandomDouble()); 

            arrears.setInterestRate(this.getRandomDouble()); 


			arrears.setBankAccount(this.getRandomString());


			arrears.setBankName(this.getRandomString());        
            arrears.setTrice(this.getRandomDate());         
            arrears.setCreateTime(this.getRandomDate()); 


			arrears.setCreateUser(this.getRandomString());        
            arrears.setUpdateTime(this.getRandomDate()); 


			arrears.setUpdateUser(this.getRandomString());


			arrears.setDescription(this.getRandomString());

			service.insert(arrears);

			if (this.getRandomBoolean()) {
				Arrears obj = service.get(arrears.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + arrears.getId());
				service.delete(arrears.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<Arrears> list = service.getAll();
		for (Arrears obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

