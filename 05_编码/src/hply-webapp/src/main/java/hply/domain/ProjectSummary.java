﻿/**
  * @ cqiyi create in 2014-8-4 20:27:38 by Template
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
  * 数据表： [t_project_summary]
  * 00_多项目汇总
  */
public class ProjectSummary implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 708093524902755358L;


	/*
	 * 默认构造函数
	 */
	public ProjectSummary() {
		this.id = Utility.getRandomUUID();
        this.version = -1;
        this.trice = new Date();
	}

    /**
      * [id]，
      * ID
      */
      
      private String id;
      
    /**
      * [trice]，
      * 时间
      */
      @DateTimeFormat(iso=ISO.DATE)
      private Date trice;
      
    /**
      * [description]，
      * 摘要
      */
      
      private String description;
      
    /**
      * [project_id]，
      * 项目ID
      */
      
      private String projectId;
      
    /**
      * [organization_id]，
      * 所在部门
      */
      
      private String organizationId;
      
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
      * [contract_amount]，
      * 合同金额
      */
      
      private double contractAmount;
      
    /**
      * [change_amount]，
      * 合同调增额
      */
      
      private double changeAmount;
      
    /**
      * [settlement_amount]，
      * 合同结算额
      */
      
      private double settlementAmount;
      
    /**
      * [management_rate]，
      * 比率
      */
      
      private double managementRate;
      
    /**
      * [management_plan_amount]，
      * 应收管理费
      */
      
      private double managementPlanAmount;
      
    /**
      * [management_real_amount]，
      * 实收管理费
      */
      
      private double managementRealAmount;
      
    /**
      * [management_total_amount]，
      * 累计收管理费
      */
      
      private double managementTotalAmount;
      
    /**
      * [management_owe_amount]，
      * 尚欠管理费
      */
      
      private double managementOweAmount;
      
    /**
      * [party_billing_amount]，
      * 发票金额
      */
      
      private double partyBillingAmount;
      
    /**
      * [party_billing_total_amount]，
      * 累计开票
      */
      
      private double partyBillingTotalAmount;
      
    /**
      * [collections_amount]，
      * 收款金额
      */
      
      private double collectionsAmount;
      
    /**
      * [collections_total_amount]，
      * 累计收款
      */
      
      private double collectionsTotalAmount;
      
    /**
      * [collections_rate]，
      * 回收率
      */
      
      private double collectionsRate;
      
    /**
      * [customer_billing_amount]，
      * 发票金额
      */
      
      private double customerBillingAmount;
      
    /**
      * [customer_billing_total_amount]，
      * 累计开票
      */
      
      private double customerBillingTotalAmount;
      
    /**
      * [payment_amount]，
      * 支付金额
      */
      
      private double paymentAmount;
      
    /**
      * [payment_total_amount]，
      * 累计
      */
      
      private double paymentTotalAmount;
      
    /**
      * [tax_rate]，
      * 比率
      */
      
      private double taxRate;
      
    /**
      * [tax_plan_amount]，
      * 应缴税金
      */
      
      private double taxPlanAmount;
      
    /**
      * [tax_real_amount]，
      * 已缴税金
      */
      
      private double taxRealAmount;
      
    /**
      * [tax_total_amount]，
      * 累计已缴税金
      */
      
      private double taxTotalAmount;
      
    /**
      * [tax_owe_amount]，
      * 尚欠税金
      */
      
      private double taxOweAmount;
      
    /**
      * [arrears_amount]，
      * 金额
      */
      
      private double arrearsAmount;
      
    /**
      * [expected_value]，
      * 预计用量
      */
      
      private double expectedValue;
      
    /**
      * [profile_point]，
      * 型材点
      */
      
      private String profilePoint;
      
    /**
      * [version]，
      * 
      */
      
      private Integer version;
      
    /**
      * [create_time]，
      * 创建时间，数据生成时间
      */
      @DateTimeFormat(iso=ISO.DATE)
      private Date createTime;
      
    
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
      * [trice] getter，
      * 时间
      */
    	public Date getTrice () {
    		return this.trice;
    	}

    /**
      * [trice] setter，
      * 时间
      */
    	public void setTrice(Date trice) {
    		this.trice = trice;
    	}
    /**
      * [description] getter，
      * 摘要
      */
    	public String getDescription () {
    		return this.description;
    	}

    /**
      * [description] setter，
      * 摘要
      */
    	public void setDescription(String description) {
    		this.description = description;
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
      * [change_amount] getter，
      * 合同调增额
      */
    	public double getChangeAmount () {
    		return this.changeAmount;
    	}

    /**
      * [change_amount] setter，
      * 合同调增额
      */
    	public void setChangeAmount(double changeAmount) {
    		this.changeAmount = changeAmount;
    	}
    /**
      * [settlement_amount] getter，
      * 合同结算额
      */
    	public double getSettlementAmount () {
    		return this.settlementAmount;
    	}

    /**
      * [settlement_amount] setter，
      * 合同结算额
      */
    	public void setSettlementAmount(double settlementAmount) {
    		this.settlementAmount = settlementAmount;
    	}
    /**
      * [management_rate] getter，
      * 比率
      */
    	public double getManagementRate () {
    		return this.managementRate;
    	}

    /**
      * [management_rate] setter，
      * 比率
      */
    	public void setManagementRate(double managementRate) {
    		this.managementRate = managementRate;
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
      * [management_real_amount] getter，
      * 实收管理费
      */
    	public double getManagementRealAmount () {
    		return this.managementRealAmount;
    	}

    /**
      * [management_real_amount] setter，
      * 实收管理费
      */
    	public void setManagementRealAmount(double managementRealAmount) {
    		this.managementRealAmount = managementRealAmount;
    	}
    /**
      * [management_total_amount] getter，
      * 累计收管理费
      */
    	public double getManagementTotalAmount () {
    		return this.managementTotalAmount;
    	}

    /**
      * [management_total_amount] setter，
      * 累计收管理费
      */
    	public void setManagementTotalAmount(double managementTotalAmount) {
    		this.managementTotalAmount = managementTotalAmount;
    	}
    /**
      * [management_owe_amount] getter，
      * 尚欠管理费
      */
    	public double getManagementOweAmount () {
    		return this.managementOweAmount;
    	}

    /**
      * [management_owe_amount] setter，
      * 尚欠管理费
      */
    	public void setManagementOweAmount(double managementOweAmount) {
    		this.managementOweAmount = managementOweAmount;
    	}
    /**
      * [party_billing_amount] getter，
      * 发票金额
      */
    	public double getPartyBillingAmount () {
    		return this.partyBillingAmount;
    	}

    /**
      * [party_billing_amount] setter，
      * 发票金额
      */
    	public void setPartyBillingAmount(double partyBillingAmount) {
    		this.partyBillingAmount = partyBillingAmount;
    	}
    /**
      * [party_billing_total_amount] getter，
      * 累计开票
      */
    	public double getPartyBillingTotalAmount () {
    		return this.partyBillingTotalAmount;
    	}

    /**
      * [party_billing_total_amount] setter，
      * 累计开票
      */
    	public void setPartyBillingTotalAmount(double partyBillingTotalAmount) {
    		this.partyBillingTotalAmount = partyBillingTotalAmount;
    	}
    /**
      * [collections_amount] getter，
      * 收款金额
      */
    	public double getCollectionsAmount () {
    		return this.collectionsAmount;
    	}

    /**
      * [collections_amount] setter，
      * 收款金额
      */
    	public void setCollectionsAmount(double collectionsAmount) {
    		this.collectionsAmount = collectionsAmount;
    	}
    /**
      * [collections_total_amount] getter，
      * 累计收款
      */
    	public double getCollectionsTotalAmount () {
    		return this.collectionsTotalAmount;
    	}

    /**
      * [collections_total_amount] setter，
      * 累计收款
      */
    	public void setCollectionsTotalAmount(double collectionsTotalAmount) {
    		this.collectionsTotalAmount = collectionsTotalAmount;
    	}
    /**
      * [collections_rate] getter，
      * 回收率
      */
    	public double getCollectionsRate () {
    		return this.collectionsRate;
    	}

    /**
      * [collections_rate] setter，
      * 回收率
      */
    	public void setCollectionsRate(double collectionsRate) {
    		this.collectionsRate = collectionsRate;
    	}
    /**
      * [customer_billing_amount] getter，
      * 发票金额
      */
    	public double getCustomerBillingAmount () {
    		return this.customerBillingAmount;
    	}

    /**
      * [customer_billing_amount] setter，
      * 发票金额
      */
    	public void setCustomerBillingAmount(double customerBillingAmount) {
    		this.customerBillingAmount = customerBillingAmount;
    	}
    /**
      * [customer_billing_total_amount] getter，
      * 累计开票
      */
    	public double getCustomerBillingTotalAmount () {
    		return this.customerBillingTotalAmount;
    	}

    /**
      * [customer_billing_total_amount] setter，
      * 累计开票
      */
    	public void setCustomerBillingTotalAmount(double customerBillingTotalAmount) {
    		this.customerBillingTotalAmount = customerBillingTotalAmount;
    	}
    /**
      * [payment_amount] getter，
      * 支付金额
      */
    	public double getPaymentAmount () {
    		return this.paymentAmount;
    	}

    /**
      * [payment_amount] setter，
      * 支付金额
      */
    	public void setPaymentAmount(double paymentAmount) {
    		this.paymentAmount = paymentAmount;
    	}
    /**
      * [payment_total_amount] getter，
      * 累计
      */
    	public double getPaymentTotalAmount () {
    		return this.paymentTotalAmount;
    	}

    /**
      * [payment_total_amount] setter，
      * 累计
      */
    	public void setPaymentTotalAmount(double paymentTotalAmount) {
    		this.paymentTotalAmount = paymentTotalAmount;
    	}
    /**
      * [tax_rate] getter，
      * 比率
      */
    	public double getTaxRate () {
    		return this.taxRate;
    	}

    /**
      * [tax_rate] setter，
      * 比率
      */
    	public void setTaxRate(double taxRate) {
    		this.taxRate = taxRate;
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
    /**
      * [tax_real_amount] getter，
      * 已缴税金
      */
    	public double getTaxRealAmount () {
    		return this.taxRealAmount;
    	}

    /**
      * [tax_real_amount] setter，
      * 已缴税金
      */
    	public void setTaxRealAmount(double taxRealAmount) {
    		this.taxRealAmount = taxRealAmount;
    	}
    /**
      * [tax_total_amount] getter，
      * 累计已缴税金
      */
    	public double getTaxTotalAmount () {
    		return this.taxTotalAmount;
    	}

    /**
      * [tax_total_amount] setter，
      * 累计已缴税金
      */
    	public void setTaxTotalAmount(double taxTotalAmount) {
    		this.taxTotalAmount = taxTotalAmount;
    	}
    /**
      * [tax_owe_amount] getter，
      * 尚欠税金
      */
    	public double getTaxOweAmount () {
    		return this.taxOweAmount;
    	}

    /**
      * [tax_owe_amount] setter，
      * 尚欠税金
      */
    	public void setTaxOweAmount(double taxOweAmount) {
    		this.taxOweAmount = taxOweAmount;
    	}
    /**
      * [arrears_amount] getter，
      * 金额
      */
    	public double getArrearsAmount () {
    		return this.arrearsAmount;
    	}

    /**
      * [arrears_amount] setter，
      * 金额
      */
    	public void setArrearsAmount(double arrearsAmount) {
    		this.arrearsAmount = arrearsAmount;
    	}
    /**
      * [expected_value] getter，
      * 预计用量
      */
    	public double getExpectedValue () {
    		return this.expectedValue;
    	}

    /**
      * [expected_value] setter，
      * 预计用量
      */
    	public void setExpectedValue(double expectedValue) {
    		this.expectedValue = expectedValue;
    	}
    /**
      * [profile_point] getter，
      * 型材点
      */
    	public String getProfilePoint () {
    		return this.profilePoint;
    	}

    /**
      * [profile_point] setter，
      * 型材点
      */
    	public void setProfilePoint(String profilePoint) {
    		this.profilePoint = profilePoint;
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
      * [create_time] getter，
      * 创建时间，数据生成时间
      */
    	public Date getCreateTime () {
    		return this.createTime;
    	}

    /**
      * [create_time] setter，
      * 创建时间，数据生成时间
      */
    	public void setCreateTime(Date createTime) {
    		this.createTime = createTime;
    	}
    
	@Override
	public String toString() {
		System.out.println(this.getClass().getName() + ".toString():");
        
        String str = StringUtils.EMPTY;
        str += MessageFormat.format("Id=\"{0}\",", StringUtils.trimToEmpty(this.getId()));
        str += MessageFormat.format("Trice=\"{0}\",", this.getTrice());
        str += MessageFormat.format("Description=\"{0}\",", StringUtils.trimToEmpty(this.getDescription()));
        str += MessageFormat.format("ProjectId=\"{0}\",", StringUtils.trimToEmpty(this.getProjectId()));
        str += MessageFormat.format("OrganizationId=\"{0}\",", StringUtils.trimToEmpty(this.getOrganizationId()));
        str += MessageFormat.format("ProjectCode=\"{0}\",", StringUtils.trimToEmpty(this.getProjectCode()));
        str += MessageFormat.format("ProjectName=\"{0}\",", StringUtils.trimToEmpty(this.getProjectName()));
        str += MessageFormat.format("ContractAmount=\"{0}\",", this.getContractAmount());
        str += MessageFormat.format("ChangeAmount=\"{0}\",", this.getChangeAmount());
        str += MessageFormat.format("SettlementAmount=\"{0}\",", this.getSettlementAmount());
        str += MessageFormat.format("ManagementRate=\"{0}\",", this.getManagementRate());
        str += MessageFormat.format("ManagementPlanAmount=\"{0}\",", this.getManagementPlanAmount());
        str += MessageFormat.format("ManagementRealAmount=\"{0}\",", this.getManagementRealAmount());
        str += MessageFormat.format("ManagementTotalAmount=\"{0}\",", this.getManagementTotalAmount());
        str += MessageFormat.format("ManagementOweAmount=\"{0}\",", this.getManagementOweAmount());
        str += MessageFormat.format("PartyBillingAmount=\"{0}\",", this.getPartyBillingAmount());
        str += MessageFormat.format("PartyBillingTotalAmount=\"{0}\",", this.getPartyBillingTotalAmount());
        str += MessageFormat.format("CollectionsAmount=\"{0}\",", this.getCollectionsAmount());
        str += MessageFormat.format("CollectionsTotalAmount=\"{0}\",", this.getCollectionsTotalAmount());
        str += MessageFormat.format("CollectionsRate=\"{0}\",", this.getCollectionsRate());
        str += MessageFormat.format("CustomerBillingAmount=\"{0}\",", this.getCustomerBillingAmount());
        str += MessageFormat.format("CustomerBillingTotalAmount=\"{0}\",", this.getCustomerBillingTotalAmount());
        str += MessageFormat.format("PaymentAmount=\"{0}\",", this.getPaymentAmount());
        str += MessageFormat.format("PaymentTotalAmount=\"{0}\",", this.getPaymentTotalAmount());
        str += MessageFormat.format("TaxRate=\"{0}\",", this.getTaxRate());
        str += MessageFormat.format("TaxPlanAmount=\"{0}\",", this.getTaxPlanAmount());
        str += MessageFormat.format("TaxRealAmount=\"{0}\",", this.getTaxRealAmount());
        str += MessageFormat.format("TaxTotalAmount=\"{0}\",", this.getTaxTotalAmount());
        str += MessageFormat.format("TaxOweAmount=\"{0}\",", this.getTaxOweAmount());
        str += MessageFormat.format("ArrearsAmount=\"{0}\",", this.getArrearsAmount());
        str += MessageFormat.format("ExpectedValue=\"{0}\",", this.getExpectedValue());
        str += MessageFormat.format("ProfilePoint=\"{0}\",", StringUtils.trimToEmpty(this.getProfilePoint()));
        str += MessageFormat.format("Version=\"{0}\",", this.getVersion());
        str += MessageFormat.format("CreateTime=\"{0}\",", this.getCreateTime());;
        return str;
                        
	}
}

