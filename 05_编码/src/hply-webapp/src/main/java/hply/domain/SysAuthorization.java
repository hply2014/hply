﻿/**
  * @ cqiyi create in 2014-8-25 23:07:45 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */

package hply.domain;

import java.io.Serializable;
import java.text.MessageFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import hply.core.Utility;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
  * 数据表： [t_sys_authorization]
  * 13_授权关系
  */
public class SysAuthorization implements Serializable {
    
    	/**
	 * 
	 */
	private static final long serialVersionUID = 2308948247297831063L;
		/*
    	 * ID
    	 */
        public static final String FIELD_ID = "id";
    	/*
    	 * 资源ID
    	 */
        public static final String FIELD_RESOURCE_ID = "resource_id";
    	/*
    	 * 用户ID
    	 */
        public static final String FIELD_USER_ID = "user_id";
    	/*
    	 * 创建时间
    	 */
        public static final String FIELD_CREATE_TIME = "create_time";
    	/*
    	 * 创建用户
    	 */
        public static final String FIELD_CREATE_USER = "create_user";
    	/*
    	 * 
    	 */
        public static final String FIELD_VERSION = "version";

	/*
	 * 默认构造函数
	 */
	public SysAuthorization() {
		this.id = Utility.getRandomUUID(); 
        this.createTime = new Date(); 
		this.createUser = Utility.getCurrentUserId(); 
        this.version = -1; 
	}

    /**
      * [id]，
      * ID
      */
      
      private String id;
      
    /**
      * [resource_id]，
      * 资源ID
      */
      
      private String resourceId;
      
    /**
      * [user_id]，
      * 用户ID
      */
      
      private String userId;
      
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
      * [version]，
      * 
      */
      
      private Integer version;
      
    
    /**
      * [id] getter，
      * ID
      */
    	public String getId () {
    		return this.id;
    	}

    /**
      * [id] setter，
      * ID
      */
    	public void setId(String id) {
    		this.id = id;
    	}
    /**
      * [resource_id] getter，
      * 资源ID
      */
    	public String getResourceId () {
    		return this.resourceId;
    	}

    /**
      * [resource_id] setter，
      * 资源ID
      */
    	public void setResourceId(String resourceId) {
    		this.resourceId = resourceId;
    	}
    /**
      * [user_id] getter，
      * 用户ID
      */
    	public String getUserId () {
    		return this.userId;
    	}

    /**
      * [user_id] setter，
      * 用户ID
      */
    	public void setUserId(String userId) {
    		this.userId = userId;
    	}
    /**
      * [create_time] getter，
      * 创建时间
      */
    	public Date getCreateTime () {
    		return this.createTime;
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
    		return this.createUser;
    	}

    /**
      * [create_user] setter，
      * 创建用户
      */
    	public void setCreateUser(String createUser) {
    		this.createUser = createUser;
    	}
    /**
      * [version] getter，
      * 
      */
    	public Integer getVersion () {
    		return this.version;
    	}

    /**
      * [version] setter，
      * 
      */
    	public void setVersion(Integer version) {
    		this.version = version;
    	}
    
	@Override
	public String toString() {
		System.out.println(this.getClass().getName() + ".toString():");
        
        String str = StringUtils.EMPTY;
        str += MessageFormat.format("Id=\"{0}\",", StringUtils.trimToEmpty(this.getId()));
        str += MessageFormat.format("ResourceId=\"{0}\",", StringUtils.trimToEmpty(this.getResourceId()));
        str += MessageFormat.format("UserId=\"{0}\",", StringUtils.trimToEmpty(this.getUserId()));
        str += MessageFormat.format("CreateTime=\"{0}\",", this.getCreateTime());
        str += MessageFormat.format("CreateUser=\"{0}\",", StringUtils.trimToEmpty(this.getCreateUser()));
        str += MessageFormat.format("Version=\"{0}\",", this.getVersion());;
        return str;
                        
	}
}

