package org.hhwy.fweb1.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.hhwy.fweb1.service.ProjectService;
import org.hhwy.fweb1.domain.Project;

public class ProjectServiceTest extends BaseJUnit4TestCase {
	
	@Autowired
	private ProjectService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			Project project = new Project();



			project.setProjectCode(this.getRandomString());


			project.setProjectName(this.getRandomString());


			project.setOrganizationId(this.getRandomString());


			project.setPartyName(this.getRandomString());


			project.setPartyAddress(this.getRandomString());


			project.setManager(this.getRandomString());


			project.setContractCode(this.getRandomString());


			project.setCooperation(this.getRandomString());


			project.setLegalAssignee(this.getRandomString());
            project.setIsWithholdingOffsite(this.getRandomInt()); 

            project.setManagementRate(this.getRandomDouble()); 

            project.setTaxRate(this.getRandomDouble()); 

            project.setContractAmount(this.getRandomDouble()); 

            project.setSettlementAmount(this.getRandomDouble());         
            project.setDutyPaidTime(this.getRandomDate()); 

            project.setDutyPaidAmount(this.getRandomDouble()); 


			project.setDutyPaidCode(this.getRandomString());

            project.setCapitalOccupied(this.getRandomDouble()); 
            project.setProjectStatus(this.getRandomInt());         
            project.setTrice(this.getRandomDate());         
            project.setCreateTime(this.getRandomDate()); 


			project.setCreateUser(this.getRandomString());        
            project.setUpdateTime(this.getRandomDate()); 


			project.setUpdateUser(this.getRandomString());


			project.setDescription(this.getRandomString());

			service.insert(project);

			if (this.getRandomBoolean()) {
				service.update(project);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + project.getId());
				service.delete(project.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<Project> list = service.getAll();
		for (Project obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

