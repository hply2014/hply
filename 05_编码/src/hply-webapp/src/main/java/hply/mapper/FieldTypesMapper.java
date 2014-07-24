﻿/**
  * @ cqiyi create in 2014/7/24 20:53:29 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper;

import hply.domain.FieldTypes;

import java.util.List;

import org.springframework.stereotype.Repository;



/**
  * 数据表： [t_field_types]
  * 
  */
@Repository
public interface FieldTypesMapper {

	  public void insert(FieldTypes fieldTypes);
	  
	  public void update(FieldTypes fieldTypes);
	  
	  public void delete(String id);
	  
	  public FieldTypes get(String id);
      
	  public int getVersion(String id);
	  
	  public List<FieldTypes> getAll();
}

