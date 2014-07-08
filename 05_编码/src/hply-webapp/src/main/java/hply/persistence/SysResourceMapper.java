/**
  * @Template info: 2013/08/16, Chengqiyi.
  * ChengQiyi create in 2014/7/8 14:32:14
  * This class generated by CodeSmith Generator
  */

package hply.persistence;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import hply.domain.SysResource;

@Repository(value = "sysResourceMapper")
public interface SysResourceMapper {

	  public void insert(SysResource sysResource);
	  
	  public void update(SysResource sysResource);
	  
	  public void delete(String id);
	  
	  public SysResource get(String id);
	  
	  public List<SysResource> getAll();
}


