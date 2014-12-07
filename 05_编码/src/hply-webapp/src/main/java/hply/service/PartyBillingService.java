﻿package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.PartyBilling;
import hply.mapper.PartyBillingMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 03_甲方开票情况，服务类
 */
public class PartyBillingService {
	Logger logger = LoggerFactory.getLogger(PartyBillingService.class);

	@Autowired
	private PartyBillingMapper mapper;

	/**
	 * 03_甲方开票情况，插入对象
	 */
	public void insert(PartyBilling partyBilling) {
		partyBilling.setCreateUser(SessionHelper.getCurrentUserId());
		mapper.insert(partyBilling);
	}

	/**
	 * 03_甲方开票情况，不进行冲突检测的更新
	 */
	public void update(PartyBilling partyBilling) {
		partyBilling.setUpdateUser(SessionHelper.getCurrentUserId());
		mapper.update(partyBilling);
	}

	/**
	 * 03_甲方开票情况，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(PartyBilling partyBilling) {
		partyBilling.setUpdateUser(SessionHelper.getCurrentUserId());
		if (mapper.getVersion(partyBilling.getId()) != partyBilling.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_party_billing.id=" + partyBilling.getId());
		}
		mapper.update(partyBilling);
	}

	/**
	 * 03_甲方开票情况，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 03_甲方开票情况，根据主键获取一个对象
	 */
	public PartyBilling get(String id) {
		return mapper.get(id);
	}

	/**
	 * 03_甲方开票情况，获取所有对象
	 */
	public List<PartyBilling> getAll() {
		return mapper.getAll();
	}

	/**
	 * 03_甲方开票情况，获取记录总行数
	 */
	public int getRowCount() {
		return mapper.getRowCount();
	}

	/**
	 * 03_甲方开票情况，获取所有对象，分页方式
	 */
	public List<PartyBilling> getAllPaged(int pageIndex, int pageSize) {
		return mapper.getAllPaged(pageIndex, pageSize);
	}

	/*
	 * 获取指定项目的已审核的开票额度
	 */
	public double getCheckedAmount(String projectId) {
		Double d = mapper.getCheckedAmount(projectId);
		return d != null ? d.doubleValue() : 0.0;
	}

	public List<PartyBilling> getAllByProject(String projectId) {
		return mapper.getAllByProject(projectId);
	}
	public List<PartyBilling> getAllPagedByOrganization(String orgId, int pageIndex, int pageSize) {
		return mapper.getAllPagedByOrganization(orgId, pageIndex, pageSize);
	}


	public int getRowCount(String orgId) {
		return mapper.getRowCountByOrganization(orgId);
	}
	
	public List<PartyBilling> getAllTodo() {
		//TODO 根据流程状态过滤
		String orgId = "";
		return mapper.getAllTodo(orgId);
	}
}
