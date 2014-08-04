package org.hhwy.fweb1.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.hhwy.fweb1.service.SysRoleResourceService;
import org.hhwy.fweb1.domain.SysRoleResource;

public class SysRoleResourceServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysRoleResourceService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			SysRoleResource sysRoleResource = new SysRoleResource();



			sysRoleResource.setRoleId(this.getRandomString());


			sysRoleResource.setResourceId(this.getRandomString());        
            sysRoleResource.setCreateTime(this.getRandomDate()); 


			sysRoleResource.setCreateUser(this.getRandomString());

			service.insert(sysRoleResource);

			if (this.getRandomBoolean()) {
				SysRoleResource obj = service.get(sysRoleResource.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + sysRoleResource.getId());
				service.delete(sysRoleResource.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<SysRoleResource> list = service.getAll();
		for (SysRoleResource obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

