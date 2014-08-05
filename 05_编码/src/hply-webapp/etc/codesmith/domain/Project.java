﻿/**
  * @ cqiyi create in 2014-8-5 22:19:56 by Template
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
  * 数据表： [t_project]
  * 01_合同项目信息
  */
public class Project implements Serializable {

	/*
	 * 默认构造函数
	 */
	public Project() {
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
      * [project_code]，
      * 项目编号
      */
      
      private String projectCode;
      
    /**
      * [project_name]，
      * 项目名称
      */
      
      private String projectName;
      
    /**
      * [organization_id]，
      * 所在部门
      */
      
      private String organizationId;
      
    /**
      * [party_name]，
      * 甲方名称
      */
      
      private String partyName;
      
    /**
      * [party_address]，
      * 甲方地址
      */
      
      private String partyAddress;
      
    /**
      * [manager]，
      * 项目经理
      */
      
      private String manager;
      
    /**
      * [contract_code]，
      * 合同号
      */
      
      private String contractCode;
      
    /**
      * [corperation]，
      * 合作单位
      */
      
      private String corperation;
      
    /**
      * [legal_assignee]，
      * 法人代表
      */
      
      private String legalAssignee;
      
    /**
      * [is_withholding_offsite]，
      * 异地代扣代缴
      */
      
      private Integer isWithholdingOffsite;
      
    /**
      * [management_rate]，
      * 管理费率
      */
      
      private double managementRate;
      
    /**
      * [tax_rate]，
      * 税金比率
      */
      
      private double taxRate;
      
    /**
      * [contract_amount]，
      * 合同金额
      */
      
      private double contractAmount;
      
    /**
      * [settlement_amount]，
      * 结算金额
      */
      
      private double settlementAmount;
      
    /**
      * [duty_paid_time]，
      * 印花税上交时间
      */
      @DateTimeFormat(iso=ISO.DATE)
      private Date dutyPaidTime;
      
    /**
      * [duty_paid_amount]，
      * 印花税上交金额
      */
      
      private double dutyPaidAmount;
      
    /**
      * [duty_paid_code]，
      * 印花税收据编号
      */
      
      private String dutyPaidCode;
      
    /**
      * [capital_occupied]，
      * 占用资金情况
      */
      
      private double capitalOccupied;
      
    /**
      * [project_status]，
      * 项目状态
      */
      
      private Integer projectStatus;
      
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
      * [management_plan_amount]，
      * 应收管理费
      */
      
      private double managementPlanAmount;
      
    /**
      * [tax_plan_amount]，
      * 应缴税金
      */
      
      private double taxPlanAmount;
      
    
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
      * [project_code] getter，
      * 项目编号
      */
    	public String getProjectCode () {
    		return this.projectCode;
    	}

    /**
      * [project_code] setter，
      * 项目编号
      */
    	public void setProjectCode(String projectCode) {
    		this.projectCode = projectCode;
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
      * [party_name] getter，
      * 甲方名称
      */
    	public String getPartyName () {
    		return this.partyName;
    	}

    /**
      * [party_name] setter，
      * 甲方名称
      */
    	public void setPartyName(String partyName) {
    		this.partyName = partyName;
    	}
    /**
      * [party_address] getter，
      * 甲方地址
      */
    	public String getPartyAddress () {
    		return this.partyAddress;
    	}

    /**
      * [party_address] setter，
      * 甲方地址
      */
    	public void setPartyAddress(String partyAddress) {
    		this.partyAddress = partyAddress;
    	}
    /**
      * [manager] getter，
      * 项目经理
      */
    	public String getManager () {
    		return this.manager;
    	}

    /**
      * [manager] setter，
      * 项目经理
      */
    	public void setManager(String manager) {
    		this.manager = manager;
    	}
    /**
      * [contract_code] getter，
      * 合同号
      */
    	public String getContractCode () {
    		return this.contractCode;
    	}

    /**
      * [contract_code] setter，
      * 合同号
      */
    	public void setContractCode(String contractCode) {
    		this.contractCode = contractCode;
    	}
    /**
      * [corperation] getter，
      * 合作单位
      */
    	public String getCorperation () {
    		return this.corperation;
    	}

    /**
      * [corperation] setter，
      * 合作单位
      */
    	public void setCorperation(String corperation) {
    		this.corperation = corperation;
    	}
    /**
      * [legal_assignee] getter，
      * 法人代表
      */
    	public String getLegalAssignee () {
    		return this.legalAssignee;
    	}

    /**
      * [legal_assignee] setter，
      * 法人代表
      */
    	public void setLegalAssignee(String legalAssignee) {
    		this.legalAssignee = legalAssignee;
    	}
    /**
      * [is_withholding_offsite] getter，
      * 异地代扣代缴
      */
    	public Integer getIsWithholdingOffsite () {
    		return this.isWithholdingOffsite;
    	}

    /**
      * [is_withholding_offsite] setter，
      * 异地代扣代缴
      */
    	public void setIsWithholdingOffsite(Integer isWithholdingOffsite) {
    		this.isWithholdingOffsite = isWithholdingOffsite;
    	}
    /**
      * [management_rate] getter，
      * 管理费率
      */
    	public double getManagementRate () {
    		return this.managementRate;
    	}

    /**
      * [management_rate] setter，
      * 管理费率
      */
    	public void setManagementRate(double managementRate) {
    		this.managementRate = managementRate;
    	}
    /**
      * [tax_rate] getter，
      * 税金比率
      */
    	public double getTaxRate () {
    		return this.taxRate;
    	}

    /**
      * [tax_rate] setter，
      * 税金比率
      */
    	public void setTaxRate(double taxRate) {
    		this.taxRate = taxRate;
    	}
    /**
      * [contract_amount] getter，
      * 合同金额
      */
    	public double getContractAmount () {
    		return this.contractAmount;
    	}

    /**
      * [contract_amount] setter，
      * 合同金额
      */
    	public void setContractAmount(double contractAmount) {
    		this.contractAmount = contractAmount;
    	}
    /**
      * [settlement_amount] getter，
      * 结算金额
      */
    	public double getSettlementAmount () {
    		return this.settlementAmount;
    	}

    /**
      * [settlement_amount] setter，
      * 结算金额
      */
    	public void setSettlementAmount(double settlementAmount) {
    		this.settlementAmount = settlementAmount;
    	}
    /**
      * [duty_paid_time] getter，
      * 印花税上交时间
      */
    	public Date getDutyPaidTime () {
    		return this.dutyPaidTime;
    	}

    /**
      * [duty_paid_time] setter，
      * 印花税上交时间
      */
    	public void setDutyPaidTime(Date dutyPaidTime) {
    		this.dutyPaidTime = dutyPaidTime;
    	}
    /**
      * [duty_paid_amount] getter，
      * 印花税上交金额
      */
    	public double getDutyPaidAmount () {
    		return this.dutyPaidAmount;
    	}

    /**
      * [duty_paid_amount] setter，
      * 印花税上交金额
      */
    	public void setDutyPaidAmount(double dutyPaidAmount) {
    		this.dutyPaidAmount = dutyPaidAmount;
    	}
    /**
      * [duty_paid_code] getter，
      * 印花税收据编号
      */
    	public String getDutyPaidCode () {
    		return this.dutyPaidCode;
    	}

    /**
      * [duty_paid_code] setter，
      * 印花税收据编号
      */
    	public void setDutyPaidCode(String dutyPaidCode) {
    		this.dutyPaidCode = dutyPaidCode;
    	}
    /**
      * [capital_occupied] getter，
      * 占用资金情况
      */
    	public double getCapitalOccupied () {
    		return this.capitalOccupied;
    	}

    /**
      * [capital_occupied] setter，
      * 占用资金情况
      */
    	public void setCapitalOccupied(double capitalOccupied) {
    		this.capitalOccupied = capitalOccupied;
    	}
    /**
      * [project_status] getter，
      * 项目状态
      */
    	public Integer getProjectStatus () {
    		return this.projectStatus;
    	}

    /**
      * [project_status] setter，
      * 项目状态
      */
    	public void setProjectStatus(Integer projectStatus) {
    		this.projectStatus = projectStatus;
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
      * [management_plan_amount] getter，
      * 应收管理费
      */
    	public double getManagementPlanAmount () {
    		return this.managementPlanAmount;
    	}

    /**
      * [management_plan_amount] setter，
      * 应收管理费
      */
    	public void setManagementPlanAmount(double managementPlanAmount) {
    		this.managementPlanAmount = managementPlanAmount;
    	}
    /**
      * [tax_plan_amount] getter，
      * 应缴税金
      */
    	public double getTaxPlanAmount () {
    		return this.taxPlanAmount;
    	}

    /**
      * [tax_plan_amount] setter，
      * 应缴税金
      */
    	public void setTaxPlanAmount(double taxPlanAmount) {
    		this.taxPlanAmount = taxPlanAmount;
    	}
    
	@Override
	public String toString() {
		System.out.println(this.getClass().getName() + ".toString():");
        
        String str = StringUtils.EMPTY;
        str += MessageFormat.format("Id=\"{0}\",", StringUtils.trimToEmpty(this.getId()));
        str += MessageFormat.format("ProjectCode=\"{0}\",", StringUtils.trimToEmpty(this.getProjectCode()));
        str += MessageFormat.format("ProjectName=\"{0}\",", StringUtils.trimToEmpty(this.getProjectName()));
        str += MessageFormat.format("OrganizationId=\"{0}\",", StringUtils.trimToEmpty(this.getOrganizationId()));
        str += MessageFormat.format("PartyName=\"{0}\",", StringUtils.trimToEmpty(this.getPartyName()));
        str += MessageFormat.format("PartyAddress=\"{0}\",", StringUtils.trimToEmpty(this.getPartyAddress()));
        str += MessageFormat.format("Manager=\"{0}\",", StringUtils.trimToEmpty(this.getManager()));
        str += MessageFormat.format("ContractCode=\"{0}\",", StringUtils.trimToEmpty(this.getContractCode()));
        str += MessageFormat.format("Corperation=\"{0}\",", StringUtils.trimToEmpty(this.getCorperation()));
        str += MessageFormat.format("LegalAssignee=\"{0}\",", StringUtils.trimToEmpty(this.getLegalAssignee()));
        str += MessageFormat.format("IsWithholdingOffsite=\"{0}\",", this.getIsWithholdingOffsite());
        str += MessageFormat.format("ManagementRate=\"{0}\",", this.getManagementRate());
        str += MessageFormat.format("TaxRate=\"{0}\",", this.getTaxRate());
        str += MessageFormat.format("ContractAmount=\"{0}\",", this.getContractAmount());
        str += MessageFormat.format("SettlementAmount=\"{0}\",", this.getSettlementAmount());
        str += MessageFormat.format("DutyPaidTime=\"{0}\",", this.getDutyPaidTime());
        str += MessageFormat.format("DutyPaidAmount=\"{0}\",", this.getDutyPaidAmount());
        str += MessageFormat.format("DutyPaidCode=\"{0}\",", StringUtils.trimToEmpty(this.getDutyPaidCode()));
        str += MessageFormat.format("CapitalOccupied=\"{0}\",", this.getCapitalOccupied());
        str += MessageFormat.format("ProjectStatus=\"{0}\",", this.getProjectStatus());
        str += MessageFormat.format("Trice=\"{0}\",", this.getTrice());
        str += MessageFormat.format("CreateTime=\"{0}\",", this.getCreateTime());
        str += MessageFormat.format("CreateUser=\"{0}\",", StringUtils.trimToEmpty(this.getCreateUser()));
        str += MessageFormat.format("UpdateTime=\"{0}\",", this.getUpdateTime());
        str += MessageFormat.format("UpdateUser=\"{0}\",", StringUtils.trimToEmpty(this.getUpdateUser()));
        str += MessageFormat.format("Description=\"{0}\",", StringUtils.trimToEmpty(this.getDescription()));
        str += MessageFormat.format("Version=\"{0}\",", this.getVersion());
        str += MessageFormat.format("Status=\"{0}\",", this.getStatus());
        str += MessageFormat.format("ManagementPlanAmount=\"{0}\",", this.getManagementPlanAmount());
        str += MessageFormat.format("TaxPlanAmount=\"{0}\",", this.getTaxPlanAmount());;
        return str;
                        
	}
}

