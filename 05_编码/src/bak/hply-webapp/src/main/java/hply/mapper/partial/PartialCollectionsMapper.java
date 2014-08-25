﻿/**
  * @ cqiyi create in 2014-8-25 23:07:45 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper.partial;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import hply.domain.Collections;



/**
  * 数据表： [t_collections]
  * 05_收款情况
  */
@Repository
public interface PartialCollectionsMapper {

	  public void insert(Collections collections);
	  
	  public void update(Collections collections);
	  
	  public void delete(String id);
	  
	  public Collections get(String id);
      
	  public int getVersion(String id);
	  
	  public List<Collections> getAll();
      
	  public int getRowCount();
	  
	  public List<Collections> getAllPaged(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);
}

