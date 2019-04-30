package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.Payment;
import hply.domain.PaymentDifferentTaxAmount;
import hply.domain.Where;
import hply.mapper.PaymentDifferentTaxAmountMapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 异地税金，服务类
 */
public class PaymentDifferentTaxAmountService {
	Logger logger = LoggerFactory.getLogger(PaymentDifferentTaxAmountService.class);

	@Autowired
	private PaymentDifferentTaxAmountMapper mapper;

	/**
	 * 异地税金，插入对象
	 */
	public void insert(PaymentDifferentTaxAmount paymentDifferentTaxAmount) {
		paymentDifferentTaxAmount.setCreateUser(SessionHelper.getCurrentUserId());
		mapper.insert(paymentDifferentTaxAmount);
	}

	/**
	 * 异地税金，不进行冲突检测的更新
	 */
	public void update(PaymentDifferentTaxAmount paymentDifferentTaxAmount) {
		paymentDifferentTaxAmount.setUpdateUser(SessionHelper.getCurrentUserId());
		mapper.update(paymentDifferentTaxAmount);
	}

	/**
	 * 异地税金，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(PaymentDifferentTaxAmount paymentDifferentTaxAmount) {
		paymentDifferentTaxAmount.setUpdateUser(SessionHelper.getCurrentUserId());
		if (mapper.getVersion(paymentDifferentTaxAmount.getId()) != paymentDifferentTaxAmount.getVersion()) {
			throw new DataVersionConflictException("Data conflict has occurred， t_PaymentDifferentTaxAmount.id=" + paymentDifferentTaxAmount.getId());
		}
		mapper.update(paymentDifferentTaxAmount);
	}

	/**
	 * 异地税金，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 异地税金，根据条件删除对象
	 */
	public void deleteBy(Where where) {
		mapper.deleteBy(where);
	}
	/**
	 * 异地税金，根据主键获取一个对象
	 */
	public PaymentDifferentTaxAmount get(String id) {
		return mapper.get(id);
	}

	/**
	 * 异地税金，获取所有对象
	 */
	public List<PaymentDifferentTaxAmount> getAll() {
		return mapper.getAll();
	}

	/**
	 * 异地税金，获取所有对象
	 */
	public List<PaymentDifferentTaxAmount> getAllBy(Where where) {
		return mapper.getAllBy(where);
	}

	/**
	 * 异地税金，获取记录总行数
	 */
	public int getRowCount() {
		return mapper.getRowCount();
	}

	/**
	 * 异地税金，获取所有对象，分页方式
	 */
	public List<PaymentDifferentTaxAmount> getAllPaged(int pageIndex, int pageSize) {
		return mapper.getAllPaged(pageIndex, pageSize);
	}
	
	/**
	 * 异地税金，批量操作
	 * 状态（trStatus）：-1：删除，0：不操作(创建时初始状态)，1：不操作(修改时初始状态)，2：修改(修改后状态进行保存或者修改)
	 */
	public void batchOper(Payment payment){
		// 判断是否有数据
		if(payment.getDiffStatuss() != null){
			String[] diffIds = payment.getDiffIds();
			String[] diffNames = payment.getDiffNames();
			double[] diffAmounts = payment.getDiffAmounts();
			Integer[] diffStatuss = payment.getDiffStatuss();
			// 循环操作数据
			for (int i = 0; i < diffStatuss.length; i++) {
				String diffId = diffIds[i].trim();
				switch (diffStatuss[i]) {
				case -1:
					break;
				case 2:
					// 异地税金修改操作：先删除后新增
					if(StringUtils.isNotEmpty(diffId)){
						delete(diffId);
					}
					PaymentDifferentTaxAmount paymentDifferentTaxAmount = new PaymentDifferentTaxAmount();
					paymentDifferentTaxAmount.setName(diffNames[i]);
					paymentDifferentTaxAmount.setAmount(diffAmounts[i]);
					paymentDifferentTaxAmount.setStatus(1);// 保存成功状态为1
					// 新增需要设置付款情况ID关联
					paymentDifferentTaxAmount.setPaymentId(payment.getId());
					insert(paymentDifferentTaxAmount);
					break;
				default:
					// 0和1：不操作
					break;
				}
			}
		}
	}
	
}
