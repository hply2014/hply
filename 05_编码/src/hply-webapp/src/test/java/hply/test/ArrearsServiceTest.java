package hply.test;

import hply.BaseJUnit4TestCase;
import hply.core.Utility;
import hply.domain.Arrears;
import hply.service.ArrearsService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ArrearsServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private ArrearsService service;
    
    @Test
    public void insertTest() {
        Arrears obj = this.getRandomDomain();
        service.insert(obj);
        Utility.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        Arrears obj0 = this.getRandomDomain();
        service.insert(obj0);
        Utility.println("已插入：" + obj0);
        
		Arrears obj1 = service.get(obj0.getId());
        //获取到的obj对象
        Utility.println("已获取：" + obj1);
        
        service.update(obj1);
		Arrears obj2 = service.get(obj1.getId());
        Utility.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        Arrears obj = this.getRandomDomain();
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
		List<Arrears> list = service.getAll();
		for (Arrears obj : list) {
			Utility.println(obj);
		}
        
        Utility.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        Utility.println("分页：" + service.getAllPaged(1, 3).size());
    }
    
    
    
    private Arrears getRandomDomain(){    
		Arrears obj = new Arrears();
        obj.setSerialId(this.getRandomInteger());
        obj.setArrearsCode(this.getRandomString());
        obj.setProjectId(this.getRandomString());
        obj.setFundsUsing(this.getRandomString());
        obj.setArrearsType(this.getRandomString());
        obj.setPayType(this.getRandomString());
        obj.setAmount(this.getRandomDouble());
        obj.setOffsetAmount(this.getRandomDouble());
        obj.setInterestAmount(this.getRandomDouble());
        obj.setInterestRate(this.getRandomDouble());
        obj.setBankAccount(this.getRandomString());
        obj.setBankName(this.getRandomString());
        obj.setTrice(this.getRandomDate());
        obj.setCreateUser(this.getRandomString());
        obj.setUpdateUser(this.getRandomString());
        obj.setDescription(this.getRandomString());
        
        return obj;
    }

}

