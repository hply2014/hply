﻿/**
  * @ cqiyi create in 2014/7/24 22:26:28 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */

package hply.domain;

import hply.Utility;

import java.io.Serializable;
import java.text.MessageFormat;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;

/**
  * 数据表： [t_sys_resource]
  * 
  */
public class SysResource implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2003673521250696137L;


	/*
	 * 默认构造函数
	 */
	public SysResource() {
		this.id = Utility.getRandomUUID();
        this.version = -1;
	}

    /**
      * [id]，
      * 
      */
      
      @NotNull
      
      private String id;
      
    /**
      * [res_code]，
      * 
      */
      
      
      
      private String resCode;
      
    /**
      * [res_name]，
      * 
      */
      
      
      
      private String resName;
      
    /**
      * [icon]，
      * 
      */
      
      
      
      private String icon;
      
    /**
      * [res_url]，
      * 
      */
      
      
      
      private String resUrl;
      
    /**
      * [res_type]，
      * 
      */
      
      
      
      private String resType;
      
    /**
      * [order_by]，
      * 
      */
      
      
      
      private int orderBy;
      
    /**
      * [parent_id]，
      * 
      */
      
      
      
      private String parentId;
      
    /**
      * [enabled]，
      * 
      */
      
      
      
      private int enabled;
      
    /**
      * [description]，
      * 
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
      * 
      */
    	public String getId () {
            return StringUtils.trimToEmpty(id);
    	}

    /**
      * [id] setter，
      * 
      */
    	public void setId(String id) {
    		this.id = id;
    	}
    /**
      * [res_code] getter，
      * 
      */
    	public String getResCode () {
            return StringUtils.trimToEmpty(resCode);
    	}

    /**
      * [res_code] setter，
      * 
      */
    	public void setResCode(String resCode) {
    		this.resCode = resCode;
    	}
    /**
      * [res_name] getter，
      * 
      */
    	public String getResName () {
            return StringUtils.trimToEmpty(resName);
    	}

    /**
      * [res_name] setter，
      * 
      */
    	public void setResName(String resName) {
    		this.resName = resName;
    	}
    /**
      * [icon] getter，
      * 
      */
    	public String getIcon () {
            return StringUtils.trimToEmpty(icon);
    	}

    /**
      * [icon] setter，
      * 
      */
    	public void setIcon(String icon) {
    		this.icon = icon;
    	}
    /**
      * [res_url] getter，
      * 
      */
    	public String getResUrl () {
            return StringUtils.trimToEmpty(resUrl);
    	}

    /**
      * [res_url] setter，
      * 
      */
    	public void setResUrl(String resUrl) {
    		this.resUrl = resUrl;
    	}
    /**
      * [res_type] getter，
      * 
      */
    	public String getResType () {
            return StringUtils.trimToEmpty(resType);
    	}

    /**
      * [res_type] setter，
      * 
      */
    	public void setResType(String resType) {
    		this.resType = resType;
    	}
    /**
      * [order_by] getter，
      * 
      */
    	public int getOrderBy () {
    		return orderBy;
    	}

    /**
      * [order_by] setter，
      * 
      */
    	public void setOrderBy(int orderBy) {
    		this.orderBy = orderBy;
    	}
    /**
      * [parent_id] getter，
      * 
      */
    	public String getParentId () {
            return StringUtils.trimToEmpty(parentId);
    	}

    /**
      * [parent_id] setter，
      * 
      */
    	public void setParentId(String parentId) {
    		this.parentId = parentId;
    	}
    /**
      * [enabled] getter，
      * 
      */
    	public int getEnabled () {
    		return enabled;
    	}

    /**
      * [enabled] setter，
      * 
      */
    	public void setEnabled(int enabled) {
    		this.enabled = enabled;
    	}
    /**
      * [description] getter，
      * 
      */
    	public String getDescription () {
            return StringUtils.trimToEmpty(description);
    	}

    /**
      * [description] setter，
      * 
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

