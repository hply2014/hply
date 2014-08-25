package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import hply.domain.PaymentItem;
import hply.mapper.PaymentItemMapper;
import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;

@Service

/**
 * 06+A_付款科目，服务类
 */
public class PaymentItemService {
    Logger logger = LoggerFactory.getLogger(PaymentItemService.class);
    
	@Autowired
    private PaymentItemMapper mapper;
    
    /**
     * 06+A_付款科目，插入对象
     */
	  public void insert(PaymentItem paymentItem){
        paymentItem.setCreateUser(SessionHelper.getCurrentUserId());
        mapper.insert(paymentItem);
      }
      
	  /**
     * 06+A_付款科目，不进行冲突检测的更新
     */
	  public void update(PaymentItem paymentItem){
        paymentItem.setUpdateUser(SessionHelper.getCurrentUserId());
        mapper.update(paymentItem);
      }
      
    /**
     * 06+A_付款科目，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(PaymentItem paymentItem){
      paymentItem.setUpdateUser(SessionHelper.getCurrentUserId());
      if(mapper.getVersion(paymentItem.getId()) != paymentItem.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_payment_item.id=" + paymentItem.getId() );
          }
        mapper.update(paymentItem);
      }
      
	  /**
     * 06+A_付款科目，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 06+A_付款科目，根据主键获取一个对象
     */
	  public PaymentItem get(String id){
        return mapper.get(id);
      }
      
	  /**
     * 06+A_付款科目，获取所有对象
     */
	  public List<PaymentItem> getAll(){
        return mapper.getAll();
      }
      
	  /**
     * 06+A_付款科目，获取记录总行数
     */
	  public int getRowCount(){
        return mapper.getRowCount();
      }
      
	  /**
     * 06+A_付款科目，获取所有对象，分页方式
     */
	  public List<PaymentItem> getAllPaged(int pageIndex, int pageSize){
        return mapper.getAllPaged(pageIndex, pageSize);
      }
}

