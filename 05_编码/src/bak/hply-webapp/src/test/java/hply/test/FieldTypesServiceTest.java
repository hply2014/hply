package hply.test;

import java.util.List;
import hply.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import hply.service.FieldTypesService;
import hply.domain.FieldTypes;

public class FieldTypesServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private FieldTypesService service;
    
    @Test
    public void insertTest() {
        FieldTypes obj = this.getRandomDomain();
        service.insert(obj);
        System.out.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        FieldTypes obj0 = this.getRandomDomain();
        service.insert(obj0);
        System.out.println("已插入：" + obj0);
        
		FieldTypes obj1 = service.get(obj0.getId());
        //获取到的obj对象
        System.out.println("已获取：" + obj1);
        
        service.update(obj1);
		FieldTypes obj2 = service.get(obj1.getId());
        System.out.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        FieldTypes obj = this.getRandomDomain();
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
		List<FieldTypes> list = service.getAll();
		for (FieldTypes obj : list) {
			System.out.println(obj);
		}
        
        System.out.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        System.out.println("分页：" + service.getAllPaged(1, 3).size());
    }
    
    
    
    private FieldTypes getRandomDomain(){    
		FieldTypes obj = new FieldTypes();
        obj.setFieldT01(this.getRandomString());
        obj.setFieldT02(this.getRandomDouble());
        obj.setFieldT03(this.getRandomString());
        obj.setFieldT04(this.getRandomString());
        obj.setFieldT05(this.getRandomString());
        obj.setFieldT06(this.getRandomDate());
        obj.setFieldT07(this.getRandomString());
        obj.setFieldT08(this.getRandomInteger());
        obj.setFieldT09(this.getRandomInteger());
        
        return obj;
    }

}

