﻿/**
 * @ cqiyi create in 2014/7/24 20:53:29 by Template
 * This class generated by Forever Web Rapid Framework Code Generator
 */

package hply.mapper;

import hply.domain.SysParameter;

import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * 数据表： [t_sys_parameter]
 * 
 */
@Repository
public interface SysParameterMapper {

	public void insert(SysParameter sysParameter);

	public void update(SysParameter sysParameter);

	public void delete(String id);

	public SysParameter get(String id);

	public int getVersion(String id);

	public List<SysParameter> getAll();
}
