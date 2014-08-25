﻿package hply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import hply.domain.Arrears;
import hply.mapper.ArrearsMapper;
import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;

@Service

/**
 * 07_往来欠款，服务类
 */
public class ArrearsService {
    Logger logger = LoggerFactory.getLogger(ArrearsService.class);
    
	@Autowired
    private ArrearsMapper mapper;
    
    /**
     * 07_往来欠款，插入对象
     */
	  public void insert(Arrears arrears){
        arrears.setCreateUser(SessionHelper.getCurrentUserId());
        mapper.insert(arrears);
      }
      
	  /**
     * 07_往来欠款，不进行冲突检测的更新
     */
	  public void update(Arrears arrears){
        arrears.setUpdateUser(SessionHelper.getCurrentUserId());
        mapper.update(arrears);
      }
      
    /**
     * 07_往来欠款，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(Arrears arrears){
      arrears.setUpdateUser(SessionHelper.getCurrentUserId());
      if(mapper.getVersion(arrears.getId()) != arrears.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_arrears.id=" + arrears.getId() );
          }
        mapper.update(arrears);
      }
      
	  /**
     * 07_往来欠款，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 07_往来欠款，根据主键获取一个对象
     */
	  public Arrears get(String id){
        return mapper.get(id);
      }
      
	  /**
     * 07_往来欠款，获取所有对象
     */
	  public List<Arrears> getAll(){
        return mapper.getAll();
      }
      
	  /**
     * 07_往来欠款，获取记录总行数
     */
	  public int getRowCount(){
        return mapper.getRowCount();
      }
      
	  /**
     * 07_往来欠款，获取所有对象，分页方式
     */
	  public List<Arrears> getAllPaged(int pageIndex, int pageSize){
        return mapper.getAllPaged(pageIndex, pageSize);
      }

		public Double getTotalByProject(String projectId){
			return mapper.getTotalByProject(projectId);
		}
}

