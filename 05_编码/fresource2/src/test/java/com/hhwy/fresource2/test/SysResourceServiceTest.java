package com.hhwy.fresource2.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.hhwy.fresource2.BaseJUnit4TestCase;
import com.hhwy.fresource2.domain.SysResource;
import com.hhwy.fresource2.service.SysResourceService;

public class SysResourceServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysResourceService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			SysResource sysResource = new SysResource();



			sysResource.setResourceCode(this.getRandomString());


			sysResource.setResourceName(this.getRandomString());


			sysResource.setIcon(this.getRandomString());


			sysResource.setResourceUri(this.getRandomString());


			sysResource.setResourceType(this.getRandomString());


			sysResource.setParentId(this.getRandomString());


			sysResource.setOrderId(this.getRandomInt());


			sysResource.setAccessUris(this.getRandomString());


			sysResource.setNoAccessUris(this.getRandomString());


			sysResource.setEnabled(this.getRandomBoolean());


			sysResource.setExt01(this.getRandomString());


			sysResource.setExt02(this.getRandomString());


			sysResource.setExt03(this.getRandomString());


			sysResource.setExt04(this.getRandomString());


			sysResource.setDescription(this.getRandomString());

			service.insert(sysResource);

			if (this.getRandomBoolean()) {
				SysResource obj = service.get(sysResource.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + sysResource.getId());
				service.delete(sysResource.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<SysResource> list = service.getAll();
		for (SysResource obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

