package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import hply.domain.SysResource;
import hply.mapper.SysResourceMapper;
import hply.core.DataVersionConflictException;

@Service

/**
 * 12_系统资源，服务类
 */
public class SysResourceService {
    Logger logger = LoggerFactory.getLogger(SysResourceService.class);
    
	@Autowired
    private SysResourceMapper mapper;
    
    /**
     * 12_系统资源，插入对象
     */
	  public void insert(SysResource sysResource){
        mapper.insert(sysResource);
      }
      
	  /**
     * 12_系统资源，不进行冲突检测的更新
     */
	  public void update(SysResource sysResource){
        mapper.update(sysResource);
      }
      
    /**
     * 12_系统资源，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(SysResource sysResource){
      if(mapper.getVersion(sysResource.getId()) != sysResource.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_sys_resource.id=" + sysResource.getId() );
          }
        mapper.update(sysResource);
      }
      
	  /**
     * 12_系统资源，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 12_系统资源，根据主键获取一个对象
     */
	  public SysResource get(String id){
        return mapper.get(id);
      }
	  /**
     * 12_系统资源，获取所有对象
     */
	  public List<SysResource> getAll(){
        return mapper.getAll();
      }
}

