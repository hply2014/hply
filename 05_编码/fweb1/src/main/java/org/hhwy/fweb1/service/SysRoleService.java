package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hhwy.fweb1.domain.SysRole;
import org.hhwy.fweb1.mapper.SysRoleMapper;
import org.hhwy.fweb1.core.DataVersionConflictException;

@Service

/**
 * 系统角色表，服务类
 */
public class SysRoleService {
    Logger logger = LoggerFactory.getLogger(SysRoleService.class);
    
	@Autowired
    private SysRoleMapper mapper;
    
    /**
     * 系统角色表，插入对象
     */
	  public void insert(SysRole sysRole){
        mapper.insert(sysRole);
      }
      
	  /**
     * 系统角色表，不进行冲突检测的更新
     */
	  public void update(SysRole sysRole){
        mapper.update(sysRole);
      }
      
    /**
     * 系统角色表，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(SysRole sysRole){
      if(mapper.getVersion(sysRole.getId()) != sysRole.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_sys_role.id=" + sysRole.getId() );
          }
        mapper.update(sysRole);
      }
      
	  /**
     * 系统角色表，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 系统角色表，根据主键获取一个对象
     */
	  public SysRole get(String id){
        return mapper.get(id);
      }
	  /**
     * 系统角色表，获取所有对象
     */
	  public List<SysRole> getAll(){
        return mapper.getAll();
      }
}

