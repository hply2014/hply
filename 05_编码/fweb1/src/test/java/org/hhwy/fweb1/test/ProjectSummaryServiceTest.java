package org.hhwy.fweb1.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.hhwy.fweb1.service.ProjectSummaryService;
import org.hhwy.fweb1.domain.ProjectSummary;

public class ProjectSummaryServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private ProjectSummaryService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			ProjectSummary projectSummary = new ProjectSummary();
        
            projectSummary.setTrice(this.getRandomDate()); 


			projectSummary.setDescription(this.getRandomString());


			projectSummary.setProjectId(this.getRandomString());


			projectSummary.setOrganizationId(this.getRandomString());


			projectSummary.setProjectCode(this.getRandomString());


			projectSummary.setProjectName(this.getRandomString());

            projectSummary.setContractAmount(this.getRandomDouble()); 

            projectSummary.setChangeAmount(this.getRandomDouble()); 

            projectSummary.setSettlementAmount(this.getRandomDouble()); 

            projectSummary.setManagementRate(this.getRandomDouble()); 

            projectSummary.setManagementPlanAmount(this.getRandomDouble()); 

            projectSummary.setManagementRealAmount(this.getRandomDouble()); 

            projectSummary.setManagementTotalAmount(this.getRandomDouble()); 

            projectSummary.setManagementOweAmount(this.getRandomDouble()); 

            projectSummary.setPartyBillingAmount(this.getRandomDouble()); 

            projectSummary.setPartyBillingTotalAmount(this.getRandomDouble()); 

            projectSummary.setCollectionsAmount(this.getRandomDouble()); 

            projectSummary.setCollectionsTotalAmount(this.getRandomDouble()); 

            projectSummary.setCollectionsRate(this.getRandomDouble()); 

            projectSummary.setCustomerBillingAmount(this.getRandomDouble()); 

            projectSummary.setCustomerBillingTotalAmount(this.getRandomDouble()); 

            projectSummary.setPaymentAmount(this.getRandomDouble()); 

            projectSummary.setPaymentTotalAmount(this.getRandomDouble()); 

            projectSummary.setTaxRate(this.getRandomDouble()); 

            projectSummary.setTaxPlanAmount(this.getRandomDouble()); 

            projectSummary.setTaxRealAmount(this.getRandomDouble()); 

            projectSummary.setTaxTotalAmount(this.getRandomDouble()); 

            projectSummary.setTaxOweAmount(this.getRandomDouble()); 

            projectSummary.setArrearsAmount(this.getRandomDouble()); 

            projectSummary.setExpectedValue(this.getRandomDouble()); 


			projectSummary.setProfilePoint(this.getRandomString());

			service.insert(projectSummary);

			if (this.getRandomBoolean()) {
				service.update(projectSummary);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + projectSummary.getId());
				service.delete(projectSummary.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<ProjectSummary> list = service.getAll();
		for (ProjectSummary obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

