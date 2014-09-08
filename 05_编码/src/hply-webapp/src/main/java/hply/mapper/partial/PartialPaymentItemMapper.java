﻿/**
  * @ cqiyi create in 2014-8-25 23:07:45 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper.partial;

import hply.domain.PaymentItem;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;



/**
  * 数据表： [t_payment_item]
  * 06+A_付款科目
  */
@Repository
public interface PartialPaymentItemMapper {

	  public void insert(PaymentItem paymentItem);
	  
	  public void update(PaymentItem paymentItem);
	  
	  public void delete(String id);
	  
	  public PaymentItem get(String id);
      
	  public int getVersion(String id);
	  
	  public List<PaymentItem> getAll();
      
	  public int getRowCount();
	  
	  public List<PaymentItem> getAllPaged(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);
}

