﻿/**
  * @ cqiyi create in 2014-8-25 23:07:45 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper.partial;

import hply.domain.Chop;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;



/**
  * 数据表： [t_chop]
  * 09_盖章管理
  */
@Repository
public interface PartialChopMapper {

	  public void insert(Chop chop);
	  
	  public void update(Chop chop);
	  
	  public void delete(String id);
	  
	  public Chop get(String id);
      
	  public int getVersion(String id);
	  
	  public List<Chop> getAll();
      
	  public int getRowCount();
	  
	 }

