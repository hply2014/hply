package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.fweb1.exception.DataVersionConflictException;
import org.hhwy.fweb1.domain.ContractChange;
import org.hhwy.fweb1.mapper.ContractChangeMapper;

@Service
public class ContractChangeService {
    
	@Autowired
    private ContractChangeMapper mapper;

	  public void insert(ContractChange contractChange){
        mapper.insert(contractChange);
      }
	  
	  public void update(ContractChange contractChange){
          if(mapper.getVersion(contractChange.getId()) != contractChange.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_contract_change.id=" + contractChange.getId() );
          }
          
        mapper.update(contractChange);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public ContractChange get(String id){
        return mapper.get(id);
      }
	  
	  public List<ContractChange> getAll(){
        return mapper.getAll();
      }
}

