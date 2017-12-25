package hply.test;

import hply.BaseJUnit4TestCase;
import hply.core.Utility;
import hply.domain.ContractChange;
import hply.service.ContractChangeService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ContractChangeServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private ContractChangeService service;
    
    @Test
    public void insertTest() {
        ContractChange obj = this.getRandomDomain();
        service.insert(obj);
        Utility.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        ContractChange obj0 = this.getRandomDomain();
        service.insert(obj0);
        Utility.println("已插入：" + obj0);
        
		ContractChange obj1 = service.get(obj0.getId());
        //获取到的obj对象
        Utility.println("已获取：" + obj1);
        
        service.update(obj1);
		ContractChange obj2 = service.get(obj1.getId());
        Utility.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        ContractChange obj = this.getRandomDomain();
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
		List<ContractChange> list = service.getAll();
		for (ContractChange obj : list) {
			Utility.println(obj);
		}
        
        Utility.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        Utility.println("分页：" + service.getAllPaged(1, 3).size());
    }
    
    
    
    private ContractChange getRandomDomain(){    
		ContractChange obj = new ContractChange();
        obj.setProjectId(this.getRandomString());
        obj.setCsaCode(this.getRandomString());
        obj.setManagementRate(this.getRandomDouble());
        obj.setChangeAmount(this.getRandomDouble());
        obj.setTrice(this.getRandomDate());
        obj.setCreateUser(this.getRandomString());
        obj.setUpdateUser(this.getRandomString());
        obj.setDescription(this.getRandomString());
        
        return obj;
    }

}

