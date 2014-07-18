package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.fweb1.exception.DataVersionConflictException;
import org.hhwy.fweb1.domain.Information;
import org.hhwy.fweb1.mapper.InformationMapper;

@Service
public class InformationService {
    
	@Autowired
    private InformationMapper mapper;

	  public void insert(Information information){
        mapper.insert(information);
      }
	  
	  public void update(Information information){
          if(mapper.getVersion(information.getId()) != information.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_information.id=" + information.getId() );
          }
          
        mapper.update(information);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public Information get(String id){
        return mapper.get(id);
      }
	  
	  public List<Information> getAll(){
        return mapper.getAll();
      }
}

