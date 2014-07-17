package org.hhwy.rdc.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.rdc.fweb1.DataVersionConflictException;
import org.hhwy.rdc.fweb1.domain.Arrears;
import org.hhwy.rdc.fweb1.mapper.ArrearsMapper;

@Service
public class ArrearsService {
    
	@Autowired
    private ArrearsMapper mapper;

	  public void insert(Arrears arrears){
        mapper.insert(arrears);
      }
	  
	  public void update(Arrears arrears){
          if(mapper.getVersion(arrears.getId()) != arrears.getVersion()){
            throw new DataVersionConflictException("Updating t_arrears." + arrears.getId() );
          }
          
        mapper.update(arrears);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public Arrears get(String id){
        return mapper.get(id);
      }
	  
	  public List<Arrears> getAll(){
        return mapper.getAll();
      }
}

