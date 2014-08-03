package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import hply.domain.FieldTypes;
import hply.mapper.FieldTypesMapper;
import hply.core.DataVersionConflictException;

@Service

/**
 * 所有数据类型的测试样表，服务类
 */
public class FieldTypesService {
    Logger logger = LoggerFactory.getLogger(FieldTypesService.class);
    
	@Autowired
    private FieldTypesMapper mapper;
    
    /**
     * 所有数据类型的测试样表，插入对象
     */
	  public void insert(FieldTypes fieldTypes){
        mapper.insert(fieldTypes);
      }
      
	  /**
     * 所有数据类型的测试样表，不进行冲突检测的更新
     */
	  public void update(FieldTypes fieldTypes){
        mapper.update(fieldTypes);
      }
      
    /**
     * 所有数据类型的测试样表，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(FieldTypes fieldTypes){
      if(mapper.getVersion(fieldTypes.getId()) != fieldTypes.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_field_types.id=" + fieldTypes.getId() );
          }
        mapper.update(fieldTypes);
      }
      
	  /**
     * 所有数据类型的测试样表，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 所有数据类型的测试样表，根据主键获取一个对象
     */
	  public FieldTypes get(String id){
        return mapper.get(id);
      }
	  /**
     * 所有数据类型的测试样表，获取所有对象
     */
	  public List<FieldTypes> getAll(){
        return mapper.getAll();
      }
}

