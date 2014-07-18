package org.hhwy.fweb1.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.hhwy.fweb1.service.SysAuthorizationService;
import org.hhwy.fweb1.domain.SysAuthorization;

public class SysAuthorizationServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private SysAuthorizationService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			SysAuthorization sysAuthorization = new SysAuthorization();



			sysAuthorization.setResourceId(this.getRandomString());


			sysAuthorization.setUserId(this.getRandomString());        
            sysAuthorization.setCreateTime(this.getRandomDate()); 


			sysAuthorization.setCreateUser(this.getRandomString());

			service.insert(sysAuthorization);

			if (this.getRandomBoolean()) {
				service.update(sysAuthorization);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + sysAuthorization.getId());
				service.delete(sysAuthorization.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<SysAuthorization> list = service.getAll();
		for (SysAuthorization obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

