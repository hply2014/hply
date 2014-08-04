package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hhwy.fweb1.domain.SysRoleUser;
import org.hhwy.fweb1.mapper.SysRoleUserMapper;
import org.hhwy.fweb1.core.DataVersionConflictException;

@Service

/**
 * 角色与用户的对应表，多对多，服务类
 */
public class SysRoleUserService {
    Logger logger = LoggerFactory.getLogger(SysRoleUserService.class);
    
	@Autowired
    private SysRoleUserMapper mapper;
    
    /**
     * 角色与用户的对应表，多对多，插入对象
     */
	  public void insert(SysRoleUser sysRoleUser){
        mapper.insert(sysRoleUser);
      }
      
	  /**
     * 角色与用户的对应表，多对多，不进行冲突检测的更新
     */
	  public void update(SysRoleUser sysRoleUser){
        mapper.update(sysRoleUser);
      }
      
    /**
     * 角色与用户的对应表，多对多，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(SysRoleUser sysRoleUser){
      if(mapper.getVersion(sysRoleUser.getId()) != sysRoleUser.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_sys_role_user.id=" + sysRoleUser.getId() );
          }
        mapper.update(sysRoleUser);
      }
      
	  /**
     * 角色与用户的对应表，多对多，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 角色与用户的对应表，多对多，根据主键获取一个对象
     */
	  public SysRoleUser get(String id){
        return mapper.get(id);
      }
	  /**
     * 角色与用户的对应表，多对多，获取所有对象
     */
	  public List<SysRoleUser> getAll(){
        return mapper.getAll();
      }
}

