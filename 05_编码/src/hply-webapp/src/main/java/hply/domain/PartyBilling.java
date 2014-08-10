﻿/**
  * @ cqiyi create in 2014-8-10 20:36:07 by Template
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
  * 数据表： [t_party_billing]
  * 03_甲方开票情况
  */
public class PartyBilling implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7397537797408901096L;


	/*
	 * 默认构造函数
	 */
	public PartyBilling() {
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
      * [tax_rate]，
      * 税率
      */
      
      private double taxRate;
      
    /**
      * [tax_amount]，
      * 应收税金
      */
      
      private double taxAmount;
      
    /**
      * [step1_idea]，
      * 审核意见
      */
      
      private String step1Idea;
      
    /**
      * [step1_user]，
      * 审核人
      */
      
      private String step1User;
      
    /**
      * [step1_time]，
      * 审核时间
      */
      @DateTimeFormat(iso=ISO.DATE)
      private Date step1Time;
      
    /**
      * [step_status]，
      * 流程状态
      */
      
      private String stepStatus;
      
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
      * [tax_rate] getter，
      * 税率
      */
    	public double getTaxRate () {
    		return this.taxRate;
    	}

    /**
      * [tax_rate] setter，
      * 税率
      */
    	public void setTaxRate(double taxRate) {
    		this.taxRate = taxRate;
    	}
    /**
      * [tax_amount] getter，
      * 应收税金
      */
    	public double getTaxAmount () {
    		return this.taxAmount;
    	}

    /**
      * [tax_amount] setter，
      * 应收税金
      */
    	public void setTaxAmount(double taxAmount) {
    		this.taxAmount = taxAmount;
    	}
    /**
      * [step1_idea] getter，
      * 审核意见
      */
    	public String getStep1Idea () {
    		return this.step1Idea;
    	}

    /**
      * [step1_idea] setter，
      * 审核意见
      */
    	public void setStep1Idea(String step1Idea) {
    		this.step1Idea = step1Idea;
    	}
    /**
      * [step1_user] getter，
      * 审核人
      */
    	public String getStep1User () {
    		return this.step1User;
    	}

    /**
      * [step1_user] setter，
      * 审核人
      */
    	public void setStep1User(String step1User) {
    		this.step1User = step1User;
    	}
    /**
      * [step1_time] getter，
      * 审核时间
      */
    	public Date getStep1Time () {
    		return this.step1Time;
    	}

    /**
      * [step1_time] setter，
      * 审核时间
      */
    	public void setStep1Time(Date step1Time) {
    		this.step1Time = step1Time;
    	}
    /**
      * [step_status] getter，
      * 流程状态
      */
    	public String getStepStatus () {
    		return this.stepStatus;
    	}

    /**
      * [step_status] setter，
      * 流程状态
      */
    	public void setStepStatus(String stepStatus) {
    		this.stepStatus = stepStatus;
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
        str += MessageFormat.format("Amount=\"{0}\",", this.getAmount());
        str += MessageFormat.format("Trice=\"{0}\",", this.getTrice());
        str += MessageFormat.format("TaxRate=\"{0}\",", this.getTaxRate());
        str += MessageFormat.format("TaxAmount=\"{0}\",", this.getTaxAmount());
        str += MessageFormat.format("Step1Idea=\"{0}\",", StringUtils.trimToEmpty(this.getStep1Idea()));
        str += MessageFormat.format("Step1User=\"{0}\",", StringUtils.trimToEmpty(this.getStep1User()));
        str += MessageFormat.format("Step1Time=\"{0}\",", this.getStep1Time());
        str += MessageFormat.format("StepStatus=\"{0}\",", StringUtils.trimToEmpty(this.getStepStatus()));
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

