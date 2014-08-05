﻿/**
  * @ cqiyi create in 2014-8-5 20:19:53 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper.partial;

import java.util.List;
import org.springframework.stereotype.Repository;
import hply.domain.SysAuthorization;



/**
  * 数据表： [t_sys_authorization]
  * 13_授权关系
  */
@Repository
public interface PartialSysAuthorizationMapper {

	  public void insert(SysAuthorization sysAuthorization);
	  
	  public void update(SysAuthorization sysAuthorization);
	  
	  public void delete(String id);
	  
	  public SysAuthorization get(String id);
      
	  public int getVersion(String id);
	  
	  public List<SysAuthorization> getAll();
}

