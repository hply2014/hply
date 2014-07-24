package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.domain.FieldTypes;
import hply.mapper.FieldTypesMapper;

@Service
public class FieldTypesService {
    
	@Autowired
    private FieldTypesMapper mapper;

	  public void insert(FieldTypes fieldTypes){
        mapper.insert(fieldTypes);
      }
	  
	  public void update(FieldTypes fieldTypes){
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

