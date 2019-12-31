package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.InformationCertificate;
import hply.mapper.InformationCertificateMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

/**
 * 10+B_信息登记证书类别表，服务类
 */
public class InformationCertificateService {
    Logger logger = LoggerFactory.getLogger(InformationCertificateService.class);
    
	@Autowired
    private InformationCertificateMapper mapper;
    
    /**
     * 10+B_信息登记证书类别表，插入对象
     */
	  public void insert(InformationCertificate informationCertificate){
        informationCertificate.setCreateUser(SessionHelper.getCurrentUserId());
        mapper.insert(informationCertificate);
      }
      
	  /**
     * 10+B_信息登记证书类别表，不进行冲突检测的更新
     */
	  public void update(InformationCertificate informationCertificate){
        informationCertificate.setUpdateUser(SessionHelper.getCurrentUserId());
        mapper.update(informationCertificate);
      }
      
    /**
     * 10+B_信息登记证书类别表，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(InformationCertificate informationCertificate){
      informationCertificate.setUpdateUser(SessionHelper.getCurrentUserId());
      if(mapper.getVersion(informationCertificate.getId()) != informationCertificate.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_informationCertificate.id=" + informationCertificate.getId() );
          }
        mapper.update(informationCertificate);
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
	  public InformationCertificate get(String id){
        return mapper.get(id);
      }
      
	  /**
     * 10+B_信息登记证书类别表，获取所有对象
     */
	  public List<InformationCertificate> getAll(){
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
	  public List<InformationCertificate> getAllPaged(int pageIndex, int pageSize){
        return mapper.getAllPaged(pageIndex, pageSize);
      }
	  
	  /**
     * 10+B_信息登记证书类别表，根据证书类型和是否锁证获取一个对象
     */
	  public InformationCertificate getBy(String type, String lockFlag){
        return mapper.getBy(type, lockFlag);
      }
}

