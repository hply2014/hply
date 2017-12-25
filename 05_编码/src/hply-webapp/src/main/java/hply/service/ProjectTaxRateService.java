package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.Project;
import hply.domain.ProjectTaxRate;
import hply.domain.Where;
import hply.mapper.ProjectTaxRateMapper;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 混合税率，服务类
 */
public class ProjectTaxRateService {
	Logger logger = LoggerFactory.getLogger(ProjectTaxRateService.class);

	@Autowired
	private ProjectTaxRateMapper mapper;

	/**
	 * 混合税率，插入对象
	 */
	public void insert(ProjectTaxRate projectTaxRate) {
		projectTaxRate.setCreateUser(SessionHelper.getCurrentUserId());
		mapper.insert(projectTaxRate);
	}

	/**
	 * 混合税率，不进行冲突检测的更新
	 */
	public void update(ProjectTaxRate projectTaxRate) {
		projectTaxRate.setUpdateUser(SessionHelper.getCurrentUserId());
		mapper.update(projectTaxRate);
	}

	/**
	 * 混合税率，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(ProjectTaxRate projectTaxRate) {
		projectTaxRate.setUpdateUser(SessionHelper.getCurrentUserId());
		if (mapper.getVersion(projectTaxRate.getId()) != projectTaxRate.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_ProjectTaxRate.id=" + projectTaxRate.getId());
		}
		mapper.update(projectTaxRate);
	}

	/**
	 * 混合税率，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 混合税率，根据条件删除对象
	 */
	public void deleteBy(Where where) {
		mapper.deleteBy(where);
	}
	/**
	 * 混合税率，根据主键获取一个对象
	 */
	public ProjectTaxRate get(String id) {
		return mapper.get(id);
	}

	/**
	 * 混合税率，获取所有对象
	 */
	public List<ProjectTaxRate> getAll() {
		return mapper.getAll();
	}

	/**
	 * 混合税率，获取所有对象
	 */
	public List<ProjectTaxRate> getAllBy(Where where) {
		return mapper.getAllBy(where);
	}

	/**
	 * 混合税率，获取记录总行数
	 */
	public int getRowCount() {
		return mapper.getRowCount();
	}

	/**
	 * 混合税率，获取所有对象，分页方式
	 */
	public List<ProjectTaxRate> getAllPaged(int pageIndex, int pageSize) {
		return mapper.getAllPaged(pageIndex, pageSize);
	}
	
	public List<Map<String, Object>> getGroupByTaxTate(Where where){
		return mapper.getGroupByTaxTate(where);
	};
	
	/**
	 * 混合税率，批量操作
	 * 状态（trStatus）：-1：删除，0：不操作(创建时初始状态)，1：不操作(修改时初始状态)，2：修改(修改后状态进行保存或者修改)
	 */
	public void batchOper(Project project){
		// 判断是否有数据
		if(project.getTrStatuss() != null){
			String[] trIds = project.getTrIds();
			String[] trNames = project.getTrNames();
			double[] trTaxRates = project.getTrTaxRates();
			double[] trAmounts = project.getTrAmounts();
			Integer[] trStatuss = project.getTrStatuss();
			// 循环操作数据
			for (int i = 0; i < trStatuss.length; i++) {
				String trId = trIds[i].trim();
				switch (trStatuss[i]) {
				case -1:
					if(StringUtils.isNotEmpty(trId)){
						delete(trId);
					}
					break;
				case 2:
					if(StringUtils.isEmpty(trId)){
						ProjectTaxRate projectTaxRate = new ProjectTaxRate();
						projectTaxRate.setName(trNames[i]);
						projectTaxRate.setTaxRate(trTaxRates[i]);
						projectTaxRate.setAmount(trAmounts[i]);
						projectTaxRate.setStatus(1);// 保存成功状态为1
						// 新增需要设置合同ID关联
						projectTaxRate.setProjectId(project.getId());
						insert(projectTaxRate);
					}else{
						// TODO tyc 混合税率修改操作：修改 or 删除后新增
						ProjectTaxRate projectTaxRate = get(trId);
						projectTaxRate.setName(trNames[i]);
						projectTaxRate.setTaxRate(trTaxRates[i]);
						projectTaxRate.setAmount(trAmounts[i]);
						update(projectTaxRate);
					}
					break;
				default:
					// 0和1：不操作
					break;
				}
			}
		}
		
	}
	
}
