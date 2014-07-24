﻿/**
 * @ cqiyi create in 2014/7/24 20:49:20 by Template
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
 * 数据表： [t_collections]
 * 
 */
public class Collections implements Serializable {

	/*
	 * 默认构造函数
	 */
	public Collections() {
		this.id = Utility.getRandomUUID();
		this.version = -1;
	}

	/**
	 * [id]，
	 * 
	 */

	@NotNull
	private String id;

	/**
	 * [project_id]，
	 * 
	 */

	private String projectId;

	/**
	 * [ticket_code]，
	 * 
	 */

	private String ticketCode;

	/**
	 * [source_of]，
	 * 
	 */

	private String sourceOf;

	/**
	 * [payment_type]，
	 * 
	 */

	private String paymentType;

	/**
	 * [amount]，
	 * 
	 */

	@NotNull
	private double amount;

	/**
	 * [bank_account]，
	 * 
	 */

	private String bankAccount;

	/**
	 * [bank_name]，
	 * 
	 */

	private String bankName;

	/**
	 * [trice]，
	 * 
	 */

	@DateTimeFormat(iso = ISO.DATE)
	private Date trice;

	/**
	 * [create_time]，
	 * 
	 */

	@DateTimeFormat(iso = ISO.DATE)
	private Date createTime;

	/**
	 * [create_user]，
	 * 
	 */

	private String createUser;

	/**
	 * [update_time]，
	 * 
	 */

	@DateTimeFormat(iso = ISO.DATE)
	private Date updateTime;

	/**
	 * [update_user]，
	 * 
	 */

	private String updateUser;

	/**
	 * [description]，
	 * 
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
	 * 
	 */
	public String getId() {
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
	 * [project_id] getter，
	 * 
	 */
	public String getProjectId() {
		return StringUtils.trimToEmpty(projectId);
	}

	/**
	 * [project_id] setter，
	 * 
	 */
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	/**
	 * [ticket_code] getter，
	 * 
	 */
	public String getTicketCode() {
		return StringUtils.trimToEmpty(ticketCode);
	}

	/**
	 * [ticket_code] setter，
	 * 
	 */
	public void setTicketCode(String ticketCode) {
		this.ticketCode = ticketCode;
	}

	/**
	 * [source_of] getter，
	 * 
	 */
	public String getSourceOf() {
		return StringUtils.trimToEmpty(sourceOf);
	}

	/**
	 * [source_of] setter，
	 * 
	 */
	public void setSourceOf(String sourceOf) {
		this.sourceOf = sourceOf;
	}

	/**
	 * [payment_type] getter，
	 * 
	 */
	public String getPaymentType() {
		return StringUtils.trimToEmpty(paymentType);
	}

	/**
	 * [payment_type] setter，
	 * 
	 */
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	/**
	 * [amount] getter，
	 * 
	 */
	public double getAmount() {
		return amount;
	}

	/**
	 * [amount] setter，
	 * 
	 */
	public void setAmount(double amount) {
		this.amount = amount;
	}

	/**
	 * [bank_account] getter，
	 * 
	 */
	public String getBankAccount() {
		return StringUtils.trimToEmpty(bankAccount);
	}

	/**
	 * [bank_account] setter，
	 * 
	 */
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	/**
	 * [bank_name] getter，
	 * 
	 */
	public String getBankName() {
		return StringUtils.trimToEmpty(bankName);
	}

	/**
	 * [bank_name] setter，
	 * 
	 */
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	/**
	 * [trice] getter，
	 * 
	 */
	public Date getTrice() {
		return trice;
	}

	/**
	 * [trice] setter，
	 * 
	 */
	public void setTrice(Date trice) {
		this.trice = trice;
	}

	/**
	 * [create_time] getter，
	 * 
	 */
	public Date getCreateTime() {
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
	public String getCreateUser() {
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
	 * [update_time] getter，
	 * 
	 */
	public Date getUpdateTime() {
		return updateTime;
	}

	/**
	 * [update_time] setter，
	 * 
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * [update_user] getter，
	 * 
	 */
	public String getUpdateUser() {
		return StringUtils.trimToEmpty(updateUser);
	}

	/**
	 * [update_user] setter，
	 * 
	 */
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	/**
	 * [description] getter，
	 * 
	 */
	public String getDescription() {
		return StringUtils.trimToEmpty(description);
	}

	/**
	 * [description] setter，
	 * 
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * [version] getter，
	 * 
	 */
	public int getVersion() {
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
		str += MessageFormat
				.format("TicketCode=\"{0}\",", this.getTicketCode());
		str += MessageFormat.format("SourceOf=\"{0}\",", this.getSourceOf());
		str += MessageFormat.format("PaymentType=\"{0}\",",
				this.getPaymentType());
		str += MessageFormat.format("Amount=\"{0}\",", this.getAmount());
		str += MessageFormat.format("BankAccount=\"{0}\",",
				this.getBankAccount());
		str += MessageFormat.format("BankName=\"{0}\",", this.getBankName());
		str += MessageFormat.format("Trice=\"{0}\",", this.getTrice());
		str += MessageFormat
				.format("CreateTime=\"{0}\",", this.getCreateTime());
		str += MessageFormat
				.format("CreateUser=\"{0}\",", this.getCreateUser());
		str += MessageFormat
				.format("UpdateTime=\"{0}\",", this.getUpdateTime());
		str += MessageFormat
				.format("UpdateUser=\"{0}\",", this.getUpdateUser());
		str += MessageFormat.format("Description=\"{0}\",",
				this.getDescription());
		str += MessageFormat.format("Version=\"{0}\",", this.getVersion());
		;
		return str;

	}
}
