package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.exception.DataVersionConflictException;
import hply.domain.Payment;
import hply.mapper.PaymentMapper;

@Service
public class PaymentService {
    
	@Autowired
    private PaymentMapper mapper;

	  public void insert(Payment payment){
        mapper.insert(payment);
      }
	  
	  public void update(Payment payment){
          if(mapper.getVersion(payment.getId()) != payment.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_payment.id=" + payment.getId() );
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

