package hply.service;

import hply.core.DataVersionConflictException;
import hply.domain.ProjectSummary;
import hply.mapper.ProjectSummaryMapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 00_多项目汇总，服务类
 */
public class ProjectSummaryService {
	Logger logger = LoggerFactory.getLogger(ProjectSummaryService.class);

	@Autowired
	private ProjectSummaryMapper mapper;

	/**
	 * 00_多项目汇总，插入对象
	 */
	public void insert(ProjectSummary projectSummary) {
		mapper.insert(projectSummary);
	}

	/**
	 * 00_多项目汇总，不进行冲突检测的更新
	 */
	public void update(ProjectSummary projectSummary) {
		mapper.update(projectSummary);
	}

	/**
	 * 00_多项目汇总，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(ProjectSummary projectSummary) {
		if (mapper.getVersion(projectSummary.getId()) != projectSummary.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_project_summary.id=" + projectSummary.getId());
		}
		mapper.update(projectSummary);
	}

	/**
	 * 00_多项目汇总，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 00_多项目汇总，根据主键获取一个对象
	 */
	public ProjectSummary get(String id) {
		return mapper.get(id);
	}

	/**
	 * 00_多项目汇总，获取所有对象
	 */
	public List<ProjectSummary> getAll() {
		return mapper.getAll();
	}

	/**
	 * 00_多项目汇总，获取记录总行数
	 */
	public int getRowCount() {
		return mapper.getRowCount();
	}

	/**
	 * 00_多项目汇总，获取所有对象，分页方式
	 */
	public List<ProjectSummary> getAllPaged(int pageIndex, int pageSize) {
		return mapper.getAllPaged(pageIndex, pageSize);
	}

	/*
	 * pharse : 传入格式 '2014-05'，将查询2014-5-21到2014-6-20的项目汇总信息
	 */
	public List<ProjectSummary> getSummaryByMonth(String pharse, String organizationId) {
		return mapper.getSummaryByMonth(pharse, organizationId);
	}
	
	public List<String> getMonths(){
		return mapper.getMonths();
	}
	
	public ProjectSummary getSummaryByProject(String projectId){
		return mapper.getSummaryByProject(projectId);
	}
	public List<ProjectSummary> getHistoryByProject(@Param("projectId") String projectId){
		return mapper.getHistoryByProject(projectId);
	}
	public List<ProjectSummary> getAllPagedByOrganization(String orgId, int pageIndex, int pageSize) {
		return mapper.getAllPagedByOrganization(orgId, pageIndex, pageSize);
	}


	public int getRowCount(String orgId) {
		return mapper.getRowCountByOrganization(orgId);
	}
}
