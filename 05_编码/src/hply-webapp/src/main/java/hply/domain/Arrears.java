﻿/**
  * @ cqiyi create in 2014-8-9 21:56:34 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */

package hply.domain;

import java.io.Serializable;
import java.text.MessageFormat;
import java.util.Date;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import hply.core.Utility;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
  * 数据表： [t_arrears]
  * 07_往来欠款
  */
public class Arrears implements Serializable {

	/*
	 * 默认构造函数
	 */
	public Arrears() {
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
      * [funds_using]，
      * 资金使用方
      */
      
      private String fundsUsing;
      
    /**
      * [arrears_type]，
      * 欠款分类
      */
      
      private String arrearsType;
      
    /**
      * [pay_type]，
      * 支付方式
      */
      
      private String payType;
      
    /**
      * [amount]，
      * 金额
      */
      
      private double amount;
      
    /**
      * [interest_amount]，
      * 利息额
      */
      
      private double interestAmount;
      
    /**
      * [interest_rate]，
      * 利率
      */
      
      private double interestRate;
      
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
      * [arrears_code]，
      * 凭证号
      */
      
      private String arrearsCode;
      
    
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
      * [funds_using] getter，
      * 资金使用方
      */
    	public String getFundsUsing () {
    		return this.fundsUsing;
    	}

    /**
      * [funds_using] setter，
      * 资金使用方
      */
    	public void setFundsUsing(String fundsUsing) {
    		this.fundsUsing = fundsUsing;
    	}
    /**
      * [arrears_type] getter，
      * 欠款分类
      */
    	public String getArrearsType () {
    		return this.arrearsType;
    	}

    /**
      * [arrears_type] setter，
      * 欠款分类
      */
    	public void setArrearsType(String arrearsType) {
    		this.arrearsType = arrearsType;
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
      * [amount] getter，
      * 金额
      */
    	public double getAmount () {
    		return this.amount;
    	}

    /**
      * [amount] setter，
      * 金额
      */
    	public void setAmount(double amount) {
    		this.amount = amount;
    	}
    /**
      * [interest_amount] getter，
      * 利息额
      */
    	public double getInterestAmount () {
    		return this.interestAmount;
    	}

    /**
      * [interest_amount] setter，
      * 利息额
      */
    	public void setInterestAmount(double interestAmount) {
    		this.interestAmount = interestAmount;
    	}
    /**
      * [interest_rate] getter，
      * 利率
      */
    	public double getInterestRate () {
    		return this.interestRate;
    	}

    /**
      * [interest_rate] setter，
      * 利率
      */
    	public void setInterestRate(double interestRate) {
    		this.interestRate = interestRate;
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
    /**
      * [arrears_code] getter，
      * 凭证号
      */
    	public String getArrearsCode () {
    		return this.arrearsCode;
    	}

    /**
      * [arrears_code] setter，
      * 凭证号
      */
    	public void setArrearsCode(String arrearsCode) {
    		this.arrearsCode = arrearsCode;
    	}
    
	@Override
	public String toString() {
		System.out.println(this.getClass().getName() + ".toString():");
        
        String str = StringUtils.EMPTY;
        str += MessageFormat.format("Id=\"{0}\",", StringUtils.trimToEmpty(this.getId()));
        str += MessageFormat.format("ProjectId=\"{0}\",", StringUtils.trimToEmpty(this.getProjectId()));
        str += MessageFormat.format("FundsUsing=\"{0}\",", StringUtils.trimToEmpty(this.getFundsUsing()));
        str += MessageFormat.format("ArrearsType=\"{0}\",", StringUtils.trimToEmpty(this.getArrearsType()));
        str += MessageFormat.format("PayType=\"{0}\",", StringUtils.trimToEmpty(this.getPayType()));
        str += MessageFormat.format("Amount=\"{0}\",", this.getAmount());
        str += MessageFormat.format("InterestAmount=\"{0}\",", this.getInterestAmount());
        str += MessageFormat.format("InterestRate=\"{0}\",", this.getInterestRate());
        str += MessageFormat.format("BankAccount=\"{0}\",", StringUtils.trimToEmpty(this.getBankAccount()));
        str += MessageFormat.format("BankName=\"{0}\",", StringUtils.trimToEmpty(this.getBankName()));
        str += MessageFormat.format("Trice=\"{0}\",", this.getTrice());
        str += MessageFormat.format("CreateTime=\"{0}\",", this.getCreateTime());
        str += MessageFormat.format("CreateUser=\"{0}\",", StringUtils.trimToEmpty(this.getCreateUser()));
        str += MessageFormat.format("UpdateTime=\"{0}\",", this.getUpdateTime());
        str += MessageFormat.format("UpdateUser=\"{0}\",", StringUtils.trimToEmpty(this.getUpdateUser()));
        str += MessageFormat.format("Description=\"{0}\",", StringUtils.trimToEmpty(this.getDescription()));
        str += MessageFormat.format("Version=\"{0}\",", this.getVersion());
        str += MessageFormat.format("Status=\"{0}\",", this.getStatus());
        str += MessageFormat.format("ArrearsCode=\"{0}\",", StringUtils.trimToEmpty(this.getArrearsCode()));;
        return str;
                        
	}
}

