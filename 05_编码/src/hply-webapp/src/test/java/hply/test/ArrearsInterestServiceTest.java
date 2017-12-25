package hply.test;

import java.util.List;
import hply.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import hply.service.ArrearsInterestService;
import hply.domain.ArrearsInterest;

public class ArrearsInterestServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private ArrearsInterestService service;
    
    @Test
    public void insertTest() {
        ArrearsInterest obj = this.getRandomDomain();
        service.insert(obj);
        System.out.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        ArrearsInterest obj0 = this.getRandomDomain();
        service.insert(obj0);
        System.out.println("已插入：" + obj0);
        
		ArrearsInterest obj1 = service.get(obj0.getId());
        //获取到的obj对象
        System.out.println("已获取：" + obj1);
        
        service.update(obj1);
		ArrearsInterest obj2 = service.get(obj1.getId());
        System.out.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        ArrearsInterest obj = this.getRandomDomain();
        service.insert(obj);
        System.out.println("已插入：" + obj);
		service.delete(obj.getId());
    }
    
    @Test
    public void getTest() {
		int objectCount = this.getRandomInt();
		for (int i = 0; i < objectCount; i++) {
            service.insert(this.getRandomDomain());
        }
        
        System.out.println("所有：");
		List<ArrearsInterest> list = service.getAll();
		for (ArrearsInterest obj : list) {
			System.out.println(obj);
		}
        
        System.out.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        System.out.println("分页：" + service.getAllPaged(1, 3).size());
    }
    
    
    
    private ArrearsInterest getRandomDomain(){    
		ArrearsInterest obj = new ArrearsInterest();
        obj.setSerialId(this.getRandomInteger());
        obj.setArrearsId(this.getRandomString());
        obj.setProjectId(this.getRandomString());
        obj.setTrice(this.getRandomDate());
        obj.setAmount(this.getRandomDouble());
        obj.setOffsetAmount(this.getRandomDouble());
        obj.setInterestAmount(this.getRandomDouble());
        obj.setDescription(this.getRandomString());
        
        return obj;
    }

}

