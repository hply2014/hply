﻿/**
  * @Template info: 2013/08/16, Chengqiyi.
  * ChengQiyi create in 2014-7-13 16:09:22
  * This class generated by CodeSmith Generator
  */

package hply.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import hply.persistence.PaymentMapper;

import hply.domain.Payment;

@Service(value = "paymentService")
public class PaymentService {
    
    @Resource(name = "paymentMapper")
    private PaymentMapper paymentMapper;

	  public void insert(Payment payment){
        paymentMapper.insert(payment);
      }
	  
	  public void update(Payment payment){
        paymentMapper.update(payment);
      
      }
	  
	  public void delete(String id){
        paymentMapper.delete(id);
      }
	  
	  public Payment get(String id){
        return paymentMapper.get(id);
      }
	  
	  public List<Payment> getAll(){
        return paymentMapper.getAll();
      }
}


