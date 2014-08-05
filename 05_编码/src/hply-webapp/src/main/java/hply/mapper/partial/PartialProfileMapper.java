﻿/**
  * @ cqiyi create in 2014-8-5 20:19:53 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper.partial;

import java.util.List;
import org.springframework.stereotype.Repository;
import hply.domain.Profile;



/**
  * 数据表： [t_profile]
  * 08_型材
  */
@Repository
public interface PartialProfileMapper {

	  public void insert(Profile profile);
	  
	  public void update(Profile profile);
	  
	  public void delete(String id);
	  
	  public Profile get(String id);
      
	  public int getVersion(String id);
	  
	  public List<Profile> getAll();
}

