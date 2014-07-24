package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.domain.Collections;
import hply.mapper.CollectionsMapper;

@Service
public class CollectionsService {
    
	@Autowired
    private CollectionsMapper mapper;

	  public void insert(Collections collections){
        mapper.insert(collections);
      }
	  
	  public void update(Collections collections){
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

