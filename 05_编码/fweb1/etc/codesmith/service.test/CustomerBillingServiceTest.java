package hply.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import hply.service.CustomerBillingService;
import hply.domain.CustomerBilling;

public class CustomerBillingServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private CustomerBillingService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			CustomerBilling customerBilling = new CustomerBilling();



			customerBilling.setProjectId(this.getRandomString());


			customerBilling.setInvoiceCode(this.getRandomString());


			customerBilling.setInvoiceType(this.getRandomString());

            customerBilling.setAmount(this.getRandomDouble());         
            customerBilling.setTrice(this.getRandomDate());         
            customerBilling.setCreateTime(this.getRandomDate()); 


			customerBilling.setCreateUser(this.getRandomString());        
            customerBilling.setUpdateTime(this.getRandomDate()); 


			customerBilling.setUpdateUser(this.getRandomString());


			customerBilling.setDescription(this.getRandomString());

			service.insert(customerBilling);

			if (this.getRandomBoolean()) {
				CustomerBilling obj = service.get(customerBilling.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + customerBilling.getId());
				service.delete(customerBilling.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<CustomerBilling> list = service.getAll();
		for (CustomerBilling obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

