package org.hhwy.rdc.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.rdc.fweb1.DataVersionConflictException;
import org.hhwy.rdc.fweb1.domain.Payment;
import org.hhwy.rdc.fweb1.mapper.PaymentMapper;

@Service
public class PaymentService {
    
	@Autowired
    private PaymentMapper mapper;

	  public void insert(Payment payment){
        mapper.insert(payment);
      }
	  
	  public void update(Payment payment){
          if(mapper.getVersion(payment.getId()) != payment.getVersion()){
            throw new DataVersionConflictException("Updating t_payment." + payment.getId() );
          }
          
        mapper.update(payment);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public Payment get(String id){
        return mapper.get(id);
      }
	  
	  public List<Payment> getAll(){
        return mapper.getAll();
      }
}

