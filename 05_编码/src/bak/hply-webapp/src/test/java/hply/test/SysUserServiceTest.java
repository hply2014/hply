package hply.test;

import java.util.List;
import hply.BaseJUnit4TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import hply.service.SysUserService;
import hply.domain.SysUser;

public class SysUserServiceTest extends BaseJUnit4TestCase {

	@Autowired
	private SysUserService service;
    
    @Test
    public void insertTest() {
        SysUser obj = this.getRandomDomain();
        service.insert(obj);
        System.out.println("已插入：" + obj);
    }
    
    
    @Test
    public void updateTest() {
        SysUser obj0 = this.getRandomDomain();
        service.insert(obj0);
        System.out.println("已插入：" + obj0);
        
		SysUser obj1 = service.get(obj0.getId());
        //获取到的obj对象
        System.out.println("已获取：" + obj1);
        
        service.update(obj1);
		SysUser obj2 = service.get(obj1.getId());
        System.out.println("更新后：" + obj2);
        
    }
    
    
    @Test
    public void deleteTest() {
        SysUser obj = this.getRandomDomain();
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
		List<SysUser> list = service.getAll();
		for (SysUser obj : list) {
			System.out.println(obj);
		}
        
        System.out.println("总行数：" + service.getRowCount());
        
        service.getAllPaged(1, 3);
        System.out.println("分页：" + service.getAllPaged(1, 3).size());
    }
    
    
    
    private SysUser getRandomDomain(){    
		SysUser obj = new SysUser();
        obj.setLoginName(this.getRandomString());
        obj.setRealName(this.getRandomString());
        obj.setOrganizationId(this.getRandomString());
        obj.setPassword(this.getRandomString());
        obj.setLastLoginIp(this.getRandomString());
        obj.setLastLoginTime(this.getRandomDate());
        obj.setFails(this.getRandomInteger());
        obj.setLogined(this.getRandomInteger());
        obj.setPosition(this.getRandomString());
        obj.setEnabled(this.getRandomBoolean());
        obj.setOrderBy(this.getRandomInteger());
        obj.setCreateUser(this.getRandomString());
        obj.setUpdateUser(this.getRandomString());
        obj.setDescription(this.getRandomString());
        obj.setMustChangePassword(this.getRandomBoolean());
        
        return obj;
    }

}

