package hply.test;

import hply.BaseJUnit4TestCase;
import hply.domain.SysResource;
import hply.service.SysResourceService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

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



			sysResource.setResCode(this.getRandomString());


			sysResource.setResName(this.getRandomString());


			sysResource.setIcon(this.getRandomString());


			sysResource.setResUrl(this.getRandomString());


			sysResource.setResType(this.getRandomString());
            sysResource.setOrderBy(this.getRandomInt()); 


			sysResource.setParentId(this.getRandomString());
            sysResource.setEnabled(this.getRandomInt()); 


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

