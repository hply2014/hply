package com.hhwy.fresource2.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.hhwy.fresource2.BaseJUnit4TestCase;
import com.hhwy.fresource2.domain.SysUser;
import com.hhwy.fresource2.service.SysUserService;

public class SysUserServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysUserService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			SysUser sysUser = new SysUser();



			sysUser.setLoginName(this.getRandomString());


			sysUser.setPassword(this.getRandomString());


			sysUser.setRealName(this.getRandomString());


			sysUser.setOrganizationName(this.getRandomString());


			sysUser.setJobs(this.getRandomString());


			sysUser.setLastLoginIp(this.getRandomString());        
            sysUser.setLastLoginTime(this.getRandomDate()); 


			sysUser.setFails(this.getRandomInt());


			sysUser.setLogined(this.getRandomInt());


			sysUser.setMustChangePassword(this.getRandomBoolean());


			sysUser.setEnabled(this.getRandomBoolean());        
            sysUser.setCreateTime(this.getRandomDate()); 


			sysUser.setCreateUser(this.getRandomString());        
            sysUser.setUpdateTime(this.getRandomDate()); 


			sysUser.setUpdateUser(this.getRandomString());


			sysUser.setDescription(this.getRandomString());

			service.insert(sysUser);

			if (this.getRandomBoolean()) {
				SysUser obj = service.get(sysUser.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + sysUser.getId());
				service.delete(sysUser.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<SysUser> list = service.getAll();
		for (SysUser obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

