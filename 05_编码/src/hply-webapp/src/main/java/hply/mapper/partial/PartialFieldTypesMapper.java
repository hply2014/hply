﻿/**
  * @ cqiyi create in 2014-8-10 20:38:00 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper.partial;

import java.util.List;
import org.springframework.stereotype.Repository;
import hply.domain.FieldTypes;



/**
  * 数据表： [t_field_types]
  * 所有数据类型的测试样表
  */
@Repository
public interface PartialFieldTypesMapper {

	  public void insert(FieldTypes fieldTypes);
	  
	  public void update(FieldTypes fieldTypes);
	  
	  public void delete(String id);
	  
	  public FieldTypes get(String id);
      
	  public int getVersion(String id);
	  
	  public List<FieldTypes> getAll();
}

