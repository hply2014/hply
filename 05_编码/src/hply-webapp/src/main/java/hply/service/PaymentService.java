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
		payment.setCreateUser(SessionHelper.getCurrentSysUser().getId());
		mapper.insert(payment);
	}

	/**
	 * 06_付款情况，不进行冲突检测的更新
	 */
	public void update(Payment payment) {
		payment.setUpdateUser(SessionHelper.getCurrentSysUser().getId());
		mapper.update(payment);
	}

	/**
	 * 06_付款情况，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(Payment payment) {
		payment.setUpdateUser(SessionHelper.getCurrentSysUser().getId());
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
	
	/*
	 * 付款总额
	 */
	public double getToalPayment(String projectId){
		return 0;
	}
}
