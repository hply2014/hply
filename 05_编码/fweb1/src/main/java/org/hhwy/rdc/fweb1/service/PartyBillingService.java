package org.hhwy.rdc.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.rdc.fweb1.DataVersionConflictException;
import org.hhwy.rdc.fweb1.domain.PartyBilling;
import org.hhwy.rdc.fweb1.mapper.PartyBillingMapper;

@Service
public class PartyBillingService {
    
	@Autowired
    private PartyBillingMapper mapper;

	  public void insert(PartyBilling partyBilling){
        mapper.insert(partyBilling);
      }
	  
	  public void update(PartyBilling partyBilling){
          if(mapper.getVersion(partyBilling.getId()) != partyBilling.getVersion()){
            throw new DataVersionConflictException("Updating t_party_billing." + partyBilling.getId() );
          }
          
        mapper.update(partyBilling);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public PartyBilling get(String id){
        return mapper.get(id);
      }
	  
	  public List<PartyBilling> getAll(){
        return mapper.getAll();
      }
}

