package hply.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import hply.service.PaymentService;
import hply.domain.Payment;

public class PaymentServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private PaymentService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			Payment payment = new Payment();



			payment.setProjectId(this.getRandomString());


			payment.setTicketCode(this.getRandomString());


			payment.setPayType(this.getRandomString());


			payment.setPaymentItemId(this.getRandomString());

            payment.setAmount(this.getRandomDouble()); 


			payment.setBankAccount(this.getRandomString());


			payment.setBankName(this.getRandomString());        
            payment.setTrice(this.getRandomDate());         
            payment.setCreateTime(this.getRandomDate()); 


			payment.setCreateUser(this.getRandomString());        
            payment.setUpdateTime(this.getRandomDate()); 


			payment.setUpdateUser(this.getRandomString());


			payment.setDescription(this.getRandomString());

			service.insert(payment);

			if (this.getRandomBoolean()) {
				Payment obj = service.get(payment.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + payment.getId());
				service.delete(payment.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<Payment> list = service.getAll();
		for (Payment obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

