package hply.test;

import hply.BaseJUnit4TestCase;
import hply.core.Utility;
import hply.domain.SysResource;
import hply.service.SysResourceService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class SysResourceServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysResourceService service;
    
    @Test
    public void insertTest() {
        SysResource obj = this.getRandomDomain();
        service.insert(obj);
        Utility.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        SysResource obj0 = this.getRandomDomain();
        service.insert(obj0);
        Utility.println("已插入：" + obj0);
        
		SysResource obj1 = service.get(obj0.getId());
        //获取到的obj对象
        Utility.println("已获取：" + obj1);
        
        service.update(obj1);
		SysResource obj2 = service.get(obj1.getId());
        Utility.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        SysResource obj = this.getRandomDomain();
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
		List<SysResource> list = service.getAll();
		for (SysResource obj : list) {
			Utility.println(obj);
		}
        
        Utility.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        Utility.println("分页：" + service.getAllPaged(1, 3).size());
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

