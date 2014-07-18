package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.fweb1.exception.DataVersionConflictException;
import org.hhwy.fweb1.domain.CustomerBilling;
import org.hhwy.fweb1.mapper.CustomerBillingMapper;

@Service
public class CustomerBillingService {
    
	@Autowired
    private CustomerBillingMapper mapper;

	  public void insert(CustomerBilling customerBilling){
        mapper.insert(customerBilling);
      }
	  
	  public void update(CustomerBilling customerBilling){
          if(mapper.getVersion(customerBilling.getId()) != customerBilling.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_customer_billing.id=" + customerBilling.getId() );
          }
          
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

