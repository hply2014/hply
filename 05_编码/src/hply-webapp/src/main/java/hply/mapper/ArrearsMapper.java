﻿/**
  * @ cqiyi create in 2014/7/24 20:53:29 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper;

import hply.domain.Arrears;

import java.util.List;

import org.springframework.stereotype.Repository;



/**
  * 数据表： [t_arrears]
  * 
  */
@Repository
public interface ArrearsMapper {

	  public void insert(Arrears arrears);
	  
	  public void update(Arrears arrears);
	  
	  public void delete(String id);
	  
	  public Arrears get(String id);
      
	  public int getVersion(String id);
	  
	  public List<Arrears> getAll();
}

