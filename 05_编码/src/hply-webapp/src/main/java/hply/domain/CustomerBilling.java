﻿/**
  * @ cqiyi create in 2014-8-4 20:27:37 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */

package hply.domain;

import java.io.Serializable;
import java.text.MessageFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

import hply.core.SessionHelper;
import hply.core.Utility;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
  * 数据表： [t_customer_billing]
  * 04_客户开票情况
  */
public class CustomerBilling implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5844325232975400456L;


	/*
	 * 默认构造函数
	 */
	public CustomerBilling() {
		this.id = Utility.getRandomUUID();
        this.version = -1;
        this.trice = new Date();
        this.createUser = SessionHelper.getCurrentSysUser().getId();
	}

    /**
      * [id]，
      * ID
      */
      
      private String id;
      
    /**
      * [project_id]，
      * 项目ID
      */
      
      private String projectId;
      
    /**
      * [invoice_code]，
      * 发票票号
      */
      
      private String invoiceCode;
      
    /**
      * [invoice_type]，
      * 发票类别
      */
      
      private String invoiceType;
      
    /**
      * [amount]，
      * 发票金额
      */
      
      private double amount;
      
    /**
      * [trice]，
      * 开票时间
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
      * [project_id] getter，
      * 项目ID
      */
    	public String getProjectId () {
    		return this.projectId;
    	}

    /**
      * [project_id] setter，
      * 项目ID
      */
    	public void setProjectId(String projectId) {
    		this.projectId = projectId;
    	}
    /**
      * [invoice_code] getter，
      * 发票票号
      */
    	public String getInvoiceCode () {
    		return this.invoiceCode;
    	}

    /**
      * [invoice_code] setter，
      * 发票票号
      */
    	public void setInvoiceCode(String invoiceCode) {
    		this.invoiceCode = invoiceCode;
    	}
    /**
      * [invoice_type] getter，
      * 发票类别
      */
    	public String getInvoiceType () {
    		return this.invoiceType;
    	}

    /**
      * [invoice_type] setter，
      * 发票类别
      */
    	public void setInvoiceType(String invoiceType) {
    		this.invoiceType = invoiceType;
    	}
    /**
      * [amount] getter，
      * 发票金额
      */
    	public double getAmount () {
    		return this.amount;
    	}

    /**
      * [amount] setter，
      * 发票金额
      */
    	public void setAmount(double amount) {
    		this.amount = amount;
    	}
    /**
      * [trice] getter，
      * 开票时间
      */
    	public Date getTrice () {
    		return this.trice;
    	}

    /**
      * [trice] setter，
      * 开票时间
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
		System.out.println(this.getClass().getName() + ".toString():");
        
        String str = StringUtils.EMPTY;
        str += MessageFormat.format("Id=\"{0}\",", StringUtils.trimToEmpty(this.getId()));
        str += MessageFormat.format("ProjectId=\"{0}\",", StringUtils.trimToEmpty(this.getProjectId()));
        str += MessageFormat.format("InvoiceCode=\"{0}\",", StringUtils.trimToEmpty(this.getInvoiceCode()));
        str += MessageFormat.format("InvoiceType=\"{0}\",", StringUtils.trimToEmpty(this.getInvoiceType()));
        str += MessageFormat.format("Amount=\"{0}\",", this.getAmount());
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

