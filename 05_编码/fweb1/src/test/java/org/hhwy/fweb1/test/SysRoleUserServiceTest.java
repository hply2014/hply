package org.hhwy.fweb1.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.hhwy.fweb1.service.SysRoleUserService;
import org.hhwy.fweb1.domain.SysRoleUser;

public class SysRoleUserServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysRoleUserService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			SysRoleUser sysRoleUser = new SysRoleUser();



			sysRoleUser.setRoleId(this.getRandomString());


			sysRoleUser.setUserId(this.getRandomString());        
            sysRoleUser.setCreateTime(this.getRandomDate()); 


			sysRoleUser.setCreateUser(this.getRandomString());

			service.insert(sysRoleUser);

			if (this.getRandomBoolean()) {
				SysRoleUser obj = service.get(sysRoleUser.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + sysRoleUser.getId());
				service.delete(sysRoleUser.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<SysRoleUser> list = service.getAll();
		for (SysRoleUser obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

