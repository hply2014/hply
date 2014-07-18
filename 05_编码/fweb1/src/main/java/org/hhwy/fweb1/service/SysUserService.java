package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.fweb1.exception.DataVersionConflictException;
import org.hhwy.fweb1.domain.SysUser;
import org.hhwy.fweb1.mapper.SysUserMapper;

@Service
public class SysUserService {
    
	@Autowired
    private SysUserMapper mapper;

	  public void insert(SysUser sysUser){
        mapper.insert(sysUser);
      }
	  
	  public void update(SysUser sysUser){
          if(mapper.getVersion(sysUser.getId()) != sysUser.getVersion()){
            throw new DataVersionConflictException("Updating t_sys_user." + sysUser.getId() );
          }
          
        mapper.update(sysUser);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public SysUser get(String id){
        return mapper.get(id);
      }
	  
	  public List<SysUser> getAll(){
        return mapper.getAll();
      }
}

