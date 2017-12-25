/**
 * @ cqiyi create in 2014-8-25 23:07:45 by Template
 * This class generated by Forever Web Rapid Framework Code Generator
 */

package hply.mapper.partial;

import hply.domain.CustomerBilling;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 数据表： [t_customer_billing] 04_客户开票情况
 */
@Repository
public interface PartialCustomerBillingMapper {

	public void insert(CustomerBilling customerBilling);

	public void update(CustomerBilling customerBilling);

	public void delete(String id);

	public void check(String id);

	public CustomerBilling get(String id);

	public int getVersion(String id);

	public List<CustomerBilling> getAll();

	public int getRowCount();

	public List<CustomerBilling> getAllPaged(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);
}
