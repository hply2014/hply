﻿/**
  * @ cqiyi create in 2014-8-25 23:07:45 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */

package hply.domain;

import hply.core.Utility;

import java.io.Serializable;
import java.text.MessageFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
  * 数据表： [t_information]
  * 10_信息登记
  */
public class Information implements Serializable {
    
    	/**
	 * 
	 */
	private static final long serialVersionUID = 8901953416252768409L;
		/*
    	 * ID
    	 */
        public static final String FIELD_ID = "id";
    	/*
    	 * 所在部门
    	 */
        public static final String FIELD_ORGANIZATION_ID = "organization_id";
    	/*
    	 * 项目名称
    	 */
        public static final String FIELD_PROJECT_NAME = "project_name";
    	/*
    	 * 地址
    	 */
        public static final String FIELD_ADDRESS = "address";
    	/*
    	 * 开发商
    	 */
        public static final String FIELD_DEVELOPER = "developer";
    	/*
    	 * 总包单位
    	 */
        public static final String FIELD_EPC_CORPORATION = "epc_corporation";
    	/*
    	 * 品种
    	 */
        public static final String FIELD_VARIETY = "variety";
    	/*
    	 * 总面积
    	 */
        public static final String FIELD_TOTAL_AREA = "total_area";
    	/*
    	 * 姓名
    	 */
        public static final String FIELD_REAL_NAME = "real_name";
    	/*
    	 * 身份证号
    	 */
        public static final String FIELD_IDENTIFICATION = "identification";
    	/*
    	 * 联系方式
    	 */
        public static final String FIELD_CONTACT = "contact";
    	/*
    	 * 登记人
    	 */
        public static final String FIELD_SUBSCRIBER = "subscriber";
    	/*
    	 * 登记时间
    	 */
        public static final String FIELD_TRICE = "trice";
    	/*
    	 * 创建时间
    	 */
        public static final String FIELD_CREATE_TIME = "create_time";
    	/*
    	 * 创建用户
    	 */
        public static final String FIELD_CREATE_USER = "create_user";
    	/*
    	 * 修改时间
    	 */
        public static final String FIELD_UPDATE_TIME = "update_time";
    	/*
    	 * 修改用户
    	 */
        public static final String FIELD_UPDATE_USER = "update_user";
    	/*
    	 * 备注
    	 */
        public static final String FIELD_DESCRIPTION = "description";
    	/*
    	 * 
    	 */
        public static final String FIELD_VERSION = "version";
    	/*
    	 * 数据状态，0：草稿/1：正式
    	 */
        public static final String FIELD_STATUS = "status";

	/*
	 * 默认构造函数
	 */
	public Information() {
		this.id = Utility.getRandomUUID(); 
        this.trice = new Date(); 
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
      * [organization_id]，
      * 所在部门
      */
      
      private String organizationId;
      
    /**
      * [project_name]，
      * 项目名称
      */
      
      private String projectName;
      
    /**
      * [address]，
      * 地址
      */
      
      private String address;
      
    /**
      * [developer]，
      * 开发商
      */
      
      private String developer;
      
    /**
      * [epc_corporation]，
      * 总包单位
      */
      
      private String epcCorporation;
      
    /**
      * [variety]，
      * 品种
      */
      
      private String variety;
      
    /**
      * [total_area]，
      * 总面积
      */
      
      private String totalArea;
      
    /**
      * [real_name]，
      * 姓名
      */
      
      private String realName;
      
    /**
      * [identification]，
      * 身份证号
      */
      
      private String identification;
      
    /**
      * [contact]，
      * 联系方式
      */
      
      private String contact;
      
    /**
      * [subscriber]，
      * 登记人
      */
      
      private String subscriber;
      
    /**
      * [trice]，
      * 登记时间
      */
      @DateTimeFormat(iso=ISO.DATE)
      private Date trice;
      
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
      
      private Integer version;
      
    /**
      * [status]，
      * 数据状态，0：草稿/1：正式
      */
      
      private Integer status;
      
    
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
      * [organization_id] getter，
      * 所在部门
      */
    	public String getOrganizationId () {
    		return this.organizationId;
    	}

    /**
      * [organization_id] setter，
      * 所在部门
      */
    	public void setOrganizationId(String organizationId) {
    		this.organizationId = organizationId;
    	}
    /**
      * [project_name] getter，
      * 项目名称
      */
    	public String getProjectName () {
    		return this.projectName;
    	}

    /**
      * [project_name] setter，
      * 项目名称
      */
    	public void setProjectName(String projectName) {
    		this.projectName = projectName;
    	}
    /**
      * [address] getter，
      * 地址
      */
    	public String getAddress () {
    		return this.address;
    	}

    /**
      * [address] setter，
      * 地址
      */
    	public void setAddress(String address) {
    		this.address = address;
    	}
    /**
      * [developer] getter，
      * 开发商
      */
    	public String getDeveloper () {
    		return this.developer;
    	}

    /**
      * [developer] setter，
      * 开发商
      */
    	public void setDeveloper(String developer) {
    		this.developer = developer;
    	}
    /**
      * [epc_corporation] getter，
      * 总包单位
      */
    	public String getEpcCorporation () {
    		return this.epcCorporation;
    	}

    /**
      * [epc_corporation] setter，
      * 总包单位
      */
    	public void setEpcCorporation(String epcCorporation) {
    		this.epcCorporation = epcCorporation;
    	}
    /**
      * [variety] getter，
      * 品种
      */
    	public String getVariety () {
    		return this.variety;
    	}

    /**
      * [variety] setter，
      * 品种
      */
    	public void setVariety(String variety) {
    		this.variety = variety;
    	}
    /**
      * [total_area] getter，
      * 总面积
      */
    	public String getTotalArea () {
    		return this.totalArea;
    	}

    /**
      * [total_area] setter，
      * 总面积
      */
    	public void setTotalArea(String totalArea) {
    		this.totalArea = totalArea;
    	}
    /**
      * [real_name] getter，
      * 姓名
      */
    	public String getRealName () {
    		return this.realName;
    	}

    /**
      * [real_name] setter，
      * 姓名
      */
    	public void setRealName(String realName) {
    		this.realName = realName;
    	}
    /**
      * [identification] getter，
      * 身份证号
      */
    	public String getIdentification () {
    		return this.identification;
    	}

    /**
      * [identification] setter，
      * 身份证号
      */
    	public void setIdentification(String identification) {
    		this.identification = identification;
    	}
    /**
      * [contact] getter，
      * 联系方式
      */
    	public String getContact () {
    		return this.contact;
    	}

    /**
      * [contact] setter，
      * 联系方式
      */
    	public void setContact(String contact) {
    		this.contact = contact;
    	}
    /**
      * [subscriber] getter，
      * 登记人
      */
    	public String getSubscriber () {
    		return this.subscriber;
    	}

    /**
      * [subscriber] setter，
      * 登记人
      */
    	public void setSubscriber(String subscriber) {
    		this.subscriber = subscriber;
    	}
    /**
      * [trice] getter，
      * 登记时间
      */
    	public Date getTrice () {
    		return this.trice;
    	}

    /**
      * [trice] setter，
      * 登记时间
      */
    	public void setTrice(Date trice) {
    		this.trice = trice;
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
      * [update_time] getter，
      * 修改时间
      */
    	public Date getUpdateTime () {
    		return this.updateTime;
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
    		return this.updateUser;
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
    		return this.description;
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
    /**
      * [status] getter，
      * 数据状态，0：草稿/1：正式
      */
    	public Integer getStatus () {
    		return this.status;
    	}

    /**
      * [status] setter，
      * 数据状态，0：草稿/1：正式
      */
    	public void setStatus(Integer status) {
    		this.status = status;
    	}
    
	@Override
	public String toString() {
		Utility.println(this.getClass().getName() + ".toString():");
        
        String str = StringUtils.EMPTY;
        str += MessageFormat.format("Id=\"{0}\",", StringUtils.trimToEmpty(this.getId()));
        str += MessageFormat.format("OrganizationId=\"{0}\",", StringUtils.trimToEmpty(this.getOrganizationId()));
        str += MessageFormat.format("ProjectName=\"{0}\",", StringUtils.trimToEmpty(this.getProjectName()));
        str += MessageFormat.format("Address=\"{0}\",", StringUtils.trimToEmpty(this.getAddress()));
        str += MessageFormat.format("Developer=\"{0}\",", StringUtils.trimToEmpty(this.getDeveloper()));
        str += MessageFormat.format("EpcCorporation=\"{0}\",", StringUtils.trimToEmpty(this.getEpcCorporation()));
        str += MessageFormat.format("Variety=\"{0}\",", StringUtils.trimToEmpty(this.getVariety()));
        str += MessageFormat.format("TotalArea=\"{0}\",", StringUtils.trimToEmpty(this.getTotalArea()));
        str += MessageFormat.format("RealName=\"{0}\",", StringUtils.trimToEmpty(this.getRealName()));
        str += MessageFormat.format("Identification=\"{0}\",", StringUtils.trimToEmpty(this.getIdentification()));
        str += MessageFormat.format("Contact=\"{0}\",", StringUtils.trimToEmpty(this.getContact()));
        str += MessageFormat.format("Subscriber=\"{0}\",", StringUtils.trimToEmpty(this.getSubscriber()));
        str += MessageFormat.format("Trice=\"{0}\",", this.getTrice());
        str += MessageFormat.format("CreateTime=\"{0}\",", this.getCreateTime());
        str += MessageFormat.format("CreateUser=\"{0}\",", StringUtils.trimToEmpty(this.getCreateUser()));
        str += MessageFormat.format("UpdateTime=\"{0}\",", this.getUpdateTime());
        str += MessageFormat.format("UpdateUser=\"{0}\",", StringUtils.trimToEmpty(this.getUpdateUser()));
        str += MessageFormat.format("Description=\"{0}\",", StringUtils.trimToEmpty(this.getDescription()));
        str += MessageFormat.format("Version=\"{0}\",", this.getVersion());
        str += MessageFormat.format("Status=\"{0}\",", this.getStatus());;
        return str;
                        
	}
}

