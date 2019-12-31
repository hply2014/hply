package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.InformationCertificateAmount;
import hply.mapper.InformationCertificateAmountMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

/**
 * 10+B_信息登记证书类别表，服务类
 */
public class InformationCertificateAmountService {
    Logger logger = LoggerFactory.getLogger(InformationCertificateAmountService.class);
    
	@Autowired
    private InformationCertificateAmountMapper mapper;
    
    /**
     * 10+B_信息登记证书类别表，插入对象
     */
	  public void insert(InformationCertificateAmount informationCertificateAmount){
        mapper.insert(informationCertificateAmount);
      }
      
	  /**
     * 10+B_信息登记证书类别表，不进行冲突检测的更新
     */
	  public void update(InformationCertificateAmount informationCertificateAmount){
        informationCertificateAmount.setUpdateUser(SessionHelper.getCurrentUserId());
        mapper.update(informationCertificateAmount);
      }
      
    /**
     * 10+B_信息登记证书类别表，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(InformationCertificateAmount informationCertificateAmount){
      informationCertificateAmount.setUpdateUser(SessionHelper.getCurrentUserId());
      if(mapper.getVersion(informationCertificateAmount.getId()) != informationCertificateAmount.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_informationCertificateAmount.id=" + informationCertificateAmount.getId() );
          }
        mapper.update(informationCertificateAmount);
      }
      
	  /**
     * 10+B_信息登记证书类别表，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 10+B_信息登记证书类别表，根据主键获取一个对象
     */
	  public InformationCertificateAmount get(String id){
        return mapper.get(id);
      }
      
	  /**
     * 10+B_信息登记证书类别表，获取所有对象
     */
	  public List<InformationCertificateAmount> getAll(){
        return mapper.getAll();
      }
      
	  /**
     * 10+B_信息登记证书类别表，获取记录总行数
     */
	  public int getRowCount(){
        return mapper.getRowCount();
      }
      
	  /**
     * 10+B_信息登记证书类别表，获取所有对象，分页方式
     */
	  public List<InformationCertificateAmount> getAllPaged(int pageIndex, int pageSize){
        return mapper.getAllPaged(pageIndex, pageSize);
      }
	  
	  public List<InformationCertificateAmount> getAllByInfo(String informationId) {
			return mapper.getAllByInfo(informationId);
		}
}

