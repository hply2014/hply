package com.hhwy.fresource2.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.hhwy.fresource2.BaseJUnit4TestCase;
import com.hhwy.fresource2.domain.SysUserRoles;
import com.hhwy.fresource2.service.SysUserRolesService;

public class SysUserRolesServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysUserRolesService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			SysUserRoles sysUserRoles = new SysUserRoles();



			sysUserRoles.setUserId(this.getRandomString());


			sysUserRoles.setRoleId(this.getRandomString());        
            sysUserRoles.setCreateTime(this.getRandomDate()); 


			sysUserRoles.setCreateUser(this.getRandomString());

			service.insert(sysUserRoles);

			if (this.getRandomBoolean()) {
				SysUserRoles obj = service.get(sysUserRoles.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + sysUserRoles.getId());
				service.delete(sysUserRoles.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<SysUserRoles> list = service.getAll();
		for (SysUserRoles obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

