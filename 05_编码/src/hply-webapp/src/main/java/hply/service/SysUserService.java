package hply.service;

import hply.domain.SysUser;
import hply.mapper.SysUserMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysUserService {
	Logger logger = LoggerFactory.getLogger(SysUserService.class);

	@Autowired
	private SysUserMapper mapper;

	public void insert(SysUser sysUser) {
		mapper.insert(sysUser);
	}

	public void update(SysUser sysUser) {
		mapper.update(sysUser);
	}

	public void delete(String id) {
		mapper.delete(id);
	}

	public SysUser get(String id) {
		return mapper.get(id);
	}

	public List<SysUser> getAll() {
		return mapper.getAll();
	}

	public SysUser getByLoginName(String loginName) {
		SysUser user = mapper.getByLoginName(loginName);
		return user;
	}
}
