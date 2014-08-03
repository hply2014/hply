package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import hply.domain.SysAuthorization;
import hply.mapper.SysAuthorizationMapper;
import hply.core.DataVersionConflictException;

@Service
/**
 * 13_授权关系，服务类
 */
public class SysAuthorizationService {
	Logger logger = LoggerFactory.getLogger(SysAuthorizationService.class);

	@Autowired
	private SysAuthorizationMapper mapper;

	/**
	 * 13_授权关系，插入对象
	 */
	public void insert(SysAuthorization sysAuthorization) {
		mapper.insert(sysAuthorization);
	}

	/**
	 * 13_授权关系，不进行冲突检测的更新
	 */
	public void update(SysAuthorization sysAuthorization) {
		mapper.update(sysAuthorization);
	}

	/**
	 * 13_授权关系，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(SysAuthorization sysAuthorization) {
		if (mapper.getVersion(sysAuthorization.getId()) != sysAuthorization.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_sys_authorization.id=" + sysAuthorization.getId());
		}
		mapper.update(sysAuthorization);
	}

	/**
	 * 13_授权关系，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 13_授权关系，根据主键获取一个对象
	 */
	public SysAuthorization get(String id) {
		return mapper.get(id);
	}

	/**
	 * 13_授权关系，获取所有对象
	 */
	public List<SysAuthorization> getAll() {
		return mapper.getAll();
	}

	public List<SysAuthorization> getAuthorizationByUserId(String userId) {
		return mapper.getAuthorizationByUserId(userId);
	}

	public SysAuthorization getByUserIdAndResource(String userId, String resourceId) {
		return mapper.getByUserIdAndResource(userId, resourceId);
	}
}
