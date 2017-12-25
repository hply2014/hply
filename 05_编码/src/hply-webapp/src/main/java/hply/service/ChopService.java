package hply.service;

import hply.core.DataVersionConflictException;
import hply.domain.Chop;
import hply.mapper.ChopMapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 09_盖章管理，服务类
 */
public class ChopService {
	Logger logger = LoggerFactory.getLogger(ChopService.class);

	@Autowired
	private ChopMapper mapper;

	/**
	 * 09_盖章管理，插入对象
	 */
	public void insert(Chop chop) {
		mapper.insert(chop);
	}

	/**
	 * 09_盖章管理，不进行冲突检测的更新
	 */
	public void update(Chop chop) {
		mapper.update(chop);
	}

	/**
	 * 09_盖章管理，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(Chop chop) {
		if (mapper.getVersion(chop.getId()) != chop.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_chop.id=" + chop.getId());
		}
		mapper.update(chop);
	}

	/**
	 * 09_盖章管理，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 09_盖章管理，根据主键获取一个对象
	 */
	public Chop get(String id) {
		return mapper.get(id);
	}

	/**
	 * 09_盖章管理，获取所有对象
	 */
	public List<Chop> getAll() {
		return mapper.getAll();
	}

	/**
	 * 09_盖章管理，获取记录总行数
	 */
	public int getRowCount() {
		return mapper.getRowCount();
	}

	/**
	 * 09_盖章管理，按部门获取记录总行数
	 */
	public int getRowCountByOrganization(String queryText, String organizationId) {
		return mapper.getRowCountByOrganization(queryText, organizationId);
	}

	/**
	 * 09_盖章管理，获取所有对象，分页方式
	 */
	public List<Chop> getAllPaged(String queryText, String orgId, int pageIndex, int pageSize) {
		return mapper.getAllPagedByOrganization(queryText, orgId, pageIndex, pageSize);
	}

	public List<Chop> getChopReport(String p1, String p2, String organizationId) {
		return mapper.getChopReport(p1, p2, organizationId);
	}

	public List<String> getMonths() {
		return mapper.getMonths();
	}

}
