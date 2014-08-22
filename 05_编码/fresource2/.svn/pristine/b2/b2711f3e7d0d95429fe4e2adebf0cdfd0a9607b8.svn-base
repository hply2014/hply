package com.hhwy.fresource2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hhwy.fresource2.core.DataVersionConflictException;
import com.hhwy.fresource2.domain.SysRoleResources;
import com.hhwy.fresource2.mapper.SysRoleResourcesMapper;

@Service
/**
 * 角色与资源的对应表，服务类
 */
public class SysRoleResourcesService {
	Logger logger = LoggerFactory.getLogger(SysRoleResourcesService.class);

	@Autowired
	private SysRoleResourcesMapper mapper;

	/**
	 * 角色与资源的对应表，插入对象
	 */
	public void insert(SysRoleResources sysRoleResources) {
		mapper.insert(sysRoleResources);
	}

	/**
	 * 角色与资源的对应表，不进行冲突检测的更新
	 */
	public void update(SysRoleResources sysRoleResources) {
		mapper.update(sysRoleResources);
	}

	/**
	 * 角色与资源的对应表，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(SysRoleResources sysRoleResources) {
		if (mapper.getVersion(sysRoleResources.getId()) != sysRoleResources
				.getVersion()) {
			throw new DataVersionConflictException(
					"Data conflict has occurred， t_sys_role_resources.id="
							+ sysRoleResources.getId());
		}
		mapper.update(sysRoleResources);
	}

	/**
	 * 角色与资源的对应表，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 角色与资源的对应表，根据主键获取一个对象
	 */
	public SysRoleResources get(String id) {
		return mapper.get(id);
	}

	/**
	 * 角色与资源的对应表，获取所有对象
	 */
	public List<SysRoleResources> getAll() {
		return mapper.getAll();
	}
}
