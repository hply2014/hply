package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import hply.domain.SysUser;
import hply.mapper.SysUserMapper;
import hply.core.DataVersionConflictException;

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
        mapper.insert(sysUser);
      }
      
	  /**
     * 11_系统用户，不进行冲突检测的更新
     */
	  public void update(SysUser sysUser){
        mapper.update(sysUser);
      }
      
    /**
     * 11_系统用户，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(SysUser sysUser){
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
}

