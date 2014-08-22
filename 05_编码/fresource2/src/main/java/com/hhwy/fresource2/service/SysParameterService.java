﻿package com.hhwy.fresource2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hhwy.fresource2.core.DataVersionConflictException;
import com.hhwy.fresource2.domain.SysParameter;
import com.hhwy.fresource2.mapper.SysParameterMapper;

@Service
/**
 * 系统参数，服务类
 */
public class SysParameterService {
	Logger logger = LoggerFactory.getLogger(SysParameterService.class);

	@Autowired
	private SysParameterMapper mapper;

	/**
	 * 系统参数，插入对象
	 */
	public void insert(SysParameter sysParameter) {
		mapper.insert(sysParameter);
	}

	/**
	 * 系统参数，不进行冲突检测的更新
	 */
	public void update(SysParameter sysParameter) {
		mapper.update(sysParameter);
	}

	/**
	 * 系统参数，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(SysParameter sysParameter) {
		if (mapper.getVersion(sysParameter.getId()) != sysParameter
				.getVersion()) {
			throw new DataVersionConflictException(
					"Data conflict has occurred， t_sys_parameter.id="
							+ sysParameter.getId());
		}
		mapper.update(sysParameter);
	}

	/**
	 * 系统参数，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 系统参数，根据主键获取一个对象
	 */
	public SysParameter get(String id) {
		return mapper.get(id);
	}

	/**
	 * 系统参数，获取所有对象
	 */
	public List<SysParameter> getAll() {
		return mapper.getAll();
	}
}
