package org.hhwy.fweb1.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.hhwy.fweb1.core.DataVersionConflictException;
import org.hhwy.fweb1.domain.SysUser;
import org.hhwy.fweb1.mapper.SysUserMapper;
import org.hhwy.fweb1.mapper.partial.PartialSysUserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 系统用户，服务类
 */
public class SysUserService {
	Logger logger = LoggerFactory.getLogger(SysUserService.class);

	@Autowired
	private SysUserMapper mapper;

	/**
	 * 系统用户，插入对象
	 */
	public void insert(SysUser sysUser) {
		hashedPassword(sysUser);
		mapper.insert(sysUser);
	}

	/**
	 * 系统用户，不进行冲突检测的更新
	 */
	public void update(SysUser sysUser) {
		hashedPassword(sysUser);
		mapper.update(sysUser);
	}

	/**
	 * 系统用户，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(SysUser sysUser) {
		hashedPassword(sysUser);
		if (mapper.getVersion(sysUser.getId()) != sysUser.getVersion()) {
			throw new DataVersionConflictException(
					"Data conflict has occurred， t_sys_user.id="
							+ sysUser.getId());
		}
		mapper.update(sysUser);
	}

	/**
	 * 系统用户，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 系统用户，根据主键获取一个对象
	 */
	public SysUser get(String id) {
		return mapper.get(id);
	}

	/**
	 * 系统用户，获取所有对象
	 */
	public List<SysUser> getAll() {
		return mapper.getAll();
	}

	public SysUser getByLoginName(String loginName) {
		SysUser user = mapper.getByLoginName(loginName);
		return user;
	}

	private void hashedPassword(SysUser sysUser) {
		if (StringUtils.isNotBlank(sysUser.getPassword())
				&& sysUser.getPassword().length() < 64) {
			String hashedPassword = new Sha256Hash(sysUser.getPassword(),
					sysUser.getId(), 1).toString();
			sysUser.setPassword(hashedPassword);
		}
	}
}
