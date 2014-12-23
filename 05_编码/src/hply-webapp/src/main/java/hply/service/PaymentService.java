package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.Payment;
import hply.mapper.PaymentMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 06_付款情况，服务类
 */
public class PaymentService {
	Logger logger = LoggerFactory.getLogger(PaymentService.class);

	@Autowired
	private PaymentMapper mapper;

	/**
	 * 06_付款情况，插入对象
	 */
	public void insert(Payment payment) {
		payment.setCreateUser(SessionHelper.getCurrentUserId());
		mapper.insert(payment);
	}

	/**
	 * 06_付款情况，不进行冲突检测的更新
	 */
	public void update(Payment payment) {
		payment.setUpdateUser(SessionHelper.getCurrentUserId());
		mapper.update(payment);
	}

	/**
	 * 06_付款情况，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(Payment payment) {
		payment.setUpdateUser(SessionHelper.getCurrentUserId());
		if (mapper.getVersion(payment.getId()) != payment.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_payment.id=" + payment.getId());
		}
		mapper.update(payment);
	}

	/**
	 * 06_付款情况，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/*
	 * 审核操作，将status修改为1
	 */
	public void check(String id){
		//TODO 审核操作，将status修改为1
		mapper.check(id);
	}
	/**
	 * 06_付款情况，根据主键获取一个对象
	 */
	public Payment get(String id) {
		return mapper.get(id);
	}

	/**
	 * 06_付款情况，获取所有对象
	 */
	public List<Payment> getAll() {
		return mapper.getAll();
	}

	/**
	 * 06_付款情况，获取记录总行数
	 */
	public int getRowCount() {
		return mapper.getRowCount();
	}

	/**
	 * 06_付款情况，获取所有对象，分页方式
	 */
	public List<Payment> getAllPaged(int pageIndex, int pageSize) {
		return mapper.getAllPaged(pageIndex, pageSize);
	}

	/*
	 * 付款总额
	 */
	public double getToalPayment(String projectId) {
		Double d = mapper.getToalPayment(projectId);
		return d != null ? d.doubleValue() : 0.0;
	}
	/*
	 * 付款总额
	 */
	public double getAllToalPayment(String projectId) {
		Double d = mapper.getAllToalPayment(projectId);
		return d != null ? d.doubleValue() : 0.0;
	}

	public double getTotalPaymentByItem(String projectId, String paymentItemId) {
		Double d = mapper.getTotalPaymentByItem(projectId, paymentItemId);
		return d != null ? d.doubleValue() : 0.0;
	}

	public List<Payment> getAllByProject(String projectId) {
		return mapper.getAllByProject(projectId);
	}
	public List<Payment> getAllPagedByOrganization(String orgId, int pageIndex, int pageSize) {
		return mapper.getAllPagedByOrganization(orgId, pageIndex, pageSize);
	}


	public int getRowCount(String orgId) {
		return mapper.getRowCountByOrganization(orgId);
	}
}
