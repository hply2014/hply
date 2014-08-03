package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import hply.domain.ContractChange;
import hply.mapper.ContractChangeMapper;
import hply.core.DataVersionConflictException;

@Service

/**
 * 02_合同补充协议，服务类
 */
public class ContractChangeService {
    Logger logger = LoggerFactory.getLogger(ContractChangeService.class);
    
	@Autowired
    private ContractChangeMapper mapper;
    
    /**
     * 02_合同补充协议，插入对象
     */
	  public void insert(ContractChange contractChange){
        mapper.insert(contractChange);
      }
      
	  /**
     * 02_合同补充协议，不进行冲突检测的更新
     */
	  public void update(ContractChange contractChange){
        mapper.update(contractChange);
      }
      
    /**
     * 02_合同补充协议，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(ContractChange contractChange){
      if(mapper.getVersion(contractChange.getId()) != contractChange.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_contract_change.id=" + contractChange.getId() );
          }
        mapper.update(contractChange);
      }
      
	  /**
     * 02_合同补充协议，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 02_合同补充协议，根据主键获取一个对象
     */
	  public ContractChange get(String id){
        return mapper.get(id);
      }
	  /**
     * 02_合同补充协议，获取所有对象
     */
	  public List<ContractChange> getAll(){
        return mapper.getAll();
      }
}

