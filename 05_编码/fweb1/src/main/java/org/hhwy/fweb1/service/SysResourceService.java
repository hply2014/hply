package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.fweb1.exception.DataVersionConflictException;
import org.hhwy.fweb1.domain.SysResource;
import org.hhwy.fweb1.mapper.SysResourceMapper;

@Service
public class SysResourceService {
    
	@Autowired
    private SysResourceMapper mapper;

	  public void insert(SysResource sysResource){
        mapper.insert(sysResource);
      }
	  
	  public void update(SysResource sysResource){
          if(mapper.getVersion(sysResource.getId()) != sysResource.getVersion()){
            throw new DataVersionConflictException("Updating t_sys_resource." + sysResource.getId() );
          }
          
        mapper.update(sysResource);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public SysResource get(String id){
        return mapper.get(id);
      }
	  
	  public List<SysResource> getAll(){
        return mapper.getAll();
      }
}

