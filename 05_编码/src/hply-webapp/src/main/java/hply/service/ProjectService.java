﻿package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.Project;
import hply.mapper.ProjectMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 01_合同项目信息，服务类
 */
public class ProjectService {
	Logger logger = LoggerFactory.getLogger(ProjectService.class);

	@Autowired
	private ProjectMapper mapper;

	/**
	 * 01_合同项目信息，插入对象
	 */
	public void insert(Project project) {
		project.setCreateUser(SessionHelper.getCurrentSysUser().getId());
		mapper.insert(project);
	}

	/**
	 * 01_合同项目信息，不进行冲突检测的更新
	 */
	public void update(Project project) {
		project.setUpdateUser(SessionHelper.getCurrentSysUser().getId());
		mapper.update(project);
	}

	/**
	 * 01_合同项目信息，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(Project project) {
		project.setUpdateUser(SessionHelper.getCurrentSysUser().getId());
		if (mapper.getVersion(project.getId()) != project.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_project.id=" + project.getId());
		}
		mapper.update(project);
	}

	/**
	 * 01_合同项目信息，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 01_合同项目信息，根据主键获取一个对象
	 */
	public Project get(String id) {
		return mapper.get(id);
	}

	/**
	 * 01_合同项目信息，获取所有对象
	 */
	public List<Project> getAll() {
		return mapper.getAll();
	}
}
