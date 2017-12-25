package hply.test;

import hply.BaseJUnit4TestCase;
import hply.core.Utility;
import hply.domain.Project;
import hply.service.ProjectService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ProjectServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private ProjectService service;
    
    @Test
    public void insertTest() {
        Project obj = this.getRandomDomain();
        service.insert(obj);
        Utility.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        Project obj0 = this.getRandomDomain();
        service.insert(obj0);
        Utility.println("已插入：" + obj0);
        
		Project obj1 = service.get(obj0.getId());
        //获取到的obj对象
        Utility.println("已获取：" + obj1);
        
        service.update(obj1);
		Project obj2 = service.get(obj1.getId());
        Utility.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        Project obj = this.getRandomDomain();
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
		List<Project> list = service.getAll();
		for (Project obj : list) {
			Utility.println(obj);
		}
        
        Utility.println("总行数：" + service.getRowCount("%"));
        
        service.getAllPaged("%", 1, 3);
        Utility.println("分页：" + service.getAllPaged("%", 1, 3).size());
    }
    
    
    
    private Project getRandomDomain(){    
		Project obj = new Project();
        obj.setProjectCode(this.getRandomString());
        obj.setProjectName(this.getRandomString());
        obj.setOrganizationId(this.getRandomString());
        obj.setPartyName(this.getRandomString());
        obj.setPartyAddress(this.getRandomString());
        obj.setManager(this.getRandomString());
        obj.setContractCode(this.getRandomString());
        obj.setCorperation(this.getRandomString());
        obj.setLegalAssignee(this.getRandomString());
        obj.setIsWithholdingOffsite(this.getRandomInteger());
        obj.setManagementRate(this.getRandomDouble());
        obj.setTaxRate(this.getRandomDouble());
        obj.setContractAmount(this.getRandomDouble());
        obj.setSettlementAmount(this.getRandomDouble());
        obj.setDutyPaidTime(this.getRandomDate());
        obj.setDutyPaidAmount(this.getRandomDouble());
        obj.setDutyPaidCode(this.getRandomString());
        obj.setCapitalOccupied(this.getRandomDouble());
        obj.setProjectStatus(this.getRandomString());
        obj.setTrice(this.getRandomDate());
        obj.setCreateUser(this.getRandomString());
        obj.setUpdateUser(this.getRandomString());
        obj.setDescription(this.getRandomString());
        obj.setManagementPlanAmount(this.getRandomDouble());
        obj.setTaxPlanAmount(this.getRandomDouble());
        
        return obj;
    }

}

