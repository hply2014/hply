package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import hply.domain.PartyBilling;
import hply.mapper.PartyBillingMapper;
import hply.core.DataVersionConflictException;

@Service

/**
 * 03_甲方开票情况，服务类
 */
public class PartyBillingService {
    Logger logger = LoggerFactory.getLogger(PartyBillingService.class);
    
	@Autowired
    private PartyBillingMapper mapper;
    
    /**
     * 03_甲方开票情况，插入对象
     */
	  public void insert(PartyBilling partyBilling){
        mapper.insert(partyBilling);
      }
      
	  /**
     * 03_甲方开票情况，不进行冲突检测的更新
     */
	  public void update(PartyBilling partyBilling){
        mapper.update(partyBilling);
      }
      
    /**
     * 03_甲方开票情况，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(PartyBilling partyBilling){
      if(mapper.getVersion(partyBilling.getId()) != partyBilling.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_party_billing.id=" + partyBilling.getId() );
          }
        mapper.update(partyBilling);
      }
      
	  /**
     * 03_甲方开票情况，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 03_甲方开票情况，根据主键获取一个对象
     */
	  public PartyBilling get(String id){
        return mapper.get(id);
      }
	  /**
     * 03_甲方开票情况，获取所有对象
     */
	  public List<PartyBilling> getAll(){
        return mapper.getAll();
      }
}

