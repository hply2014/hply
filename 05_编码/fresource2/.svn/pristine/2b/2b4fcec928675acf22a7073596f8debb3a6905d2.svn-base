package com.hhwy.fresource2.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.hhwy.fresource2.BaseJUnit4TestCase;
import com.hhwy.fresource2.domain.SysParameter;
import com.hhwy.fresource2.service.SysParameterService;

public class SysParameterServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysParameterService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			SysParameter sysParameter = new SysParameter();



			sysParameter.setParamCode(this.getRandomString());


			sysParameter.setParamName(this.getRandomString());


			sysParameter.setParamValue(this.getRandomString());


			sysParameter.setDefaultValue(this.getRandomString());


			sysParameter.setIsInner(this.getRandomBoolean());        
            sysParameter.setCreateTime(this.getRandomDate()); 


			sysParameter.setCreateUser(this.getRandomString());        
            sysParameter.setUpdateTime(this.getRandomDate()); 


			sysParameter.setUpdateUser(this.getRandomString());


			sysParameter.setExt01(this.getRandomString());


			sysParameter.setExt02(this.getRandomString());


			sysParameter.setExt03(this.getRandomString());


			sysParameter.setExt04(this.getRandomString());


			sysParameter.setDescription(this.getRandomString());

			service.insert(sysParameter);

			if (this.getRandomBoolean()) {
				SysParameter obj = service.get(sysParameter.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + sysParameter.getId());
				service.delete(sysParameter.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<SysParameter> list = service.getAll();
		for (SysParameter obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

