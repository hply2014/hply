package hply.test;

import java.util.List;
import hply.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import hply.service.ChopService;
import hply.domain.Chop;

public class ChopServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private ChopService service;
    
    @Test
    public void insertTest() {
        Chop obj = this.getRandomDomain();
        service.insert(obj);
        System.out.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        Chop obj0 = this.getRandomDomain();
        service.insert(obj0);
        System.out.println("已插入：" + obj0);
        
		Chop obj1 = service.get(obj0.getId());
        //获取到的obj对象
        System.out.println("已获取：" + obj1);
        
        service.update(obj1);
		Chop obj2 = service.get(obj1.getId());
        System.out.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        Chop obj = this.getRandomDomain();
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
		List<Chop> list = service.getAll();
		for (Chop obj : list) {
			System.out.println(obj);
		}
        
        System.out.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        System.out.println("分页：" + service.getAllPaged(1, 3).size());
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

