package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.exception.DataVersionConflictException;
import hply.domain.SysAuthorization;
import hply.mapper.SysAuthorizationMapper;

@Service
public class SysAuthorizationService {
    
	@Autowired
    private SysAuthorizationMapper mapper;

	  public void insert(SysAuthorization sysAuthorization){
        mapper.insert(sysAuthorization);
      }
	  
	  public void update(SysAuthorization sysAuthorization){
          if(mapper.getVersion(sysAuthorization.getId()) != sysAuthorization.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_sys_authorization.id=" + sysAuthorization.getId() );
          }
          
        mapper.update(sysAuthorization);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public SysAuthorization get(String id){
        return mapper.get(id);
      }
	  
	  public List<SysAuthorization> getAll(){
        return mapper.getAll();
      }
}

