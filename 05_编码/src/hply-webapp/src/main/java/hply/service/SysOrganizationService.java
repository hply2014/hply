package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.domain.SysOrganization;
import hply.mapper.SysOrganizationMapper;

@Service
public class SysOrganizationService {
    
	@Autowired
    private SysOrganizationMapper mapper;

	  public void insert(SysOrganization sysOrganization){
        mapper.insert(sysOrganization);
      }
	  
	  public void update(SysOrganization sysOrganization){
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

