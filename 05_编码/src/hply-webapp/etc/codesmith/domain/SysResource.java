﻿/**
  * @ cqiyi create in 2014-7-26 20:28:04 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */

package hply.domain;

import java.io.Serializable;
import java.text.MessageFormat;
import java.util.Date;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import hply.Utility;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
  * 数据表： [t_sys_resource]
  * 12_系统资源
  */
public class SysResource implements Serializable {

	/*
	 * 默认构造函数
	 */
	public SysResource() {
		this.id = Utility.getRandomUUID();
        this.version = -1;
	}

    /**
      * [id]，
      * ID
      */
      
      private String id;
      
    /**
      * [res_code]，
      * 资源编码
      */
      
      private String resCode;
      
    /**
      * [res_name]，
      * 图标路径
      */
      
      private String resName;
      
    /**
      * [icon]，
      * 资源名称
      */
      
      private String icon;
      
    /**
      * [res_url]，
      * URL地址
      */
      
      private String resUrl;
      
    /**
      * [res_type]，
      * 资源类型
      */
      
      private String resType;
      
    /**
      * [order_by]，
      * 顺序号
      */
      
      private int orderBy;
      
    /**
      * [parent_id]，
      * 父ID
      */
      
      private String parentId;
      
    /**
      * [enabled]，
      * 是否禁用
      */
      
      private int enabled;
      
    /**
      * [description]，
      * 备注
      */
      
      private String description;
      
    /**
      * [version]，
      * 
      */
      
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
      * [res_code] getter，
      * 资源编码
      */
    	public String getResCode () {
            return StringUtils.trimToEmpty(resCode);
    	}

    /**
      * [res_code] setter，
      * 资源编码
      */
    	public void setResCode(String resCode) {
    		this.resCode = resCode;
    	}
    /**
      * [res_name] getter，
      * 图标路径
      */
    	public String getResName () {
            return StringUtils.trimToEmpty(resName);
    	}

    /**
      * [res_name] setter，
      * 图标路径
      */
    	public void setResName(String resName) {
    		this.resName = resName;
    	}
    /**
      * [icon] getter，
      * 资源名称
      */
    	public String getIcon () {
            return StringUtils.trimToEmpty(icon);
    	}

    /**
      * [icon] setter，
      * 资源名称
      */
    	public void setIcon(String icon) {
    		this.icon = icon;
    	}
    /**
      * [res_url] getter，
      * URL地址
      */
    	public String getResUrl () {
            return StringUtils.trimToEmpty(resUrl);
    	}

    /**
      * [res_url] setter，
      * URL地址
      */
    	public void setResUrl(String resUrl) {
    		this.resUrl = resUrl;
    	}
    /**
      * [res_type] getter，
      * 资源类型
      */
    	public String getResType () {
            return StringUtils.trimToEmpty(resType);
    	}

    /**
      * [res_type] setter，
      * 资源类型
      */
    	public void setResType(String resType) {
    		this.resType = resType;
    	}
    /**
      * [order_by] getter，
      * 顺序号
      */
    	public int getOrderBy () {
    		return orderBy;
    	}

    /**
      * [order_by] setter，
      * 顺序号
      */
    	public void setOrderBy(int orderBy) {
    		this.orderBy = orderBy;
    	}
    /**
      * [parent_id] getter，
      * 父ID
      */
    	public String getParentId () {
            return StringUtils.trimToEmpty(parentId);
    	}

    /**
      * [parent_id] setter，
      * 父ID
      */
    	public void setParentId(String parentId) {
    		this.parentId = parentId;
    	}
    /**
      * [enabled] getter，
      * 是否禁用
      */
    	public int getEnabled () {
    		return enabled;
    	}

    /**
      * [enabled] setter，
      * 是否禁用
      */
    	public void setEnabled(int enabled) {
    		this.enabled = enabled;
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
        str += MessageFormat.format("ResCode=\"{0}\",", this.getResCode());
        str += MessageFormat.format("ResName=\"{0}\",", this.getResName());
        str += MessageFormat.format("Icon=\"{0}\",", this.getIcon());
        str += MessageFormat.format("ResUrl=\"{0}\",", this.getResUrl());
        str += MessageFormat.format("ResType=\"{0}\",", this.getResType());
        str += MessageFormat.format("OrderBy=\"{0}\",", this.getOrderBy());
        str += MessageFormat.format("ParentId=\"{0}\",", this.getParentId());
        str += MessageFormat.format("Enabled=\"{0}\",", this.getEnabled());
        str += MessageFormat.format("Description=\"{0}\",", this.getDescription());
        str += MessageFormat.format("Version=\"{0}\",", this.getVersion());;
        return str;
                        
	}
}

