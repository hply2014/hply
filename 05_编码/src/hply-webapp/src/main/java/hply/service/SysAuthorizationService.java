package hply.service;

import hply.domain.SysAuthorization;
import hply.mapper.SysAuthorizationMapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysAuthorizationService {

	@Autowired
	private SysAuthorizationMapper mapper;

	public void insert(SysAuthorization sysAuthorization) {
		mapper.insert(sysAuthorization);
	}

	public void update(SysAuthorization sysAuthorization) {
		mapper.update(sysAuthorization);
	}

	public void delete(String id) {
		mapper.delete(id);
	}

	public SysAuthorization get(String id) {
		return mapper.get(id);
	}

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
