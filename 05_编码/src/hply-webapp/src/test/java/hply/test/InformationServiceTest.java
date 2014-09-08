package hply.test;

import hply.BaseJUnit4TestCase;
import hply.core.Utility;
import hply.domain.Information;
import hply.service.InformationService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class InformationServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private InformationService service;
    
    @Test
    public void insertTest() {
        Information obj = this.getRandomDomain();
        service.insert(obj);
        Utility.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        Information obj0 = this.getRandomDomain();
        service.insert(obj0);
        Utility.println("已插入：" + obj0);
        
		Information obj1 = service.get(obj0.getId());
        //获取到的obj对象
        Utility.println("已获取：" + obj1);
        
        service.update(obj1);
		Information obj2 = service.get(obj1.getId());
        Utility.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        Information obj = this.getRandomDomain();
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
		List<Information> list = service.getAll();
		for (Information obj : list) {
			Utility.println(obj);
		}
        
        Utility.println("总行数：" + service.getRowCount("%"));
        
        service.getAllPaged("%", 1, 3);
        Utility.println("分页：" + service.getAllPaged("%", 1, 3).size());
    }
    
    
    
    private Information getRandomDomain(){    
		Information obj = new Information();
        obj.setOrganizationId(this.getRandomString());
        obj.setProjectName(this.getRandomString());
        obj.setAddress(this.getRandomString());
        obj.setDeveloper(this.getRandomString());
        obj.setEpcCorporation(this.getRandomString());
        obj.setVariety(this.getRandomString());
        obj.setTotalArea(this.getRandomString());
        obj.setRealName(this.getRandomString());
        obj.setIdentification(this.getRandomString());
        obj.setContact(this.getRandomString());
        obj.setSubscriber(this.getRandomString());
        obj.setTrice(this.getRandomDate());
        obj.setCreateUser(this.getRandomString());
        obj.setUpdateUser(this.getRandomString());
        obj.setDescription(this.getRandomString());
        
        return obj;
    }

}

