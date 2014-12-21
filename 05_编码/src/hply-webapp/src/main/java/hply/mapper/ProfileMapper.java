﻿/**
  * @ cqiyi create in 2014-8-25 23:07:45 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper;

import hply.domain.Profile;
import hply.mapper.partial.PartialProfileMapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;



/**
  * 数据表： [t_profile]
  * 08_型材
  */
@Repository
public interface ProfileMapper extends PartialProfileMapper {

	public List<Profile> getAllByProject(String projectId);
	
	public List<Profile> getAllPagedByOrganization(@Param("organizationId") String orgId, @Param("pageIndex") int pageIndex,
			@Param("pageSize") int pageSize);

	public int getRowCountByOrganization(@Param("organizationId") String organizationId);

}

