﻿/**
  * @ cqiyi create in 2014/7/18 15:51:36 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */

package org.hhwy.fweb1.domain;

import java.io.Serializable;
import java.text.MessageFormat;
import java.util.Date;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.hhwy.fweb1.Utility;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
  * 数据表： [t_sys_parameter]
  * 14_系统参数
  */
public class SysParameter implements Serializable {

	/*
	 * 默认构造函数
	 */
	public SysParameter() {
		this.id = Utility.getRandomUUID();
        
        //设定日期为空时的初始值
        this.createTime = new Date(0);this.updateTime = new Date(0);
	}

    /**
      * [id]，
      * ID
      */
      
      @NotNull
      
      private String id;
      
    /**
      * [en_name]，
      * 参数英文名称
      */
      
      
      
      private String enName;
      
    /**
      * [cn_name]，
      * 参数中文名称
      */
      
      
      
      private String cnName;
      
    /**
      * [param_value]，
      * 参数值
      */
      
      
      
      private String paramValue;
      
    /**
      * [default_value]，
      * 默认值
      */
      
      
      
      private String defaultValue;
      
    /**
      * [is_inner]，
      * 是否系统内置
      */
      
      
      
      private int isInner;
      
    /**
      * [create_time]，
      * 创建时间
      */
      
      
      @DateTimeFormat(iso=ISO.DATE)
      private Date createTime;
      
    /**
      * [create_user]，
      * 创建用户
      */
      
      
      
      private String createUser;
      
    /**
      * [update_time]，
      * 修改时间
      */
      
      
      @DateTimeFormat(iso=ISO.DATE)
      private Date updateTime;
      
    /**
      * [update_user]，
      * 修改用户
      */
      
      
      
      private String updateUser;
      
    /**
      * [description]，
      * 备注
      */
      
      
      
      private String description;
      
    /**
      * [version]，
      * 
      */
      
      @NotNull
      
      private int version;
      
    
    /**
      * [id] getter，
      * ID
      */
    	public String getId () {
            return StringUtils.trimToEmpty(id);
    	}

    /**
      * [id] setter，
      * ID
      */
    	public void setId(String id) {
    		this.id = id;
    	}
    /**
      * [en_name] getter，
      * 参数英文名称
      */
    	public String getEnName () {
            return StringUtils.trimToEmpty(enName);
    	}

    /**
      * [en_name] setter，
      * 参数英文名称
      */
    	public void setEnName(String enName) {
    		this.enName = enName;
    	}
    /**
      * [cn_name] getter，
      * 参数中文名称
      */
    	public String getCnName () {
            return StringUtils.trimToEmpty(cnName);
    	}

    /**
      * [cn_name] setter，
      * 参数中文名称
      */
    	public void setCnName(String cnName) {
    		this.cnName = cnName;
    	}
    /**
      * [param_value] getter，
      * 参数值
      */
    	public String getParamValue () {
            return StringUtils.trimToEmpty(paramValue);
    	}

    /**
      * [param_value] setter，
      * 参数值
      */
    	public void setParamValue(String paramValue) {
    		this.paramValue = paramValue;
    	}
    /**
      * [default_value] getter，
      * 默认值
      */
    	public String getDefaultValue () {
            return StringUtils.trimToEmpty(defaultValue);
    	}

    /**
      * [default_value] setter，
      * 默认值
      */
    	public void setDefaultValue(String defaultValue) {
    		this.defaultValue = defaultValue;
    	}
    /**
      * [is_inner] getter，
      * 是否系统内置
      */
    	public int getIsInner () {
    		return isInner;
    	}

    /**
      * [is_inner] setter，
      * 是否系统内置
      */
    	public void setIsInner(int isInner) {
    		this.isInner = isInner;
    	}
    /**
      * [create_time] getter，
      * 创建时间
      */
    	public Date getCreateTime () {
    		return createTime;
    	}

    /**
      * [create_time] setter，
      * 创建时间
      */
    	public void setCreateTime(Date createTime) {
    		this.createTime = createTime;
    	}
    /**
      * [create_user] getter，
      * 创建用户
      */
    	public String getCreateUser () {
            return StringUtils.trimToEmpty(createUser);
    	}

    /**
      * [create_user] setter，
      * 创建用户
      */
    	public void setCreateUser(String createUser) {
    		this.createUser = createUser;
    	}
    /**
      * [update_time] getter，
      * 修改时间
      */
    	public Date getUpdateTime () {
    		return updateTime;
    	}

    /**
      * [update_time] setter，
      * 修改时间
      */
    	public void setUpdateTime(Date updateTime) {
    		this.updateTime = updateTime;
    	}
    /**
      * [update_user] getter，
      * 修改用户
      */
    	public String getUpdateUser () {
            return StringUtils.trimToEmpty(updateUser);
    	}

    /**
      * [update_user] setter，
      * 修改用户
      */
    	public void setUpdateUser(String updateUser) {
    		this.updateUser = updateUser;
    	}
    /**
      * [description] getter，
      * 备注
      */
    	public String getDescription () {
            return StringUtils.trimToEmpty(description);
    	}

    /**
      * [description] setter，
      * 备注
      */
    	public void setDescription(String description) {
    		this.description = description;
    	}
    /**
      * [version] getter，
      * 
      */
    	public int getVersion () {
    		return version;
    	}

    /**
      * [version] setter，
      * 
      */
    	public void setVersion(int version) {
    		this.version = version;
    	}
    
	@Override
	public String toString() {
		System.out.println(this.getClass().getName() + ".toString():");
        
        String str = StringUtils.EMPTY;
        str += MessageFormat.format("Id=\"{0}\",", this.getId());
        str += MessageFormat.format("EnName=\"{0}\",", this.getEnName());
        str += MessageFormat.format("CnName=\"{0}\",", this.getCnName());
        str += MessageFormat.format("ParamValue=\"{0}\",", this.getParamValue());
        str += MessageFormat.format("DefaultValue=\"{0}\",", this.getDefaultValue());
        str += MessageFormat.format("IsInner=\"{0}\",", this.getIsInner());
        str += MessageFormat.format("CreateTime=\"{0}\",", this.getCreateTime());
        str += MessageFormat.format("CreateUser=\"{0}\",", this.getCreateUser());
        str += MessageFormat.format("UpdateTime=\"{0}\",", this.getUpdateTime());
        str += MessageFormat.format("UpdateUser=\"{0}\",", this.getUpdateUser());
        str += MessageFormat.format("Description=\"{0}\",", this.getDescription());
        str += MessageFormat.format("Version=\"{0}\",", this.getVersion());;
        return str;
                        
	}
}

