package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import hply.domain.Collections;
import hply.mapper.CollectionsMapper;
import hply.core.DataVersionConflictException;

@Service

/**
 * 05_收款情况，服务类
 */
public class CollectionsService {
    Logger logger = LoggerFactory.getLogger(CollectionsService.class);
    
	@Autowired
    private CollectionsMapper mapper;
    
    /**
     * 05_收款情况，插入对象
     */
	  public void insert(Collections collections){
        mapper.insert(collections);
      }
      
	  /**
     * 05_收款情况，不进行冲突检测的更新
     */
	  public void update(Collections collections){
        mapper.update(collections);
      }
      
    /**
     * 05_收款情况，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(Collections collections){
      if(mapper.getVersion(collections.getId()) != collections.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_collections.id=" + collections.getId() );
          }
        mapper.update(collections);
      }
      
	  /**
     * 05_收款情况，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 05_收款情况，根据主键获取一个对象
     */
	  public Collections get(String id){
        return mapper.get(id);
      }
	  /**
     * 05_收款情况，获取所有对象
     */
	  public List<Collections> getAll(){
        return mapper.getAll();
      }
}

