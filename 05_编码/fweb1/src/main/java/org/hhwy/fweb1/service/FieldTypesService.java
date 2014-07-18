package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.fweb1.exception.DataVersionConflictException;
import org.hhwy.fweb1.domain.FieldTypes;
import org.hhwy.fweb1.mapper.FieldTypesMapper;

@Service
public class FieldTypesService {
    
	@Autowired
    private FieldTypesMapper mapper;

	  public void insert(FieldTypes fieldTypes){
        mapper.insert(fieldTypes);
      }
	  
	  public void update(FieldTypes fieldTypes){
          if(mapper.getVersion(fieldTypes.getId()) != fieldTypes.getVersion()){
            throw new DataVersionConflictException("Updating t_field_types." + fieldTypes.getId() );
          }
          
        mapper.update(fieldTypes);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public FieldTypes get(String id){
        return mapper.get(id);
      }
	  
	  public List<FieldTypes> getAll(){
        return mapper.getAll();
      }
}

