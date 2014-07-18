package org.hhwy.fweb1.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.hhwy.fweb1.service.SysOrganizationService;
import org.hhwy.fweb1.domain.SysOrganization;

public class SysOrganizationServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private SysOrganizationService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			SysOrganization sysOrganization = new SysOrganization();



			sysOrganization.setOrganizationName(this.getRandomString());        
            sysOrganization.setCreateTime(this.getRandomDate()); 


			sysOrganization.setDescription(this.getRandomString());

			service.insert(sysOrganization);

			if (this.getRandomBoolean()) {
				SysOrganization obj = service.get(sysOrganization.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + sysOrganization.getId());
				service.delete(sysOrganization.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<SysOrganization> list = service.getAll();
		for (SysOrganization obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

