/**
  * @Template info: 2013/08/16, Chengqiyi.
  * ChengQiyi create in 2014/7/8 14:30:36
  * This class generated by CodeSmith Generator
  */

package hply.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Repository;
import hply.persistence.SysParameterMapper;

import hply.domain.SysParameter;

@Repository(value = "sysParameterService")
public class SysParameterService {
    
    @Resource(name = "sysParameterMapper")
    private SysParameterMapper sysParameterMapper;

	  public void insert(SysParameter sysParameter){
        sysParameterMapper.insert(sysParameter);
      }
	  
	  public void update(SysParameter sysParameter){
        sysParameterMapper.update(sysParameter);
      
      }
	  
	  public void delete(String id){
        sysParameterMapper.delete(id);
      }
	  
	  public SysParameter get(String id){
        return sysParameterMapper.get(id);
      }
	  
	  public List<SysParameter> getAll(){
        return sysParameterMapper.getAll();
      }
}


