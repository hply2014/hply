package org.hhwy.fweb1.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.hhwy.fweb1.service.PartyBillingService;
import org.hhwy.fweb1.domain.PartyBilling;

public class PartyBillingServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private PartyBillingService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			PartyBilling partyBilling = new PartyBilling();



			partyBilling.setProjectId(this.getRandomString());


			partyBilling.setInvoiceCode(this.getRandomString());

            partyBilling.setAmount(this.getRandomDouble());         
            partyBilling.setTrice(this.getRandomDate()); 

            partyBilling.setTaxRate(this.getRandomDouble()); 

            partyBilling.setTaxAmount(this.getRandomDouble()); 


			partyBilling.setStep1Idea(this.getRandomString());


			partyBilling.setStep1User(this.getRandomString());        
            partyBilling.setStep1Time(this.getRandomDate()); 


			partyBilling.setStepStatus(this.getRandomString());        
            partyBilling.setCreateTime(this.getRandomDate()); 


			partyBilling.setCreateUser(this.getRandomString());        
            partyBilling.setUpdateTime(this.getRandomDate()); 


			partyBilling.setUpdateUser(this.getRandomString());


			partyBilling.setDescription(this.getRandomString());

			service.insert(partyBilling);

			if (this.getRandomBoolean()) {
				service.update(partyBilling);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + partyBilling.getId());
				service.delete(partyBilling.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<PartyBilling> list = service.getAll();
		for (PartyBilling obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

