package hply.test;

import java.util.List;
import org.hhwy.fweb1.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import hply.service.ProfileService;
import hply.domain.Profile;

public class ProfileServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private ProfileService service;
    
	@Test
	public void allServiceTest() {
		int objectCount = this.getRandomInt();
		int deleteCount = 0;
		int updateCount = 0;

		for (int i = 0; i < objectCount; i++) {
			Profile profile = new Profile();



			profile.setProjectId(this.getRandomString());

            profile.setExpectedValue(this.getRandomDouble()); 


			profile.setProfilePoint(this.getRandomString());        
            profile.setTrice(this.getRandomDate());         
            profile.setCreateTime(this.getRandomDate()); 


			profile.setCreateUser(this.getRandomString());        
            profile.setUpdateTime(this.getRandomDate()); 


			profile.setUpdateUser(this.getRandomString());


			profile.setDescription(this.getRandomString());

			service.insert(profile);

			if (this.getRandomBoolean()) {
				Profile obj = service.get(profile.getId());
				service.update(obj);
				updateCount++;
				continue;
			}

			if (this.getRandomBoolean() && i > 0) {
				System.out.println("将被删除：" + profile.getId());
				service.delete(profile.getId());
				deleteCount++;
				continue;
			}
		}

		System.out.println("写入：" + objectCount + ", 修改：" + updateCount + ", 删除："
				+ deleteCount + "\n");

		List<Profile> list = service.getAll();
		for (Profile obj : list) {
			System.out.println(obj);
		}

		service.delete(list.get(0).getId());

	}

}

