package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.exception.DataVersionConflictException;
import hply.domain.PaymentItem;
import hply.mapper.PaymentItemMapper;

@Service
public class PaymentItemService {
    
	@Autowired
    private PaymentItemMapper mapper;

	  public void insert(PaymentItem paymentItem){
        mapper.insert(paymentItem);
      }
	  
	  public void update(PaymentItem paymentItem){
          if(mapper.getVersion(paymentItem.getId()) != paymentItem.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_payment_item.id=" + paymentItem.getId() );
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

