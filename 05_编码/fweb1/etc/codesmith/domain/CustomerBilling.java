﻿/**
  * @ cqiyi create in 2014/7/17 20:31:31 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */

package org.hhwy.rdc.fweb1.domain;

import java.io.Serializable;
import java.text.MessageFormat;
import java.util.Date;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.hhwy.rdc.fweb1.Utility;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
  * 数据表： [t_customer_billing]
  * 04_客户开票情况
  */
public class CustomerBilling implements Serializable {

	/*
	 * 默认构造函数
	 */
	public CustomerBilling() {
		this.id = Utility.getRandomUUID();
        
        //设定日期为空时的初始值
        this.trice = new Date(0);this.createTime = new Date(0);this.updateTime = new Date(0);
	}

    /**
      * [id]，
      * ID
      */
      
      @NotNull
      
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
      
      @NotNull
      
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
      * [project_id] getter，
      * 项目ID
      */
    	public String getProjectId () {
            return StringUtils.trimToEmpty(projectId);
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
            return StringUtils.trimToEmpty(invoiceCode);
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
            return StringUtils.trimToEmpty(invoiceType);
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
    		return amount;
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
    		return trice;
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
        str += MessageFormat.format("ProjectId=\"{0}\",", this.getProjectId());
        str += MessageFormat.format("InvoiceCode=\"{0}\",", this.getInvoiceCode());
        str += MessageFormat.format("InvoiceType=\"{0}\",", this.getInvoiceType());
        str += MessageFormat.format("Amount=\"{0}\",", this.getAmount());
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

