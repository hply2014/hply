﻿/**
  * @ cqiyi create in 2014/7/18 15:51:38 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package org.hhwy.fweb1.mapper;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import org.hhwy.fweb1.domain.ProjectSummary;



/**
  * 数据表： [t_project_summary]
  * 00_多项目汇总
  */
@Repository
public interface ProjectSummaryMapper {

	  public void insert(ProjectSummary projectSummary);
	  
	  public void update(ProjectSummary projectSummary);
	  
	  public void delete(String id);
	  
	  public ProjectSummary get(String id);
      
	  public int getVersion(String id);
	  
	  public List<ProjectSummary> getAll();
}

