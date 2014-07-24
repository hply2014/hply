package hply.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import hply.service.PaymentItemService;
import hply.domain.PaymentItem;

public class PaymentItemServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private PaymentItemService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			PaymentItem paymentItem = new PaymentItem();



			paymentItem.setItemName(this.getRandomString());

            paymentItem.setReimbursementCap(this.getRandomDouble());         
            paymentItem.setCreateTime(this.getRandomDate()); 


			paymentItem.setCreateUser(this.getRandomString());        
            paymentItem.setUpdateTime(this.getRandomDate()); 


			paymentItem.setUpdateUser(this.getRandomString());


			paymentItem.setDescription(this.getRandomString());

			service.insert(paymentItem);

			if (this.getRandomBoolean()) {
				PaymentItem obj = service.get(paymentItem.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + paymentItem.getId());
				service.delete(paymentItem.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<PaymentItem> list = service.getAll();
		for (PaymentItem obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

