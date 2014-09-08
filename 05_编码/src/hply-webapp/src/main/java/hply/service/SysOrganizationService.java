package hply.service;

import hply.core.DataVersionConflictException;
import hply.domain.SysOrganization;
import hply.mapper.SysOrganizationMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

/**
 * 11+A_组织机构，服务类
 */
public class SysOrganizationService {
    Logger logger = LoggerFactory.getLogger(SysOrganizationService.class);
    
	@Autowired
    private SysOrganizationMapper mapper;
    
    /**
     * 11+A_组织机构，插入对象
     */
	  public void insert(SysOrganization sysOrganization){
        mapper.insert(sysOrganization);
      }
      
	  /**
     * 11+A_组织机构，不进行冲突检测的更新
     */
	  public void update(SysOrganization sysOrganization){
        mapper.update(sysOrganization);
      }
      
    /**
     * 11+A_组织机构，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(SysOrganization sysOrganization){
      if(mapper.getVersion(sysOrganization.getId()) != sysOrganization.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_sys_organization.id=" + sysOrganization.getId() );
          }
        mapper.update(sysOrganization);
      }
      
	  /**
     * 11+A_组织机构，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 11+A_组织机构，根据主键获取一个对象
     */
	  public SysOrganization get(String id){
        return mapper.get(id);
      }
      
	  /**
     * 11+A_组织机构，获取所有对象
     */
	  public List<SysOrganization> getAll(){
        return mapper.getAll();
      }
      
	  /**
     * 11+A_组织机构，获取记录总行数
     */
	  public int getRowCount(){
        return mapper.getRowCount();
      }
      
	  /**
     * 11+A_组织机构，获取所有对象，分页方式
     */
	  public List<SysOrganization> getAllPaged(int pageIndex, int pageSize){
        return mapper.getAllPaged(pageIndex, pageSize);
      }
}

