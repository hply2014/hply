package org.hhwy.fweb1.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.hhwy.fweb1.service.SysRoleService;
import org.hhwy.fweb1.domain.SysRole;

public class SysRoleServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysRoleService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			SysRole sysRole = new SysRole();



			sysRole.setName(this.getRandomString());


			sysRole.setDescription(this.getRandomString());


			sysRole.setIsDefault(this.getRandomString());

			service.insert(sysRole);

			if (this.getRandomBoolean()) {
				SysRole obj = service.get(sysRole.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + sysRole.getId());
				service.delete(sysRole.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<SysRole> list = service.getAll();
		for (SysRole obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

