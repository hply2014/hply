﻿/**
 * @ cqiyi create in 2014-8-25 23:07:45 by Template
 * This class generated by Forever Web Rapid Framework Code Generator
 */

package hply.mapper;

import hply.domain.Project;
import hply.mapper.partial.PartialProjectMapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 数据表： [t_project] 01_合同项目信息
 */
@Repository
public interface ProjectMapper extends PartialProjectMapper {
	public List<Project> getAllNames();

	public void updateAllStatus();

	public Double getTotalAmount(String projectId);

	public List<Project> getAllPagedByOrganization(@Param("queryText") String queryText, @Param("organizationId") String orgId,
			@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);

	public int getRowCountByOrganization(@Param("queryText") String queryText, @Param("organizationId") String organizationId);

	public List<Project> getAllNamesByOrganization(String organizationId);
}
