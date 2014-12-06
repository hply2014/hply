package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.CustomerBilling;
import hply.mapper.CustomerBillingMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 04_客户开票情况，服务类
 */
public class CustomerBillingService {
	Logger logger = LoggerFactory.getLogger(CustomerBillingService.class);

	@Autowired
	private CustomerBillingMapper mapper;

	/**
	 * 04_客户开票情况，插入对象
	 */
	public void insert(CustomerBilling customerBilling) {
		customerBilling.setCreateUser(SessionHelper.getCurrentUserId());
		mapper.insert(customerBilling);
	}

	/**
	 * 04_客户开票情况，不进行冲突检测的更新
	 */
	public void update(CustomerBilling customerBilling) {
		customerBilling.setUpdateUser(SessionHelper.getCurrentUserId());
		mapper.update(customerBilling);
	}

	/**
	 * 04_客户开票情况，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(CustomerBilling customerBilling) {
		customerBilling.setUpdateUser(SessionHelper.getCurrentUserId());
		if (mapper.getVersion(customerBilling.getId()) != customerBilling.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_customer_billing.id=" + customerBilling.getId());
		}
		mapper.update(customerBilling);
	}

	/**
	 * 04_客户开票情况，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 04_客户开票情况，根据主键获取一个对象
	 */
	public CustomerBilling get(String id) {
		return mapper.get(id);
	}

	/**
	 * 04_客户开票情况，获取所有对象
	 */
	public List<CustomerBilling> getAll() {
		return mapper.getAll();
	}

	/**
	 * 04_客户开票情况，获取记录总行数
	 */
	public int getRowCount() {
		return mapper.getRowCount();
	}

	/**
	 * 04_客户开票情况，获取所有对象，分页方式
	 */
	public List<CustomerBilling> getAllPaged(int pageIndex, int pageSize) {
		return mapper.getAllPaged(pageIndex, pageSize);
	}

	public List<CustomerBilling> getAllByProject(String projectId) {
		return mapper.getAllByProject(projectId);
	}
	public List<CustomerBilling> getAllPagedByOrganization(String orgId, int pageIndex, int pageSize) {
		return mapper.getAllPagedByOrganization(orgId, pageIndex, pageSize);
	}


	public int getRowCount(String orgId) {
		return mapper.getRowCountByOrganization(orgId);
	}
}
