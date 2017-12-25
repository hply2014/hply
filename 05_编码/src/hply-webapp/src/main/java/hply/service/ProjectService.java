package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.Project;
import hply.domain.ProjectSummary;
import hply.domain.Where;
import hply.mapper.ProjectMapper;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 01_合同项目信息，服务类
 */
public class ProjectService {
	Logger logger = LoggerFactory.getLogger(ProjectService.class);

	@Autowired
	private ProjectMapper mapper;

	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private CollectionsService collectionsService;

	@Autowired
	private ProjectSummaryService projectSummaryService;

	/**
	 * 01_合同项目信息，插入对象
	 */
	public void insert(Project project) {
		project.setCreateUser(SessionHelper.getCurrentUserId());
		mapper.insert(project);
	}

	/**
	 * 01_合同项目信息，不进行冲突检测的更新
	 */
	public void update(Project project) {
		project.setUpdateUser(SessionHelper.getCurrentUserId());
		mapper.update(project);
	}

	/**
	 * 01_合同项目信息，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(Project project) {
		project.setUpdateUser(SessionHelper.getCurrentUserId());
		if (mapper.getVersion(project.getId()) != project.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_project.id=" + project.getId());
		}
		mapper.update(project);
	}

	/**
	 * 01_合同项目信息，根据主键删除对象
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
	 * 01_合同项目信息，根据主键获取一个对象
	 */
	public Project get(String id) {
		return mapper.get(id);
	}

	/**
	 * 01_合同项目信息，根据条件获取一个对象
	 */
	public Project getBy(Where where) {
		return mapper.getBy(where);
	}

	/**
	 * 01_合同项目信息，获取所有对象
	 */
	public List<Project> getAll() {
		return mapper.getAll();
	}

	/**
	 * 01_合同项目信息，获取记录总行数
	 */
	public int getRowCount(String queryText) {
		return mapper.getRowCount(queryText);
	}

	/**
	 * 01_合同项目信息，获取记录总行数
	 */
	public int getRowCount(String queryText, String organizationId) {
		return mapper.getRowCountByOrganization(queryText, organizationId);
	}

	/**
	 * 01_合同项目信息，获取所有对象，分页方式
	 */
	public List<Project> getAllPaged(String queryText, int pageIndex, int pageSize) {
		return mapper.getAllPaged(queryText, pageIndex, pageSize);
	}

	/**
	 * 01_合同项目信息，获取所有对象，分页方式
	 */
	public List<Project> getAllPagedByOrganization(String queryText, String orgId, int pageIndex, int pageSize) {
		List<Project> list = mapper.getAllPagedByOrganization(queryText, orgId, pageIndex, pageSize);
		// projectSummary.collectionsTotalAmount -
		// projectSummary.paymentTotalAmount

		for (Project p : list) {
			// 收到的工程款总额+自入款总额
			double g2 = collectionsService.getTotalCollectionsAmount(p.getId());
			
			// 计算工程款结存
			double k3 = g2 - paymentService.getAllToalPayment(p.getId());
			
			//计算可用余额
			ProjectSummary projectSummary = projectSummaryService.getSummaryByProject(p.getId());
			double k4 = 0;
			if(projectSummary != null){
				k4 = projectSummary.getTaxPlanAmount() > 0? (k3 - projectSummary.getTaxPlanAmount()) : k3;
			}
			DecimalFormat dformat = new DecimalFormat("#,##0.00");
			p.setField01(dformat.format(k3));
			p.setField02(dformat.format(k4));
		}

		return list;
	}


	/**
	 * 01_合同项目信息，获取合计
	 */
	public Map<String, Object> getTotalByOrganization(String queryText, String orgId){
		return mapper.getTotalByOrganization(queryText, orgId);
	}

	public void updateAllStatus() {
		mapper.updateAllStatus();
	}

	public List<Project> getAllNames() {
		if (SessionHelper.IsBusinessDepartment()) {
			String orgId = SessionHelper.getCurrentSysUser().getOrganizationId();
			return getAllNamesByOrganization(orgId);
		}
		return mapper.getAllNames();
	}

	public List<Project> getAllNamesByOrganization(String orgId) {
		return mapper.getAllNamesByOrganization(orgId);
	}

	public double getTotalAmount(String projectId) {
		Double d = mapper.getTotalAmount(projectId);
		return d != null ? d.doubleValue() : 0.0;
	}

	public void updateManagementPlanAmount(String projectId, double amount) {
		Project p = this.get(projectId);
		p.setManagementPlanAmount(amount);
		this.update(p);

	}

	public void updateTaxPlanAmount(String projectId, double amount) {
		Project p = this.get(projectId);
		p.setTaxPlanAmount(amount);
		this.update(p);
	}
	
	public void batchCheck(String projectId, String modelId){
		mapper.batchCheck(projectId, "t_" + modelId);
	}
}
