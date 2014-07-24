﻿/**
  * @ cqiyi create in 2014/7/24 20:53:29 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper;

import hply.domain.SysUser;

import java.util.List;

import org.springframework.stereotype.Repository;



/**
  * 数据表： [t_sys_user]
  * 
  */
@Repository
public interface SysUserMapper {

	  public void insert(SysUser sysUser);
	  
	  public void update(SysUser sysUser);
	  
	  public void delete(String id);
	  
	  public SysUser get(String id);
      
	  public int getVersion(String id);
	  
	  public List<SysUser> getAll();
}

