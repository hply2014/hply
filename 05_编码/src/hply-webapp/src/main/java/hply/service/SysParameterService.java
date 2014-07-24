package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.domain.SysParameter;
import hply.mapper.SysParameterMapper;

@Service
public class SysParameterService {
    
	@Autowired
    private SysParameterMapper mapper;

	  public void insert(SysParameter sysParameter){
        mapper.insert(sysParameter);
      }
	  
	  public void update(SysParameter sysParameter){
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

