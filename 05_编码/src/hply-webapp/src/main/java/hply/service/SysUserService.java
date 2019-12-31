package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.SysUser;
import hply.mapper.SysUserMapper;

import java.util.List;

import org.apache.shiro.crypto.hash.Sha256Hash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

/**
 * 11_系统用户，服务类
 */
public class SysUserService {
    Logger logger = LoggerFactory.getLogger(SysUserService.class);
    
	@Autowired
    private SysUserMapper mapper;
    
    /**
     * 11_系统用户，插入对象
     */
	  public void insert(SysUser sysUser){
        sysUser.setCreateUser(SessionHelper.getCurrentUserId());
		hashedPassword(sysUser);
        mapper.insert(sysUser);
      }
      
	  /**
     * 11_系统用户，不进行冲突检测的更新
     */
	  public void update(SysUser sysUser){
        sysUser.setUpdateUser(SessionHelper.getCurrentUserId());
        mapper.update(sysUser);
      }
      
    /**
     * 11_系统用户，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(SysUser sysUser){
      sysUser.setUpdateUser(SessionHelper.getCurrentUserId());
      if(mapper.getVersion(sysUser.getId()) != sysUser.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_sys_user.id=" + sysUser.getId() );
          }
        mapper.update(sysUser);
      }
      
	  /**
     * 11_系统用户，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 11_系统用户，根据主键获取一个对象
     */
	  public SysUser get(String id){
        return mapper.get(id);
      }
      
	  /**
     * 11_系统用户，获取所有对象
     */
	  public List<SysUser> getAll(){
        return mapper.getAll();
      }
      
	  /**
     * 11_系统用户，获取记录总行数
     */
	  public int getRowCount(){
        return mapper.getRowCount();
      }
      
	  /**
     * 11_系统用户，获取所有对象，分页方式
     */
	  public List<SysUser> getAllPaged(int pageIndex, int pageSize){
        return mapper.getAllPaged(pageIndex, pageSize);
      }

		public SysUser getByLoginName(String loginName) {
			SysUser user = mapper.getByLoginName(loginName);
			return user;
		}

		public void hashedPassword(SysUser sysUser) {
			// if (StringUtils.isNotEmpty(sysUser.getPassword()) &&
			// sysUser.getPassword().length() < 64) {
			String hashedPassword = new Sha256Hash(sysUser.getPassword(), sysUser.getId(), 1).toString();
			sysUser.setPassword(hashedPassword);
			// }
		}
		
		// 手动获取密码
		/*public static void main(String[] args) throws Exception {
			String password = "a5bd3318-0c3a-11e4-9300-001c42328937";
			System.out.println(password);
			String hashedPassword = new Sha256Hash("123456", password, 1).toString();
			System.out.println(hashedPassword);
	    }*/
		
		
}

