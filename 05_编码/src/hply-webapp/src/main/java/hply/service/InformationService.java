package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.domain.Information;
import hply.mapper.InformationMapper;

@Service
public class InformationService {
    
	@Autowired
    private InformationMapper mapper;

	  public void insert(Information information){
        mapper.insert(information);
      }
	  
	  public void update(Information information){
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

