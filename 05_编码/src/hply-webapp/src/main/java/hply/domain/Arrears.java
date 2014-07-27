﻿/**
  * @ cqiyi create in 2014-7-26 20:28:04 by Template
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
  * 数据表： [t_arrears]
  * 07_往来欠款
  */
public class Arrears implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7056273594215699647L;


	/*
	 * 默认构造函数
	 */
	public Arrears() {
		this.id = Utility.getRandomUUID();
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
      * [funds_using] getter，
      * 资金使用方
      */
    	public String getFundsUsing () {
            return StringUtils.trimToEmpty(fundsUsing);
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
            return StringUtils.trimToEmpty(arrearsType);
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
            return StringUtils.trimToEmpty(payType);
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
    		return amount;
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
    		return interestAmount;
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
    		return interestRate;
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
            return StringUtils.trimToEmpty(bankAccount);
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
            return StringUtils.trimToEmpty(bankName);
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
        str += MessageFormat.format("ProjectId=\"{0}\",", this.getProjectId());
        str += MessageFormat.format("FundsUsing=\"{0}\",", this.getFundsUsing());
        str += MessageFormat.format("ArrearsType=\"{0}\",", this.getArrearsType());
        str += MessageFormat.format("PayType=\"{0}\",", this.getPayType());
        str += MessageFormat.format("Amount=\"{0}\",", this.getAmount());
        str += MessageFormat.format("InterestAmount=\"{0}\",", this.getInterestAmount());
        str += MessageFormat.format("InterestRate=\"{0}\",", this.getInterestRate());
        str += MessageFormat.format("BankAccount=\"{0}\",", this.getBankAccount());
        str += MessageFormat.format("BankName=\"{0}\",", this.getBankName());
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

