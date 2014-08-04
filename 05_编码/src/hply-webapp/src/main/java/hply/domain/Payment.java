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
  * 数据表： [t_payment]
  * 06_付款情况
  */
public class Payment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5919209459329213501L;


	/*
	 * 默认构造函数
	 */
	public Payment() {
		this.id = Utility.getRandomUUID();
        this.version = -1;
        this.trice = new Date();
        this.createUser = SessionHelper.getCurrentSysUser().getId();
        this.status = 0;
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
      * [ticket_code]，
      * 凭证号
      */
      
      private String ticketCode;
      
    /**
      * [pay_type]，
      * 支付方式
      */
      
      private String payType;
      
    /**
      * [payment_item_id]，
      * 付款科目ID
      */
      
      private String paymentItemId;
      
    /**
      * [amount]，
      * 付款金额
      */
      
      private Double amount;
      
    /**
      * [bank_account]，
      * 银行账号
      */
      
      private String bankAccount;
      
    /**
      * [bank_name]，
      * 开户行名称
      */
      
      private String bankName;
      
    /**
      * [trice]，
      * 付款时间
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
      * [ticket_code] getter，
      * 凭证号
      */
    	public String getTicketCode () {
    		return this.ticketCode;
    	}

    /**
      * [ticket_code] setter，
      * 凭证号
      */
    	public void setTicketCode(String ticketCode) {
    		this.ticketCode = ticketCode;
    	}
    /**
      * [pay_type] getter，
      * 支付方式
      */
    	public String getPayType () {
    		return this.payType;
    	}

    /**
      * [pay_type] setter，
      * 支付方式
      */
    	public void setPayType(String payType) {
    		this.payType = payType;
    	}
    /**
      * [payment_item_id] getter，
      * 付款科目ID
      */
    	public String getPaymentItemId () {
    		return this.paymentItemId;
    	}

    /**
      * [payment_item_id] setter，
      * 付款科目ID
      */
    	public void setPaymentItemId(String paymentItemId) {
    		this.paymentItemId = paymentItemId;
    	}
    /**
      * [amount] getter，
      * 付款金额
      */
    	public Double getAmount () {
    		return this.amount;
    	}

    /**
      * [amount] setter，
      * 付款金额
      */
    	public void setAmount(Double amount) {
    		this.amount = amount;
    	}
    /**
      * [bank_account] getter，
      * 银行账号
      */
    	public String getBankAccount () {
    		return this.bankAccount;
    	}

    /**
      * [bank_account] setter，
      * 银行账号
      */
    	public void setBankAccount(String bankAccount) {
    		this.bankAccount = bankAccount;
    	}
    /**
      * [bank_name] getter，
      * 开户行名称
      */
    	public String getBankName () {
    		return this.bankName;
    	}

    /**
      * [bank_name] setter，
      * 开户行名称
      */
    	public void setBankName(String bankName) {
    		this.bankName = bankName;
    	}
    /**
      * [trice] getter，
      * 付款时间
      */
    	public Date getTrice () {
    		return this.trice;
    	}

    /**
      * [trice] setter，
      * 付款时间
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
        str += MessageFormat.format("TicketCode=\"{0}\",", StringUtils.trimToEmpty(this.getTicketCode()));
        str += MessageFormat.format("PayType=\"{0}\",", StringUtils.trimToEmpty(this.getPayType()));
        str += MessageFormat.format("PaymentItemId=\"{0}\",", StringUtils.trimToEmpty(this.getPaymentItemId()));
        str += MessageFormat.format("Amount=\"{0}\",", this.getAmount());
        str += MessageFormat.format("BankAccount=\"{0}\",", StringUtils.trimToEmpty(this.getBankAccount()));
        str += MessageFormat.format("BankName=\"{0}\",", StringUtils.trimToEmpty(this.getBankName()));
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

