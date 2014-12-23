﻿/**
 * @ cqiyi create in 2014-8-25 23:07:45 by Template
 * This class generated by Forever Web Rapid Framework Code Generator
 */

package hply.mapper.partial;

import hply.domain.Project;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 数据表： [t_project] 01_合同项目信息
 */
@Repository
public interface PartialProjectMapper {

	public void insert(Project project);

	public void update(Project project);

	public void delete(String id);

	public void check(String id);

	public Project get(String id);

	public int getVersion(String id);

	public List<Project> getAll();

	public int getRowCount(@Param("queryText") String queryText);

	public List<Project> getAllPaged(@Param("queryText") String queryText, @Param("pageIndex") int pageIndex,
			@Param("pageSize") int pageSize);
}
