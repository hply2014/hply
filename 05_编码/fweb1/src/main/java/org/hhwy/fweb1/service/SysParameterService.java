package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.fweb1.exception.DataVersionConflictException;
import org.hhwy.fweb1.domain.SysParameter;
import org.hhwy.fweb1.mapper.SysParameterMapper;

@Service
public class SysParameterService {
    
	@Autowired
    private SysParameterMapper mapper;

	  public void insert(SysParameter sysParameter){
        mapper.insert(sysParameter);
      }
	  
	  public void update(SysParameter sysParameter){
          if(mapper.getVersion(sysParameter.getId()) != sysParameter.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_sys_parameter.id=" + sysParameter.getId() );
          }
          
        mapper.update(sysParameter);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public SysParameter get(String id){
        return mapper.get(id);
      }
	  
	  public List<SysParameter> getAll(){
        return mapper.getAll();
      }
}

