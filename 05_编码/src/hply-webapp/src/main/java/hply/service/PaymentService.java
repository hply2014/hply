package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

