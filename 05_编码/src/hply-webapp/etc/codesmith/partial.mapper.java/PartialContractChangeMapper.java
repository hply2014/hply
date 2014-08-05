﻿/**
  * @ cqiyi create in 2014-8-5 20:19:53 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper.partial;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import hply.domain.ContractChange;



/**
  * 数据表： [t_contract_change]
  * 02_合同补充协议
  */
@Repository
public interface PartialContractChangeMapper {

	  public void insert(ContractChange contractChange);
	  
	  public void update(ContractChange contractChange);
	  
	  public void delete(String id);
	  
	  public ContractChange get(String id);
      
	  public int getVersion(String id);
	  
	  public List<ContractChange> getAll();
}

