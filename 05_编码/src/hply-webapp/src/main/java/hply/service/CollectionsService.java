package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.Collections;
import hply.mapper.CollectionsMapper;
import hply.mapper.PaymentMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 05_收款情况，服务类
 */
public class CollectionsService {
	Logger logger = LoggerFactory.getLogger(CollectionsService.class);

	@Autowired
	private CollectionsMapper mapper;

	@Autowired
	private PaymentService paymentService;

	/**
	 * 05_收款情况，插入对象
	 */
	public void insert(Collections collections) {
		collections.setCreateUser(SessionHelper.getCurrentSysUser().getId());
		mapper.insert(collections);
	}

	/**
	 * 05_收款情况，不进行冲突检测的更新
	 */
	public void update(Collections collections) {
		collections.setUpdateUser(SessionHelper.getCurrentSysUser().getId());
		mapper.update(collections);
	}

	/**
	 * 05_收款情况，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(Collections collections) {
		collections.setUpdateUser(SessionHelper.getCurrentSysUser().getId());
		if (mapper.getVersion(collections.getId()) != collections.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_collections.id=" + collections.getId());
		}
		mapper.update(collections);
	}

	/**
	 * 05_收款情况，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 05_收款情况，根据主键获取一个对象
	 */
	public Collections get(String id) {
		return mapper.get(id);
	}

	/**
	 * 05_收款情况，获取所有对象
	 */
	public List<Collections> getAll() {
		return mapper.getAll();
	}

	/*
	 * 收的工程款总额
	 */
	public Double getTotalProjectAmount(String projectId) {
		return mapper.getTotalProjectAmount(projectId);
	}

	/*
	 * 计算工程剩余
	 */
	public double getSurplusProjectAmount(String projectId) {
		Double val1 = this.getTotalProjectAmount(projectId);
		double d1 = val1 != null ? val1.doubleValue() : 0;
		
		Double val2 = paymentService.getToalPayment(projectId);
		double d2 = val2 != null ? val2.doubleValue() : 0;
		
		return d1 - d2;
	}
}
