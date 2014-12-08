package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.Collections;
import hply.mapper.CollectionsMapper;

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

	@Autowired
	private ProjectService projectService;

	/**
	 * 05_收款情况，插入对象
	 */
	public void insert(Collections collections) {
		collections.setCreateUser(SessionHelper.getCurrentUserId());
		mapper.insert(collections);
	}

	/**
	 * 05_收款情况，不进行冲突检测的更新
	 */
	public void update(Collections collections) {
		collections.setUpdateUser(SessionHelper.getCurrentUserId());
		mapper.update(collections);
	}

	/**
	 * 05_收款情况，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(Collections collections) {
		collections.setUpdateUser(SessionHelper.getCurrentUserId());
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

	/**
	 * 05_收款情况，获取记录总行数
	 */
	public int getRowCount() {
		return mapper.getRowCount();
	}

	/**
	 * 05_收款情况，获取所有对象，分页方式
	 */
	public List<Collections> getAllPaged(int pageIndex, int pageSize) {
		return mapper.getAllPaged(pageIndex, pageSize);
	}

	/*
	 * 收的工程款总额
	 */
	public double getTotalCollectionsAmount(String projectId) {
		Double d = mapper.getTotalCollectionsAmount(projectId);
		return d != null ? d.doubleValue() : 0.0;
	}

	/*
	 * 计算工程剩余
	 */
	public double getSurplusProjectAmount(String projectId) {

		// 工程款总额，结算额>0，则用结算额，否则是合同额+累计调增额
		double d1 = projectService.getTotalAmount(projectId);

		// 已收到的工程款总额
		double d2 = this.getTotalCollectionsAmount(projectId);

		return d1 - d2;
	}

	public List<Collections> getAllByProject(String projectId) {
		return mapper.getAllByProject(projectId);
	}


	public List<Collections> getAllPagedByOrganization(String orgId, int pageIndex, int pageSize) {
		return mapper.getAllPagedByOrganization(orgId, pageIndex, pageSize);
	}


	public int getRowCount(String orgId) {
		return mapper.getRowCountByOrganization(orgId);
	}
}
