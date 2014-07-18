package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.fweb1.exception.DataVersionConflictException;
import org.hhwy.fweb1.domain.Collections;
import org.hhwy.fweb1.mapper.CollectionsMapper;

@Service
public class CollectionsService {
    
	@Autowired
    private CollectionsMapper mapper;

	  public void insert(Collections collections){
        mapper.insert(collections);
      }
	  
	  public void update(Collections collections){
          if(mapper.getVersion(collections.getId()) != collections.getVersion()){
            throw new DataVersionConflictException("Updating t_collections." + collections.getId() );
          }
          
        mapper.update(collections);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public Collections get(String id){
        return mapper.get(id);
      }
	  
	  public List<Collections> getAll(){
        return mapper.getAll();
      }
}

