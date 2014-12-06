﻿/**
  * @ cqiyi create in 2014-8-25 23:07:45 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper;

import hply.domain.Collections;
import hply.mapper.partial.PartialCollectionsMapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;



/**
  * 数据表： [t_collections]
  * 05_收款情况
  */
@Repository
public interface CollectionsMapper extends PartialCollectionsMapper {

	//实际已经收的工程款
	public Double getTotalCollectionsAmount(String projectId);
	public List<Collections> getAllByProject(String projectId);
	
	public List<Collections> getAllPagedByOrganization(@Param("organizationId") String orgId,
			@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);

	public int getRowCountByOrganization(@Param("organizationId") String organizationId);
}

