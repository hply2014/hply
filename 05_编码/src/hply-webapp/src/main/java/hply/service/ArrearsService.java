package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.core.Utility;
import hply.domain.Arrears;
import hply.mapper.ArrearsMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 07_往来欠款，服务类
 */
public class ArrearsService {
	Logger logger = LoggerFactory.getLogger(ArrearsService.class);

	@Autowired
	private ArrearsMapper mapper;

	/**
	 * 07_往来欠款，插入对象
	 */
	// @Transactional(rollbackFor = SQLException.class)
	public void insert(Arrears arrears) {
		arrears.setCreateUser(SessionHelper.getCurrentUserId());
		mapper.insert(arrears);
//		try {
//			
//			
//			
//			Map<String, Object> param = new HashMap<String, Object>();
//			if (arrears.getAmount() > 0 && "垫资".equals(arrears.getArrearsType())) {
//				// 归还本金
//				mapper.restorePrincipal(arrears.getId());
//			}
//
//			if (arrears.getAmount() > 0 && "利息".equals(arrears.getArrearsType())) {
//				// 归还利息
//				param.put("arrears_id", arrears.getId());
//				mapper.restoreInterest(param);
//			}
//		} catch (Exception ex) {
//			mapper.delete(arrears.getId());
//			throw ex;
//		}

	}
	
	public void repay(String arrearsId, Double amount, Double interest){
		mapper.restorePrincipal(arrearsId, amount, interest, SessionHelper.getCurrentUserId());
	}
	
	

	/**
	 * 07_往来欠款，不进行冲突检测的更新
	 */
	public void update(Arrears arrears) {
		arrears.setUpdateUser(SessionHelper.getCurrentUserId());
		mapper.update(arrears);
	}

	/**
	 * 07_往来欠款，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(Arrears arrears) {
		arrears.setUpdateUser(SessionHelper.getCurrentUserId());
		if (mapper.getVersion(arrears.getId()) != arrears.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_arrears.id=" + arrears.getId());
		}
		mapper.update(arrears);
	}

	/**
	 * 07_往来欠款，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/*
	 * 审核操作，将status修改为1
	 */
	public void check(String id) {
		// TODO 审核操作，将status修改为1
		mapper.check(id);
	}

	/**
	 * 07_往来欠款，根据主键获取一个对象
	 */
	public Arrears get(String id) {
		return mapper.get(id);
	}

	/**
	 * 07_往来欠款，获取所有对象
	 */
	public List<Arrears> getAll() {
		return mapper.getAll();
	}

	/**
	 * 07_往来欠款，获取记录总行数
	 */
	public int getRowCount() {
		return mapper.getRowCount();
	}

	/**
	 * 07_往来欠款，获取所有对象，分页方式
	 */
	public List<Arrears> getAllPaged(int pageIndex, int pageSize) {
		return mapper.getAllPaged(pageIndex, pageSize);
	}

	public double getTotalByProject(String projectId) {
		Double d = mapper.getTotalByProject(projectId);
		return d != null ? d.doubleValue() : 0.0;
	}

	public double getInterestAmount(String projectId) {
		Double d = mapper.getInterestAmount(projectId);
		return d != null ? d.doubleValue() : 0.0;
	}

	public List<Arrears> getAllByProject(String projectId) {
		return mapper.getAllByProject(projectId);
	}

	public List<Arrears> getAllPagedByOrganization(String orgId, int pageIndex, int pageSize) {
		return mapper.getAllPagedByOrganization(orgId, pageIndex, pageSize);
	}

	public int getRowCount(String orgId) {
		return mapper.getRowCountByOrganization(orgId);
	}
}
