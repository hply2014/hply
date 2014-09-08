package hply.test;

import hply.BaseJUnit4TestCase;
import hply.core.Utility;
import hply.domain.ProjectSummary;
import hply.service.ProjectSummaryService;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ProjectSummaryServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private ProjectSummaryService service;
    
    @Test
    public void insertTest() {
        ProjectSummary obj = this.getRandomDomain();
        service.insert(obj);
        Utility.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        ProjectSummary obj0 = this.getRandomDomain();
        service.insert(obj0);
        Utility.println("已插入：" + obj0);
        
		ProjectSummary obj1 = service.get(obj0.getId());
        //获取到的obj对象
        Utility.println("已获取：" + obj1);
        
        service.update(obj1);
		ProjectSummary obj2 = service.get(obj1.getId());
        Utility.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        ProjectSummary obj = this.getRandomDomain();
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
		List<ProjectSummary> list = service.getAll();
		for (ProjectSummary obj : list) {
			Utility.println(obj);
		}
        
        Utility.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        Utility.println("分页：" + service.getAllPaged(1, 3).size());
    }
    
    
    
    private ProjectSummary getRandomDomain(){    
		ProjectSummary obj = new ProjectSummary();
        obj.setSerialId(this.getRandomInteger());
        obj.setTrice(this.getRandomDate());
        obj.setDescription(this.getRandomString());
        obj.setProjectId(this.getRandomString());
        obj.setOrganizationId(this.getRandomString());
        obj.setProjectCode(this.getRandomString());
        obj.setProjectName(this.getRandomString());
        obj.setContractAmount(this.getRandomDouble());
        obj.setChangeAmount(this.getRandomDouble());
        obj.setChangeTotalAmount(this.getRandomDouble());
        obj.setSettlementAmount(this.getRandomDouble());
        obj.setManagementRate(this.getRandomDouble());
        obj.setManagementPlanAmount(this.getRandomDouble());
        obj.setManagementRealAmount(this.getRandomDouble());
        obj.setManagementTotalAmount(this.getRandomDouble());
        obj.setManagementOweAmount(this.getRandomDouble());
        obj.setPartyBillingAmount(this.getRandomDouble());
        obj.setPartyBillingTotalAmount(this.getRandomDouble());
        obj.setCollectionsAmount(this.getRandomDouble());
        obj.setCollectionsTotalAmount(this.getRandomDouble());
        obj.setCollectionsRate(this.getRandomDouble());
        obj.setCustomerBillingAmount(this.getRandomDouble());
        obj.setCustomerBillingTotalAmount(this.getRandomDouble());
        obj.setPaymentAmount(this.getRandomDouble());
        obj.setPaymentTotalAmount(this.getRandomDouble());
        obj.setTaxRate(this.getRandomDouble());
        obj.setTaxPlanAmount(this.getRandomDouble());
        obj.setTaxRealAmount(this.getRandomDouble());
        obj.setTaxTotalAmount(this.getRandomDouble());
        obj.setTaxOweAmount(this.getRandomDouble());
        obj.setArrearsAmount(this.getRandomDouble());
        obj.setExpectedValue(this.getRandomDouble());
        obj.setProfilePoint(this.getRandomString());
        obj.setTableName(this.getRandomString());
        
        return obj;
    }

}

