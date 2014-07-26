﻿/**
  * @ cqiyi create in 2014-7-26 20:28:04 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */

package hply.domain;

import hply.Utility;

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
	private static final long serialVersionUID = -5674412835889583799L;


	/*
	 * 默认构造函数
	 */
	public Information() {
		this.id = Utility.getRandomUUID();
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
      * [organization_id] getter，
      * 所在部门
      */
    	public String getOrganizationId () {
            return StringUtils.trimToEmpty(organizationId);
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
            return StringUtils.trimToEmpty(projectName);
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
            return StringUtils.trimToEmpty(address);
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
            return StringUtils.trimToEmpty(developer);
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
            return StringUtils.trimToEmpty(epcCorporation);
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
            return StringUtils.trimToEmpty(variety);
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
            return StringUtils.trimToEmpty(totalArea);
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
            return StringUtils.trimToEmpty(realName);
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
            return StringUtils.trimToEmpty(identification);
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
            return StringUtils.trimToEmpty(contact);
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
            return StringUtils.trimToEmpty(subscriber);
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
    		return trice;
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
        str += MessageFormat.format("OrganizationId=\"{0}\",", this.getOrganizationId());
        str += MessageFormat.format("ProjectName=\"{0}\",", this.getProjectName());
        str += MessageFormat.format("Address=\"{0}\",", this.getAddress());
        str += MessageFormat.format("Developer=\"{0}\",", this.getDeveloper());
        str += MessageFormat.format("EpcCorporation=\"{0}\",", this.getEpcCorporation());
        str += MessageFormat.format("Variety=\"{0}\",", this.getVariety());
        str += MessageFormat.format("TotalArea=\"{0}\",", this.getTotalArea());
        str += MessageFormat.format("RealName=\"{0}\",", this.getRealName());
        str += MessageFormat.format("Identification=\"{0}\",", this.getIdentification());
        str += MessageFormat.format("Contact=\"{0}\",", this.getContact());
        str += MessageFormat.format("Subscriber=\"{0}\",", this.getSubscriber());
        str += MessageFormat.format("Trice=\"{0}\",", this.getTrice());
        str += MessageFormat.format("CreateTime=\"{0}\",", this.getCreateTime());
        str += MessageFormat.format("CreateUser=\"{0}\",", this.getCreateUser());
        str += MessageFormat.format("UpdateTime=\"{0}\",", this.getUpdateTime());
        str += MessageFormat.format("UpdateUser=\"{0}\",", this.getUpdateUser());
        str += MessageFormat.format("Description=\"{0}\",", this.getDescription());
        str += MessageFormat.format("Version=\"{0}\",", this.getVersion());;
        return str;
                        
	}
}

