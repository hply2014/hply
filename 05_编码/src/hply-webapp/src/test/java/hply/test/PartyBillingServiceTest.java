package hply.test;

import hply.BaseJUnit4TestCase;
import hply.core.Utility;
import hply.domain.PartyBilling;
import hply.service.PartyBillingService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class PartyBillingServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private PartyBillingService service;
    
    @Test
    public void insertTest() {
        PartyBilling obj = this.getRandomDomain();
        service.insert(obj);
        Utility.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        PartyBilling obj0 = this.getRandomDomain();
        service.insert(obj0);
        Utility.println("已插入：" + obj0);
        
		PartyBilling obj1 = service.get(obj0.getId());
        //获取到的obj对象
        Utility.println("已获取：" + obj1);
        
        service.update(obj1);
		PartyBilling obj2 = service.get(obj1.getId());
        Utility.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        PartyBilling obj = this.getRandomDomain();
        service.insert(obj);
        Utility.println("已插入：" + obj);
		service.delete(obj.getId());
    }
    
    @Test
    public void getTest() {
		int objectCount = this.getRandomInt();
		for (int i = 0; i < objectCount; i++) {
            service.insert(this.getRandomDomain());
        }
        
        Utility.println("所有：");
		List<PartyBilling> list = service.getAll();
		for (PartyBilling obj : list) {
			Utility.println(obj);
		}
        
        Utility.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        Utility.println("分页：" + service.getAllPaged(1, 3).size());
    }
    
    
    
    private PartyBilling getRandomDomain(){    
		PartyBilling obj = new PartyBilling();
        obj.setProjectId(this.getRandomString());
        obj.setInvoiceCode(this.getRandomString());
        obj.setAmount(this.getRandomDouble());
        obj.setTrice(this.getRandomDate());
        obj.setTaxRate(this.getRandomDouble());
        obj.setTaxAmount(this.getRandomDouble());
        obj.setStep1Idea(this.getRandomString());
        obj.setStep1User(this.getRandomString());
        obj.setStep1Time(this.getRandomDate());
        obj.setStepStatus(this.getRandomString());
        obj.setCreateUser(this.getRandomString());
        obj.setUpdateUser(this.getRandomString());
        obj.setDescription(this.getRandomString());
        
        return obj;
    }

}

