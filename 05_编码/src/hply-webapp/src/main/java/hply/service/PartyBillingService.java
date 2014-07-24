package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.domain.PartyBilling;
import hply.mapper.PartyBillingMapper;

@Service
public class PartyBillingService {
    
	@Autowired
    private PartyBillingMapper mapper;

	  public void insert(PartyBilling partyBilling){
        mapper.insert(partyBilling);
      }
	  
	  public void update(PartyBilling partyBilling){
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

