package hply.test;

import hply.BaseJUnit4TestCase;
import hply.core.Utility;
import hply.domain.SysOrganization;
import hply.service.SysOrganizationService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class SysOrganizationServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysOrganizationService service;
    
    @Test
    public void insertTest() {
        SysOrganization obj = this.getRandomDomain();
        service.insert(obj);
        Utility.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        SysOrganization obj0 = this.getRandomDomain();
        service.insert(obj0);
        Utility.println("已插入：" + obj0);
        
		SysOrganization obj1 = service.get(obj0.getId());
        //获取到的obj对象
        Utility.println("已获取：" + obj1);
        
        service.update(obj1);
		SysOrganization obj2 = service.get(obj1.getId());
        Utility.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        SysOrganization obj = this.getRandomDomain();
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
		List<SysOrganization> list = service.getAll();
		for (SysOrganization obj : list) {
			Utility.println(obj);
		}
        
        Utility.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        Utility.println("分页：" + service.getAllPaged(1, 3).size());
    }
    
    
    
    private SysOrganization getRandomDomain(){    
		SysOrganization obj = new SysOrganization();
        obj.setOrganizationName(this.getRandomString());
        obj.setDescription(this.getRandomString());
        
        return obj;
    }

}

