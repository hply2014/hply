package org.hhwy.fweb1.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.hhwy.fweb1.service.ContractChangeService;
import org.hhwy.fweb1.domain.ContractChange;

public class ContractChangeServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private ContractChangeService service;

	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			ContractChange contractChange = new ContractChange();

			contractChange.setProjectId(this.getRandomString());

			contractChange.setCsaCode(this.getRandomString());

			contractChange.setManagementRate(this.getRandomDouble());

			contractChange.setChangeAmount(this.getRandomDouble());
			contractChange.setTrice(this.getRandomDate());
			contractChange.setCreateTime(this.getRandomDate());

			contractChange.setCreateUser(this.getRandomString());
			contractChange.setUpdateTime(this.getRandomDate());

			contractChange.setUpdateUser(this.getRandomString());

			contractChange.setDescription(this.getRandomString());

			service.insert(contractChange);

			if (this.getRandomBoolean()) {
				ContractChange obj = service.get(contractChange.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + contractChange.getId());
				service.delete(contractChange.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount
				+ ", 删除：" + deleteCount + "\n");

		List<ContractChange> list = service.getAll();
		for (ContractChange obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}
