package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hhwy.fweb1.domain.SysRoleResource;
import org.hhwy.fweb1.mapper.SysRoleResourceMapper;
import org.hhwy.fweb1.core.DataVersionConflictException;

@Service

/**
 * 角色与资源的对应表，服务类
 */
public class SysRoleResourceService {
    Logger logger = LoggerFactory.getLogger(SysRoleResourceService.class);
    
	@Autowired
    private SysRoleResourceMapper mapper;
    
    /**
     * 角色与资源的对应表，插入对象
     */
	  public void insert(SysRoleResource sysRoleResource){
        mapper.insert(sysRoleResource);
      }
      
	  /**
     * 角色与资源的对应表，不进行冲突检测的更新
     */
	  public void update(SysRoleResource sysRoleResource){
        mapper.update(sysRoleResource);
      }
      
    /**
     * 角色与资源的对应表，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(SysRoleResource sysRoleResource){
      if(mapper.getVersion(sysRoleResource.getId()) != sysRoleResource.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_sys_role_resource.id=" + sysRoleResource.getId() );
          }
        mapper.update(sysRoleResource);
      }
      
	  /**
     * 角色与资源的对应表，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 角色与资源的对应表，根据主键获取一个对象
     */
	  public SysRoleResource get(String id){
        return mapper.get(id);
      }
	  /**
     * 角色与资源的对应表，获取所有对象
     */
	  public List<SysRoleResource> getAll(){
        return mapper.getAll();
      }
}

