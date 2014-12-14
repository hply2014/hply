﻿/**
 * @ cqiyi create in 2014-8-25 23:07:45 by Template
 * This class generated by Forever Web Rapid Framework Code Generator
 */

package hply.mapper;

import hply.domain.ProjectSummary;
import hply.mapper.partial.PartialProjectSummaryMapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 数据表： [t_project_summary] 00_多项目汇总
 */
@Repository
public interface ProjectSummaryMapper extends PartialProjectSummaryMapper {

	/*
	 * pharse : 传入格式 '2014-05'，将查询2014-5-21到2014-6-20的项目汇总信息
	 */
	public List<ProjectSummary> getSummaryByMonth(@Param("pharse") String pharse, @Param("organizationId") String organizationId);

	public List<String> getMonths();

	/*
	 * 获取指定项目的所有汇总信息
	 */
	public ProjectSummary getSummaryByProject(@Param("projectId") String projectId);

	public List<ProjectSummary> getAllPagedByOrganization(@Param("organizationId") String orgId, @Param("pageIndex") int pageIndex,
			@Param("pageSize") int pageSize);
	
	public List<ProjectSummary> getHistoryByProject(@Param("projectId") String projectId);

	public int getRowCountByOrganization(@Param("organizationId") String organizationId);
}
