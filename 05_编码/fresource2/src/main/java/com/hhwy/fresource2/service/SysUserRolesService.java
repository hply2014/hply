package com.hhwy.fresource2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hhwy.fresource2.core.DataVersionConflictException;
import com.hhwy.fresource2.domain.SysUserRoles;
import com.hhwy.fresource2.mapper.SysUserRolesMapper;

@Service
/**
 * 角色与用户的对应表，多对多，服务类
 */
public class SysUserRolesService {
	Logger logger = LoggerFactory.getLogger(SysUserRolesService.class);

	@Autowired
	private SysUserRolesMapper mapper;

	/**
	 * 角色与用户的对应表，多对多，插入对象
	 */
	public void insert(SysUserRoles sysUserRoles) {
		mapper.insert(sysUserRoles);
	}

	/**
	 * 角色与用户的对应表，多对多，不进行冲突检测的更新
	 */
	public void update(SysUserRoles sysUserRoles) {
		mapper.update(sysUserRoles);
	}

	/**
	 * 角色与用户的对应表，多对多，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(SysUserRoles sysUserRoles) {
		if (mapper.getVersion(sysUserRoles.getId()) != sysUserRoles
				.getVersion()) {
			throw new DataVersionConflictException(
					"Data conflict has occurred， t_sys_user_roles.id="
							+ sysUserRoles.getId());
		}
		mapper.update(sysUserRoles);
	}

	/**
	 * 角色与用户的对应表，多对多，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 角色与用户的对应表，多对多，根据主键获取一个对象
	 */
	public SysUserRoles get(String id) {
		return mapper.get(id);
	}

	/**
	 * 角色与用户的对应表，多对多，获取所有对象
	 */
	public List<SysUserRoles> getAll() {
		return mapper.getAll();
	}
}
