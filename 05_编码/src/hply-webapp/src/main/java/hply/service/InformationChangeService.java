package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.InformationChange;
import hply.mapper.InformationChangeMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

/**
 * 10+A_信息登记补充修改表，服务类
 */
public class InformationChangeService {
    Logger logger = LoggerFactory.getLogger(InformationChangeService.class);
    
	@Autowired
    private InformationChangeMapper mapper;
    
    /**
     * 10+A_信息登记补充修改表，插入对象
     */
	  public void insert(InformationChange informationChange){
        informationChange.setCreateUser(SessionHelper.getCurrentUserId());
        mapper.insert(informationChange);
      }
      
	  /**
     * 10+A_信息登记补充修改表，不进行冲突检测的更新
     */
	  public void update(InformationChange informationChange){
        informationChange.setUpdateUser(SessionHelper.getCurrentUserId());
        mapper.update(informationChange);
      }
      
    /**
     * 10+A_信息登记补充修改表，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(InformationChange informationChange){
      informationChange.setUpdateUser(SessionHelper.getCurrentUserId());
      if(mapper.getVersion(informationChange.getId()) != informationChange.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_informationChange.id=" + informationChange.getId() );
          }
        mapper.update(informationChange);
      }
      
	  /**
     * 10+A_信息登记补充修改表，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 10+A_信息登记补充修改表，根据主键获取一个对象
     */
	  public InformationChange get(String id){
        return mapper.get(id);
      }
      
	  /**
     * 10+A_信息登记补充修改表，获取所有对象
     */
	  public List<InformationChange> getAll(){
        return mapper.getAll();
      }
      
	  /**
     * 10+A_信息登记补充修改表，获取所有对象
     */
	  public List<InformationChange> getAllBy(String informationId){
        return mapper.getAllBy(informationId);
      }
      
	  /**
     * 10+A_信息登记补充修改表，获取记录总行数
     */
	  public int getRowCount(String queryText){
        return mapper.getRowCount(queryText);
      }
      
	  /**
     * 10+A_信息登记补充修改表，获取所有对象，分页方式
     */
	  public List<InformationChange> getAllPaged(String queryText, int pageIndex, int pageSize){
        return mapper.getAllPaged(queryText, pageIndex, pageSize);
      }
}

