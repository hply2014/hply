package hply.test;

import java.util.List;
import hply.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import hply.service.SysAuthorizationService;
import hply.domain.SysAuthorization;

public class SysAuthorizationServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysAuthorizationService service;
    
    @Test
    public void insertTest() {
        SysAuthorization obj = this.getRandomDomain();
        service.insert(obj);
        System.out.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        SysAuthorization obj0 = this.getRandomDomain();
        service.insert(obj0);
        System.out.println("已插入：" + obj0);
        
		SysAuthorization obj1 = service.get(obj0.getId());
        //获取到的obj对象
        System.out.println("已获取：" + obj1);
        
        service.update(obj1);
		SysAuthorization obj2 = service.get(obj1.getId());
        System.out.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        SysAuthorization obj = this.getRandomDomain();
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
		List<SysAuthorization> list = service.getAll();
		for (SysAuthorization obj : list) {
			System.out.println(obj);
		}
        
        System.out.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        System.out.println("分页：" + service.getAllPaged(1, 3).size());
    }
    
    
    
    private SysAuthorization getRandomDomain(){    
		SysAuthorization obj = new SysAuthorization();
        obj.setResourceId(this.getRandomString());
        obj.setUserId(this.getRandomString());
        obj.setCreateUser(this.getRandomString());
        
        return obj;
    }

}

