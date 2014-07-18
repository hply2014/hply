package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.fweb1.exception.DataVersionConflictException;
import org.hhwy.fweb1.domain.PaymentItem;
import org.hhwy.fweb1.mapper.PaymentItemMapper;

@Service
public class PaymentItemService {
    
	@Autowired
    private PaymentItemMapper mapper;

	  public void insert(PaymentItem paymentItem){
        mapper.insert(paymentItem);
      }
	  
	  public void update(PaymentItem paymentItem){
          if(mapper.getVersion(paymentItem.getId()) != paymentItem.getVersion()){
            throw new DataVersionConflictException("Updating t_payment_item." + paymentItem.getId() );
          }
          
        mapper.update(paymentItem);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public PaymentItem get(String id){
        return mapper.get(id);
      }
	  
	  public List<PaymentItem> getAll(){
        return mapper.getAll();
      }
}

