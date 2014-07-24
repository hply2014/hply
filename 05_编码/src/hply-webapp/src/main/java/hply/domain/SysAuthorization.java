﻿/**
  * @ cqiyi create in 2014/7/24 21:26:49 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */

package hply.domain;

import hply.Utility;

import java.io.Serializable;
import java.text.MessageFormat;
import java.util.Date;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
  * 数据表： [t_sys_authorization]
  * 
  */
public class SysAuthorization implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5031542387812731163L;


	/*
	 * 默认构造函数
	 */
	public SysAuthorization() {
        this.version = -1;
		this.id = Utility.getRandomUUID();
        
        //设定日期为空时的初始值
        this.createTime = new Date(0);
	}

    /**
      * [id]，
      * 
      */
      
      @NotNull
      
      private String id;
      
    /**
      * [resource_id]，
      * 
      */
      
      
      
      private String resourceId;
      
    /**
      * [user_id]，
      * 
      */
      
      
      
      private String userId;
      
    /**
      * [create_time]，
      * 
      */
      
      
      @DateTimeFormat(iso=ISO.DATE)
      private Date createTime;
      
    /**
      * [create_user]，
      * 
      */
      
      
      
      private String createUser;
      
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
      * [resource_id] getter，
      * 
      */
    	public String getResourceId () {
            return StringUtils.trimToEmpty(resourceId);
    	}

    /**
      * [resource_id] setter，
      * 
      */
    	public void setResourceId(String resourceId) {
    		this.resourceId = resourceId;
    	}
    /**
      * [user_id] getter，
      * 
      */
    	public String getUserId () {
            return StringUtils.trimToEmpty(userId);
    	}

    /**
      * [user_id] setter，
      * 
      */
    	public void setUserId(String userId) {
    		this.userId = userId;
    	}
    /**
      * [create_time] getter，
      * 
      */
    	public Date getCreateTime () {
    		return createTime;
    	}

    /**
      * [create_time] setter，
      * 
      */
    	public void setCreateTime(Date createTime) {
    		this.createTime = createTime;
    	}
    /**
      * [create_user] getter，
      * 
      */
    	public String getCreateUser () {
            return StringUtils.trimToEmpty(createUser);
    	}

    /**
      * [create_user] setter，
      * 
      */
    	public void setCreateUser(String createUser) {
    		this.createUser = createUser;
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
        str += MessageFormat.format("ResourceId=\"{0}\",", this.getResourceId());
        str += MessageFormat.format("UserId=\"{0}\",", this.getUserId());
        str += MessageFormat.format("CreateTime=\"{0}\",", this.getCreateTime());
        str += MessageFormat.format("CreateUser=\"{0}\",", this.getCreateUser());
        str += MessageFormat.format("Version=\"{0}\",", this.getVersion());;
        return str;
                        
	}
}

