﻿/**
  * @ cqiyi create in 2014/7/18 15:51:38 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package org.hhwy.fweb1.mapper;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import org.hhwy.fweb1.domain.PaymentItem;



/**
  * 数据表： [t_payment_item]
  * 06+A_付款科目
  */
@Repository
public interface PaymentItemMapper {

	  public void insert(PaymentItem paymentItem);
	  
	  public void update(PaymentItem paymentItem);
	  
	  public void delete(String id);
	  
	  public PaymentItem get(String id);
      
	  public int getVersion(String id);
	  
	  public List<PaymentItem> getAll();
}

