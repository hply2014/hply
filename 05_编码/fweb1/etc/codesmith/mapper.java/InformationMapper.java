﻿/**
  * @ cqiyi create in 2014/7/18 15:51:38 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package org.hhwy.fweb1.mapper;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import org.hhwy.fweb1.domain.Information;



/**
  * 数据表： [t_information]
  * 10_信息登记
  */
@Repository
public interface InformationMapper {

	  public void insert(Information information);
	  
	  public void update(Information information);
	  
	  public void delete(String id);
	  
	  public Information get(String id);
      
	  public int getVersion(String id);
	  
	  public List<Information> getAll();
}

