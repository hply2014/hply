package hply.test;

import hply.BaseJUnit4TestCase;
import hply.core.Utility;
import hply.domain.Chop;
import hply.service.ChopService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ChopServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private ChopService service;
    
    @Test
    public void insertTest() {
        Chop obj = this.getRandomDomain();
        service.insert(obj);
        Utility.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        Chop obj0 = this.getRandomDomain();
        service.insert(obj0);
        Utility.println("已插入：" + obj0);
        
		Chop obj1 = service.get(obj0.getId());
        //获取到的obj对象
        Utility.println("已获取：" + obj1);
        
        service.update(obj1);
		Chop obj2 = service.get(obj1.getId());
        Utility.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        Chop obj = this.getRandomDomain();
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
		List<Chop> list = service.getAll();
		for (Chop obj : list) {
			Utility.println(obj);
		}
        
        Utility.println("总行数：" + service.getRowCount());
        
        service.getAllPaged("", 1, 3);
        Utility.println("分页：" + service.getAllPaged("", 1, 3).size());
    }
    
    
    
    private Chop getRandomDomain(){    
		Chop obj = new Chop();
        obj.setChopCode(this.getRandomString());
        obj.setProjectId(this.getRandomString());
        obj.setProjectCode(this.getRandomString());
        obj.setProjectName(this.getRandomString());
        obj.setManager(this.getRandomString());
        obj.setContent(this.getRandomString());
        obj.setApplyUser(this.getRandomString());
        obj.setApplyTime(this.getRandomDate());
        obj.setOrganizationId(this.getRandomString());
        obj.setStep1Idea(this.getRandomString());
        obj.setStep1User(this.getRandomString());
        obj.setStep1Time(this.getRandomDate());
        obj.setStep2Idea(this.getRandomString());
        obj.setStep2User(this.getRandomString());
        obj.setStep2Time(this.getRandomDate());
        obj.setStep3Idea(this.getRandomString());
        obj.setStep3User(this.getRandomString());
        obj.setStep3Time(this.getRandomDate());
        obj.setStepStatus(this.getRandomString());
        
        return obj;
    }

}

