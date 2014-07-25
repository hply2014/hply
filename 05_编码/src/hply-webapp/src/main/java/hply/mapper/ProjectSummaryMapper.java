﻿/**
 * @ cqiyi create in 2014/7/24 20:53:29 by Template
 * This class generated by Forever Web Rapid Framework Code Generator
 */

package hply.mapper;

import hply.domain.ProjectSummary;

import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * 数据表： [t_project_summary]
 * 
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
