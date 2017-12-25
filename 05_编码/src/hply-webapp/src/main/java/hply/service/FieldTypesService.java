package hply.service;

import hply.core.DataVersionConflictException;
import hply.domain.FieldTypes;
import hply.mapper.FieldTypesMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
      
	  /**
     * 所有数据类型的测试样表，获取记录总行数
     */
	  public int getRowCount(){
        return mapper.getRowCount();
      }
      
	  /**
     * 所有数据类型的测试样表，获取所有对象，分页方式
     */
	  public List<FieldTypes> getAllPaged(int pageIndex, int pageSize){
        return mapper.getAllPaged(pageIndex, pageSize);
      }
}

