package com.hhwy.fresource2.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.hhwy.fresource2.BaseJUnit4TestCase;
import com.hhwy.fresource2.domain.FieldTypes;
import com.hhwy.fresource2.service.FieldTypesService;

public class FieldTypesServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private FieldTypesService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			FieldTypes fieldTypes = new FieldTypes();



			fieldTypes.setFieldT01(this.getRandomString());

            fieldTypes.setFieldT02(this.getRandomDouble());         
            fieldTypes.setFieldT03(this.getRandomDate()); 

            fieldTypes.setFieldT04(this.getRandomDouble()); 


			fieldTypes.setFieldT05(this.getRandomBoolean());        
            fieldTypes.setFieldT06(this.getRandomDate()); 

            fieldTypes.setFieldT07(this.getRandomDouble()); 


			fieldTypes.setFieldT08(this.getRandomInt());

			service.insert(fieldTypes);

			if (this.getRandomBoolean()) {
				FieldTypes obj = service.get(fieldTypes.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + fieldTypes.getId());
				service.delete(fieldTypes.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<FieldTypes> list = service.getAll();
		for (FieldTypes obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

