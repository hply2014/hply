package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.domain.Arrears;
import hply.mapper.ArrearsMapper;

@Service
public class ArrearsService {
    
	@Autowired
    private ArrearsMapper mapper;

	  public void insert(Arrears arrears){
        mapper.insert(arrears);
      }
	  
	  public void update(Arrears arrears){
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

