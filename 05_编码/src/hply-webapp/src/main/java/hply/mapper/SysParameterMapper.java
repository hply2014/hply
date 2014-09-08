﻿/**
  * @ cqiyi create in 2014-8-25 23:07:45 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper;

import hply.domain.SysParameter;
import hply.mapper.partial.PartialSysParameterMapper;

import org.springframework.stereotype.Repository;



/**
  * 数据表： [t_sys_parameter]
  * 14_系统参数
  */
@Repository
public interface SysParameterMapper extends PartialSysParameterMapper {


	public SysParameter getByEnName(String enName);
	
	public String getNextCode(String prefixCode);

}