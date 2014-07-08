/**
  * @Template info: 2013/08/16, Chengqiyi.
  * ChengQiyi create in 2014/7/8 14:30:21
  * This class generated by CodeSmith Generator
  */

package hply.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Repository;
import hply.persistence.SysResourceMapper;

import hply.domain.SysResource;

@Repository(value = "sysResourceService")
public class SysResourceService {
    
    @Resource(name = "sysResourceMapper")
    private SysResourceMapper sysResourceMapper;

	  public void insert(SysResource sysResource){
        sysResourceMapper.insert(sysResource);
      }
	  
	  public void update(SysResource sysResource){
        sysResourceMapper.update(sysResource);
      
      }
	  
	  public void delete(String id){
        sysResourceMapper.delete(id);
      }
	  
	  public SysResource get(String id){
        return sysResourceMapper.get(id);
      }
	  
	  public List<SysResource> getAll(){
        return sysResourceMapper.getAll();
      }
}


