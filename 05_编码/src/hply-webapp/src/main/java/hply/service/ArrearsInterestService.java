package hply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import hply.domain.ArrearsInterest;
import hply.mapper.ArrearsInterestMapper;
import hply.core.DataVersionConflictException;

@Service
/**
 * 往来欠款的利息计算明细，服务类
 */
public class ArrearsInterestService {
	Logger logger = LoggerFactory.getLogger(ArrearsInterestService.class);

	@Autowired
	private ArrearsInterestMapper mapper;

	/**
	 * 往来欠款的利息计算明细，插入对象
	 */
	public void insert(ArrearsInterest arrearsInterest) {
		mapper.insert(arrearsInterest);
	}

	/**
	 * 往来欠款的利息计算明细，不进行冲突检测的更新
	 */
	public void update(ArrearsInterest arrearsInterest) {
		mapper.update(arrearsInterest);
	}

	/**
	 * 往来欠款的利息计算明细，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(ArrearsInterest arrearsInterest) {
		if (mapper.getVersion(arrearsInterest.getId()) != arrearsInterest.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_arrears_interest.id=" + arrearsInterest.getId());
		}
		mapper.update(arrearsInterest);
	}

	/**
	 * 往来欠款的利息计算明细，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 往来欠款的利息计算明细，根据主键获取一个对象
	 */
	public ArrearsInterest get(String id) {
		return mapper.get(id);
	}

	/**
	 * 往来欠款的利息计算明细，获取所有对象
	 */
	public List<ArrearsInterest> getAll() {
		return mapper.getAll();
	}

	/**
	 * 往来欠款的利息计算明细，获取记录总行数
	 */
	public int getRowCount() {
		return mapper.getRowCount();
	}

	/**
	 * 往来欠款的利息计算明细，获取所有对象，分页方式
	 */
	public List<ArrearsInterest> getAllPaged(int pageIndex, int pageSize) {
		return mapper.getAllPaged(pageIndex, pageSize);
	}

	public List<ArrearsInterest> getDetail(String arrearsId) {
		return mapper.getDetail(arrearsId);
	}

	public double getPlanInterest(String projectId) {
		Double d = mapper.getPlanInterest(projectId);
		return d != null ? d.doubleValue() : 0.0;
	}

	public double getRealInterest(String projectId) {
		Double d = mapper.getRealInterest(projectId);
		return d != null ? d.doubleValue() : 0.0;
	}
}
