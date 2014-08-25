package hply.test;

import java.util.List;
import hply.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import hply.service.SysResourceService;
import hply.domain.SysResource;

public class SysResourceServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysResourceService service;
    
    @Test
    public void insertTest() {
        SysResource obj = this.getRandomDomain();
        service.insert(obj);
        System.out.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        SysResource obj0 = this.getRandomDomain();
        service.insert(obj0);
        System.out.println("已插入：" + obj0);
        
		SysResource obj1 = service.get(obj0.getId());
        //获取到的obj对象
        System.out.println("已获取：" + obj1);
        
        service.update(obj1);
		SysResource obj2 = service.get(obj1.getId());
        System.out.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        SysResource obj = this.getRandomDomain();
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
		List<SysResource> list = service.getAll();
		for (SysResource obj : list) {
			System.out.println(obj);
		}
        
        System.out.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        System.out.println("分页：" + service.getAllPaged(1, 3).size());
    }
    
    
    
    private SysResource getRandomDomain(){    
		SysResource obj = new SysResource();
        obj.setResCode(this.getRandomString());
        obj.setResName(this.getRandomString());
        obj.setIcon(this.getRandomString());
        obj.setResUrl(this.getRandomString());
        obj.setResType(this.getRandomString());
        obj.setOrderBy(this.getRandomInteger());
        obj.setParentId(this.getRandomString());
        obj.setEnabled(this.getRandomInteger());
        obj.setDescription(this.getRandomString());
        obj.setAllowAccessUri(this.getRandomString());
        
        return obj;
    }

}

