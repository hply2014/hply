package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.domain.CustomerBilling;
import hply.mapper.CustomerBillingMapper;

@Service
public class CustomerBillingService {
    
	@Autowired
    private CustomerBillingMapper mapper;

	  public void insert(CustomerBilling customerBilling){
        mapper.insert(customerBilling);
      }
	  
	  public void update(CustomerBilling customerBilling){
        mapper.update(customerBilling);
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public CustomerBilling get(String id){
        return mapper.get(id);
      }
	  
	  public List<CustomerBilling> getAll(){
        return mapper.getAll();
      }
}

