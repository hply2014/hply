package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.fweb1.exception.DataVersionConflictException;
import org.hhwy.fweb1.domain.SysOrganization;
import org.hhwy.fweb1.mapper.SysOrganizationMapper;

@Service
public class SysOrganizationService {
    
	@Autowired
    private SysOrganizationMapper mapper;

	  public void insert(SysOrganization sysOrganization){
        mapper.insert(sysOrganization);
      }
	  
	  public void update(SysOrganization sysOrganization){
          if(mapper.getVersion(sysOrganization.getId()) != sysOrganization.getVersion()){
            throw new DataVersionConflictException("Updating t_sys_organization." + sysOrganization.getId() );
          }
          
        mapper.update(sysOrganization);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public SysOrganization get(String id){
        return mapper.get(id);
      }
	  
	  public List<SysOrganization> getAll(){
        return mapper.getAll();
      }
}

