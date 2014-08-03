package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.Information;
import hply.mapper.InformationMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 10_信息登记，服务类
 */
public class InformationService {
	Logger logger = LoggerFactory.getLogger(InformationService.class);

	@Autowired
	private InformationMapper mapper;

	/**
	 * 10_信息登记，插入对象
	 */
	public void insert(Information information) {
		information.setCreateUser(SessionHelper.getCurrentSysUser().getId());
		mapper.insert(information);
	}

	/**
	 * 10_信息登记，不进行冲突检测的更新
	 */
	public void update(Information information) {
		information.setUpdateUser(SessionHelper.getCurrentSysUser().getId());
		mapper.update(information);
	}

	/**
	 * 10_信息登记，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(Information information) {
		information.setUpdateUser(SessionHelper.getCurrentSysUser().getId());
		if (mapper.getVersion(information.getId()) != information.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_information.id=" + information.getId());
		}
		mapper.update(information);
	}

	/**
	 * 10_信息登记，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 10_信息登记，根据主键获取一个对象
	 */
	public Information get(String id) {
		return mapper.get(id);
	}

	/**
	 * 10_信息登记，获取所有对象
	 */
	public List<Information> getAll() {
		return mapper.getAll();
	}
}
