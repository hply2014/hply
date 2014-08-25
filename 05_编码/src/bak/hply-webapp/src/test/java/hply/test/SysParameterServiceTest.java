package hply.test;

import java.util.List;
import hply.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import hply.service.SysParameterService;
import hply.domain.SysParameter;

public class SysParameterServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysParameterService service;
    
    @Test
    public void insertTest() {
        SysParameter obj = this.getRandomDomain();
        service.insert(obj);
        System.out.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        SysParameter obj0 = this.getRandomDomain();
        service.insert(obj0);
        System.out.println("已插入：" + obj0);
        
		SysParameter obj1 = service.get(obj0.getId());
        //获取到的obj对象
        System.out.println("已获取：" + obj1);
        
        service.update(obj1);
		SysParameter obj2 = service.get(obj1.getId());
        System.out.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        SysParameter obj = this.getRandomDomain();
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
		List<SysParameter> list = service.getAll();
		for (SysParameter obj : list) {
			System.out.println(obj);
		}
        
        System.out.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        System.out.println("分页：" + service.getAllPaged(1, 3).size());
    }
    
    
    
    private SysParameter getRandomDomain(){    
		SysParameter obj = new SysParameter();
        obj.setEnName(this.getRandomString());
        obj.setCnName(this.getRandomString());
        obj.setParamValue(this.getRandomString());
        obj.setDefaultValue(this.getRandomString());
        obj.setIsInner(this.getRandomBoolean());
        obj.setCreateUser(this.getRandomString());
        obj.setUpdateUser(this.getRandomString());
        obj.setDescription(this.getRandomString());
        
        return obj;
    }

}

