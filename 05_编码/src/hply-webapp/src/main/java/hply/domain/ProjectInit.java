/**
  * @ cqiyi create in 2014-12-8 6:26:38 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */

package hply.domain;

import java.io.Serializable;
import java.text.MessageFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
  * 数据表： [t_project_init]
  * 数据初始化表
  */
public class ProjectInit implements Serializable {
    
    	/**
	 * 
	 */
	private static final long serialVersionUID = -9189948018407409222L;
		/*
    	 * 
    	 */
        public static final String FIELD_SERIAL_ID = "serial_id";
    	/*
    	 * 摘要信息/时间
    	 */
        public static final String FIELD_TRICE = "trice";
    	/*
    	 * 摘要信息/摘要
    	 */
        public static final String FIELD_DESCRIPTION = "description";
    	/*
    	 * 合同项目信息/项目编号
    	 */
        public static final String FIELD_PROJECT_CODE = "project_code";
    	/*
    	 * 合同项目信息/项目名称
    	 */
        public static final String FIELD_PROJECT_NAME = "project_name";
    	/*
    	 * 合同项目信息/所在部门
    	 */
        public static final String FIELD_ORGANIZATION_NAME = "organization_name";
    	/*
    	 * 合同项目信息/甲方名称
    	 */
        public static final String FIELD_PARTY_NAME = "party_name";
    	/*
    	 * 合同项目信息/甲方地址
    	 */
        public static final String FIELD_PARTY_ADDRESS = "party_address";
    	/*
    	 * 合同项目信息/项目经理
    	 */
        public static final String FIELD_MANAGER = "manager";
    	/*
    	 * 合同项目信息/合作单位
    	 */
        public static final String FIELD_CORPERATION = "corperation";
    	/*
    	 * 合同项目信息/法人代表
    	 */
        public static final String FIELD_LEGAL_ASSIGNEE = "legal_assignee";
    	/*
    	 * 合同项目信息/异地代扣代缴
    	 */
        public static final String FIELD_IS_WITHHOLDING_OFFSITE = "is_withholding_offsite";
    	/*
    	 * 合同项目信息/合同号
    	 */
        public static final String FIELD_CONTRACT_CODE = "contract_code";
    	/*
    	 * 合同项目信息/合同金额
    	 */
        public static final String FIELD_CONTRACT_AMOUNT = "contract_amount";
    	/*
    	 * 合同项目信息/合同调增额
    	 */
        public static final String FIELD_CHANGE_AMOUNT = "change_amount";
    	/*
    	 * 合同项目信息/累计调增额
    	 */
        public static final String FIELD_CHANGE_TOTAL_AMOUNT = "change_total_amount";
    	/*
    	 * 合同项目信息/合同结算额
    	 */
        public static final String FIELD_SETTLEMENT_AMOUNT = "settlement_amount";
    	/*
    	 * 合同项目信息/印花税收据编号
    	 */
        public static final String FIELD_DUTY_PAID_CODE = "duty_paid_code";
    	/*
    	 * 合同项目信息/印花税上交时间
    	 */
        public static final String FIELD_DUTY_PAID_TIME = "duty_paid_time";
    	/*
    	 * 合同项目信息/印花税上交金额
    	 */
        public static final String FIELD_DUTY_PAID_AMOUNT = "duty_paid_amount";
    	/*
    	 * 合同项目信息/占用资金情况
    	 */
        public static final String FIELD_CAPITAL_OCCUPIED = "capital_occupied";
    	/*
    	 * 合同项目信息/项目状态
    	 */
        public static final String FIELD_PROJECT_STATUS = "project_status";
    	/*
    	 * 管理费情况/比率
    	 */
        public static final String FIELD_MANAGEMENT_RATE = "management_rate";
    	/*
    	 * 管理费情况/应收管理费
    	 */
        public static final String FIELD_MANAGEMENT_PLAN_AMOUNT = "management_plan_amount";
    	/*
    	 * 管理费情况/实收管理费
    	 */
        public static final String FIELD_MANAGEMENT_REAL_AMOUNT = "management_real_amount";
    	/*
    	 * 管理费情况/累计收管理费
    	 */
        public static final String FIELD_MANAGEMENT_TOTAL_AMOUNT = "management_total_amount";
    	/*
    	 * 管理费情况/尚欠管理费
    	 */
        public static final String FIELD_MANAGEMENT_OWE_AMOUNT = "management_owe_amount";
    	/*
    	 * 甲方开票情况/发票金额
    	 */
        public static final String FIELD_PARTY_BILLING_AMOUNT = "party_billing_amount";
    	/*
    	 * 甲方开票情况/累计开票
    	 */
        public static final String FIELD_PARTY_BILLING_TOTAL_AMOUNT = "party_billing_total_amount";
    	/*
    	 * 从甲方收款情况/收款金额
    	 */
        public static final String FIELD_COLLECTIONS_AMOUNT = "collections_amount";
    	/*
    	 * 从甲方收款情况/累计收款
    	 */
        public static final String FIELD_COLLECTIONS_TOTAL_AMOUNT = "collections_total_amount";
    	/*
    	 * 从甲方收款情况/回收率
    	 */
        public static final String FIELD_COLLECTIONS_RATE = "collections_rate";
    	/*
    	 * 客户开票情况/发票金额
    	 */
        public static final String FIELD_CUSTOMER_BILLING_AMOUNT = "customer_billing_amount";
    	/*
    	 * 客户开票情况/累计开票
    	 */
        public static final String FIELD_CUSTOMER_BILLING_TOTAL_AMOUNT = "customer_billing_total_amount";
    	/*
    	 * 支付工程款情况/支付金额
    	 */
        public static final String FIELD_PAYMENT_AMOUNT = "payment_amount";
    	/*
    	 * 支付工程款情况/差旅费
    	 */
        public static final String FIELD_PAYMENT_AMOUNT_CLV = "payment_amount_clv";
    	/*
    	 * 支付工程款情况/车辆费用
    	 */
        public static final String FIELD_PAYMENT_AMOUNT_CLIANG = "payment_amount_cliang";
    	/*
    	 * 支付工程款情况/业务招待费
    	 */
        public static final String FIELD_PAYMENT_AMOUNT_ZDAI = "payment_amount_zdai";
    	/*
    	 * 支付工程款情况/累计支付
    	 */
        public static final String FIELD_PAYMENT_TOTAL_AMOUNT = "payment_total_amount";
    	/*
    	 * 税金情况/比率
    	 */
        public static final String FIELD_TAX_RATE = "tax_rate";
    	/*
    	 * 税金情况/应缴税金
    	 */
        public static final String FIELD_TAX_PLAN_AMOUNT = "tax_plan_amount";
    	/*
    	 * 税金情况/已缴税金
    	 */
        public static final String FIELD_TAX_REAL_AMOUNT = "tax_real_amount";
    	/*
    	 * 税金情况/累计已缴税金
    	 */
        public static final String FIELD_TAX_TOTAL_AMOUNT = "tax_total_amount";
    	/*
    	 * 税金情况/尚欠税金
    	 */
        public static final String FIELD_TAX_OWE_AMOUNT = "tax_owe_amount";
    	/*
    	 * 往来欠款情况/金额
    	 */
        public static final String FIELD_ARREARS_AMOUNT = "arrears_amount";
    	/*
    	 * 型材（吨）/预计用量
    	 */
        public static final String FIELD_EXPECTED_VALUE = "expected_value";
    	/*
    	 * 型材（吨）/型材点
    	 */
        public static final String FIELD_PROFILE_POINT = "profile_point";
    	/*
    	 * 
    	 */
        public static final String FIELD_CREATE_TIME = "create_time";
    	/*
    	 * 预留字段01
    	 */
        public static final String FIELD_FIELD_01 = "field_01";
    	/*
    	 * 预留字段02
    	 */
        public static final String FIELD_FIELD_02 = "field_02";
    	/*
    	 * 预留字段03
    	 */
        public static final String FIELD_FIELD_03 = "field_03";
    	/*
    	 * 预留字段04
    	 */
        public static final String FIELD_FIELD_04 = "field_04";
    	/*
    	 * 预留字段05
    	 */
        public static final String FIELD_FIELD_05 = "field_05";

	/*
	 * 默认构造函数
	 */
	public ProjectInit() {
        this.trice = new Date(); 
        this.createTime = new Date(); 
	}

    /**
      * [serial_id]，
      * 
      */
      
      private Integer serialId;
      
    /**
      * [trice]，
      * 摘要信息/时间
      */
      @DateTimeFormat(iso=ISO.DATE)
      private Date trice;
      
    /**
      * [description]，
      * 摘要信息/摘要
      */
      
      private String description;
      
    /**
      * [project_code]，
      * 合同项目信息/项目编号
      */
      
      private String projectCode;
      
    /**
      * [project_name]，
      * 合同项目信息/项目名称
      */
      
      private String projectName;
      
    /**
      * [organization_name]，
      * 合同项目信息/所在部门
      */
      
      private String organizationName;
      
    /**
      * [party_name]，
      * 合同项目信息/甲方名称
      */
      
      private String partyName;
      
    /**
      * [party_address]，
      * 合同项目信息/甲方地址
      */
      
      private String partyAddress;
      
    /**
      * [manager]，
      * 合同项目信息/项目经理
      */
      
      private String manager;
      
    /**
      * [corperation]，
      * 合同项目信息/合作单位
      */
      
      private String corperation;
      
    /**
      * [legal_assignee]，
      * 合同项目信息/法人代表
      */
      
      private String legalAssignee;
      
    /**
      * [is_withholding_offsite]，
      * 合同项目信息/异地代扣代缴
      */
      
      private String isWithholdingOffsite;
      
    /**
      * [contract_code]，
      * 合同项目信息/合同号
      */
      
      private String contractCode;
      
    /**
      * [contract_amount]，
      * 合同项目信息/合同金额
      */
      
      private double contractAmount;
      
    /**
      * [change_amount]，
      * 合同项目信息/合同调增额
      */
      
      private double changeAmount;
      
    /**
      * [change_total_amount]，
      * 合同项目信息/累计调增额
      */
      
      private double changeTotalAmount;
      
    /**
      * [settlement_amount]，
      * 合同项目信息/合同结算额
      */
      
      private double settlementAmount;
      
    /**
      * [duty_paid_code]，
      * 合同项目信息/印花税收据编号
      */
      
      private String dutyPaidCode;
      
    /**
      * [duty_paid_time]，
      * 合同项目信息/印花税上交时间
      */
      @DateTimeFormat(iso=ISO.DATE)
      private Date dutyPaidTime;
      
    /**
      * [duty_paid_amount]，
      * 合同项目信息/印花税上交金额
      */
      
      private double dutyPaidAmount;
      
    /**
      * [capital_occupied]，
      * 合同项目信息/占用资金情况
      */
      
      private String capitalOccupied;
      
    /**
      * [project_status]，
      * 合同项目信息/项目状态
      */
      
      private String projectStatus;
      
    /**
      * [management_rate]，
      * 管理费情况/比率
      */
      
      private double managementRate;
      
    /**
      * [management_plan_amount]，
      * 管理费情况/应收管理费
      */
      
      private double managementPlanAmount;
      
    /**
      * [management_real_amount]，
      * 管理费情况/实收管理费
      */
      
      private double managementRealAmount;
      
    /**
      * [management_total_amount]，
      * 管理费情况/累计收管理费
      */
      
      private double managementTotalAmount;
      
    /**
      * [management_owe_amount]，
      * 管理费情况/尚欠管理费
      */
      
      private double managementOweAmount;
      
    /**
      * [party_billing_amount]，
      * 甲方开票情况/发票金额
      */
      
      private double partyBillingAmount;
      
    /**
      * [party_billing_total_amount]，
      * 甲方开票情况/累计开票
      */
      
      private double partyBillingTotalAmount;
      
    /**
      * [collections_amount]，
      * 从甲方收款情况/收款金额
      */
      
      private double collectionsAmount;
      
    /**
      * [collections_total_amount]，
      * 从甲方收款情况/累计收款
      */
      
      private double collectionsTotalAmount;
      
    /**
      * [collections_rate]，
      * 从甲方收款情况/回收率
      */
      
      private double collectionsRate;
      
    /**
      * [customer_billing_amount]，
      * 客户开票情况/发票金额
      */
      
      private double customerBillingAmount;
      
    /**
      * [customer_billing_total_amount]，
      * 客户开票情况/累计开票
      */
      
      private double customerBillingTotalAmount;
      
    /**
      * [payment_amount]，
      * 支付工程款情况/支付金额
      */
      
      private double paymentAmount;
      
    /**
      * [payment_amount_clv]，
      * 支付工程款情况/差旅费
      */
      
      private double paymentAmountClv;
      
    /**
      * [payment_amount_cliang]，
      * 支付工程款情况/车辆费用
      */
      
      private double paymentAmountCliang;
      
    /**
      * [payment_amount_zdai]，
      * 支付工程款情况/业务招待费
      */
      
      private double paymentAmountZdai;
      
    /**
      * [payment_total_amount]，
      * 支付工程款情况/累计支付
      */
      
      private double paymentTotalAmount;
      
    /**
      * [tax_rate]，
      * 税金情况/比率
      */
      
      private double taxRate;
      
    /**
      * [tax_plan_amount]，
      * 税金情况/应缴税金
      */
      
      private double taxPlanAmount;
      
    /**
      * [tax_real_amount]，
      * 税金情况/已缴税金
      */
      
      private double taxRealAmount;
      
    /**
      * [tax_total_amount]，
      * 税金情况/累计已缴税金
      */
      
      private double taxTotalAmount;
      
    /**
      * [tax_owe_amount]，
      * 税金情况/尚欠税金
      */
      
      private double taxOweAmount;
      
    /**
      * [arrears_amount]，
      * 往来欠款情况/金额
      */
      
      private double arrearsAmount;
      
    /**
      * [expected_value]，
      * 型材（吨）/预计用量
      */
      
      private double expectedValue;
      
    /**
      * [profile_point]，
      * 型材（吨）/型材点
      */
      
      private String profilePoint;
      
    /**
      * [create_time]，
      * 
      */
      @DateTimeFormat(iso=ISO.DATE)
      private Date createTime;
      
    /**
      * [field_01]，
      * 预留字段01
      */
      
      private String field01;
      
    /**
      * [field_02]，
      * 预留字段02
      */
      
      private String field02;
      
    /**
      * [field_03]，
      * 预留字段03
      */
      
      private String field03;
      
    /**
      * [field_04]，
      * 预留字段04
      */
      
      private String field04;
      
    /**
      * [field_05]，
      * 预留字段05
      */
      
      private String field05;
      
    
    /**
      * [serial_id] getter，
      * 
      */
    	public Integer getSerialId () {
    		return this.serialId;
    	}

    /**
      * [serial_id] setter，
      * 
      */
    	public void setSerialId(Integer serialId) {
    		this.serialId = serialId;
    	}
    /**
      * [trice] getter，
      * 摘要信息/时间
      */
    	public Date getTrice () {
    		return this.trice;
    	}

    /**
      * [trice] setter，
      * 摘要信息/时间
      */
    	public void setTrice(Date trice) {
    		this.trice = trice;
    	}
    /**
      * [description] getter，
      * 摘要信息/摘要
      */
    	public String getDescription () {
    		return this.description;
    	}

    /**
      * [description] setter，
      * 摘要信息/摘要
      */
    	public void setDescription(String description) {
    		this.description = description;
    	}
    /**
      * [project_code] getter，
      * 合同项目信息/项目编号
      */
    	public String getProjectCode () {
    		return this.projectCode;
    	}

    /**
      * [project_code] setter，
      * 合同项目信息/项目编号
      */
    	public void setProjectCode(String projectCode) {
    		this.projectCode = projectCode;
    	}
    /**
      * [project_name] getter，
      * 合同项目信息/项目名称
      */
    	public String getProjectName () {
    		return this.projectName;
    	}

    /**
      * [project_name] setter，
      * 合同项目信息/项目名称
      */
    	public void setProjectName(String projectName) {
    		this.projectName = projectName;
    	}
    /**
      * [organization_name] getter，
      * 合同项目信息/所在部门
      */
    	public String getOrganizationName () {
    		return this.organizationName;
    	}

    /**
      * [organization_name] setter，
      * 合同项目信息/所在部门
      */
    	public void setOrganizationName(String organizationName) {
    		this.organizationName = organizationName;
    	}
    /**
      * [party_name] getter，
      * 合同项目信息/甲方名称
      */
    	public String getPartyName () {
    		return this.partyName;
    	}

    /**
      * [party_name] setter，
      * 合同项目信息/甲方名称
      */
    	public void setPartyName(String partyName) {
    		this.partyName = partyName;
    	}
    /**
      * [party_address] getter，
      * 合同项目信息/甲方地址
      */
    	public String getPartyAddress () {
    		return this.partyAddress;
    	}

    /**
      * [party_address] setter，
      * 合同项目信息/甲方地址
      */
    	public void setPartyAddress(String partyAddress) {
    		this.partyAddress = partyAddress;
    	}
    /**
      * [manager] getter，
      * 合同项目信息/项目经理
      */
    	public String getManager () {
    		return this.manager;
    	}

    /**
      * [manager] setter，
      * 合同项目信息/项目经理
      */
    	public void setManager(String manager) {
    		this.manager = manager;
    	}
    /**
      * [corperation] getter，
      * 合同项目信息/合作单位
      */
    	public String getCorperation () {
    		return this.corperation;
    	}

    /**
      * [corperation] setter，
      * 合同项目信息/合作单位
      */
    	public void setCorperation(String corperation) {
    		this.corperation = corperation;
    	}
    /**
      * [legal_assignee] getter，
      * 合同项目信息/法人代表
      */
    	public String getLegalAssignee () {
    		return this.legalAssignee;
    	}

    /**
      * [legal_assignee] setter，
      * 合同项目信息/法人代表
      */
    	public void setLegalAssignee(String legalAssignee) {
    		this.legalAssignee = legalAssignee;
    	}
    /**
      * [is_withholding_offsite] getter，
      * 合同项目信息/异地代扣代缴
      */
    	public String getIsWithholdingOffsite () {
    		return this.isWithholdingOffsite;
    	}

    /**
      * [is_withholding_offsite] setter，
      * 合同项目信息/异地代扣代缴
      */
    	public void setIsWithholdingOffsite(String isWithholdingOffsite) {
    		this.isWithholdingOffsite = isWithholdingOffsite;
    	}
    /**
      * [contract_code] getter，
      * 合同项目信息/合同号
      */
    	public String getContractCode () {
    		return this.contractCode;
    	}

    /**
      * [contract_code] setter，
      * 合同项目信息/合同号
      */
    	public void setContractCode(String contractCode) {
    		this.contractCode = contractCode;
    	}
    /**
      * [contract_amount] getter，
      * 合同项目信息/合同金额
      */
    	public double getContractAmount () {
    		return this.contractAmount;
    	}

    /**
      * [contract_amount] setter，
      * 合同项目信息/合同金额
      */
    	public void setContractAmount(double contractAmount) {
    		this.contractAmount = contractAmount;
    	}
    /**
      * [change_amount] getter，
      * 合同项目信息/合同调增额
      */
    	public double getChangeAmount () {
    		return this.changeAmount;
    	}

    /**
      * [change_amount] setter，
      * 合同项目信息/合同调增额
      */
    	public void setChangeAmount(double changeAmount) {
    		this.changeAmount = changeAmount;
    	}
    /**
      * [change_total_amount] getter，
      * 合同项目信息/累计调增额
      */
    	public double getChangeTotalAmount () {
    		return this.changeTotalAmount;
    	}

    /**
      * [change_total_amount] setter，
      * 合同项目信息/累计调增额
      */
    	public void setChangeTotalAmount(double changeTotalAmount) {
    		this.changeTotalAmount = changeTotalAmount;
    	}
    /**
      * [settlement_amount] getter，
      * 合同项目信息/合同结算额
      */
    	public double getSettlementAmount () {
    		return this.settlementAmount;
    	}

    /**
      * [settlement_amount] setter，
      * 合同项目信息/合同结算额
      */
    	public void setSettlementAmount(double settlementAmount) {
    		this.settlementAmount = settlementAmount;
    	}
    /**
      * [duty_paid_code] getter，
      * 合同项目信息/印花税收据编号
      */
    	public String getDutyPaidCode () {
    		return this.dutyPaidCode;
    	}

    /**
      * [duty_paid_code] setter，
      * 合同项目信息/印花税收据编号
      */
    	public void setDutyPaidCode(String dutyPaidCode) {
    		this.dutyPaidCode = dutyPaidCode;
    	}
    /**
      * [duty_paid_time] getter，
      * 合同项目信息/印花税上交时间
      */
    	public Date getDutyPaidTime () {
    		return this.dutyPaidTime;
    	}

    /**
      * [duty_paid_time] setter，
      * 合同项目信息/印花税上交时间
      */
    	public void setDutyPaidTime(Date dutyPaidTime) {
    		this.dutyPaidTime = dutyPaidTime;
    	}
    /**
      * [duty_paid_amount] getter，
      * 合同项目信息/印花税上交金额
      */
    	public double getDutyPaidAmount () {
    		return this.dutyPaidAmount;
    	}

    /**
      * [duty_paid_amount] setter，
      * 合同项目信息/印花税上交金额
      */
    	public void setDutyPaidAmount(double dutyPaidAmount) {
    		this.dutyPaidAmount = dutyPaidAmount;
    	}
    /**
      * [capital_occupied] getter，
      * 合同项目信息/占用资金情况
      */
    	public String getCapitalOccupied () {
    		return this.capitalOccupied;
    	}

    /**
      * [capital_occupied] setter，
      * 合同项目信息/占用资金情况
      */
    	public void setCapitalOccupied(String capitalOccupied) {
    		this.capitalOccupied = capitalOccupied;
    	}
    /**
      * [project_status] getter，
      * 合同项目信息/项目状态
      */
    	public String getProjectStatus () {
    		return this.projectStatus;
    	}

    /**
      * [project_status] setter，
      * 合同项目信息/项目状态
      */
    	public void setProjectStatus(String projectStatus) {
    		this.projectStatus = projectStatus;
    	}
    /**
      * [management_rate] getter，
      * 管理费情况/比率
      */
    	public double getManagementRate () {
    		return this.managementRate;
    	}

    /**
      * [management_rate] setter，
      * 管理费情况/比率
      */
    	public void setManagementRate(double managementRate) {
    		this.managementRate = managementRate;
    	}
    /**
      * [management_plan_amount] getter，
      * 管理费情况/应收管理费
      */
    	public double getManagementPlanAmount () {
    		return this.managementPlanAmount;
    	}

    /**
      * [management_plan_amount] setter，
      * 管理费情况/应收管理费
      */
    	public void setManagementPlanAmount(double managementPlanAmount) {
    		this.managementPlanAmount = managementPlanAmount;
    	}
    /**
      * [management_real_amount] getter，
      * 管理费情况/实收管理费
      */
    	public double getManagementRealAmount () {
    		return this.managementRealAmount;
    	}

    /**
      * [management_real_amount] setter，
      * 管理费情况/实收管理费
      */
    	public void setManagementRealAmount(double managementRealAmount) {
    		this.managementRealAmount = managementRealAmount;
    	}
    /**
      * [management_total_amount] getter，
      * 管理费情况/累计收管理费
      */
    	public double getManagementTotalAmount () {
    		return this.managementTotalAmount;
    	}

    /**
      * [management_total_amount] setter，
      * 管理费情况/累计收管理费
      */
    	public void setManagementTotalAmount(double managementTotalAmount) {
    		this.managementTotalAmount = managementTotalAmount;
    	}
    /**
      * [management_owe_amount] getter，
      * 管理费情况/尚欠管理费
      */
    	public double getManagementOweAmount () {
    		return this.managementOweAmount;
    	}

    /**
      * [management_owe_amount] setter，
      * 管理费情况/尚欠管理费
      */
    	public void setManagementOweAmount(double managementOweAmount) {
    		this.managementOweAmount = managementOweAmount;
    	}
    /**
      * [party_billing_amount] getter，
      * 甲方开票情况/发票金额
      */
    	public double getPartyBillingAmount () {
    		return this.partyBillingAmount;
    	}

    /**
      * [party_billing_amount] setter，
      * 甲方开票情况/发票金额
      */
    	public void setPartyBillingAmount(double partyBillingAmount) {
    		this.partyBillingAmount = partyBillingAmount;
    	}
    /**
      * [party_billing_total_amount] getter，
      * 甲方开票情况/累计开票
      */
    	public double getPartyBillingTotalAmount () {
    		return this.partyBillingTotalAmount;
    	}

    /**
      * [party_billing_total_amount] setter，
      * 甲方开票情况/累计开票
      */
    	public void setPartyBillingTotalAmount(double partyBillingTotalAmount) {
    		this.partyBillingTotalAmount = partyBillingTotalAmount;
    	}
    /**
      * [collections_amount] getter，
      * 从甲方收款情况/收款金额
      */
    	public double getCollectionsAmount () {
    		return this.collectionsAmount;
    	}

    /**
      * [collections_amount] setter，
      * 从甲方收款情况/收款金额
      */
    	public void setCollectionsAmount(double collectionsAmount) {
    		this.collectionsAmount = collectionsAmount;
    	}
    /**
      * [collections_total_amount] getter，
      * 从甲方收款情况/累计收款
      */
    	public double getCollectionsTotalAmount () {
    		return this.collectionsTotalAmount;
    	}

    /**
      * [collections_total_amount] setter，
      * 从甲方收款情况/累计收款
      */
    	public void setCollectionsTotalAmount(double collectionsTotalAmount) {
    		this.collectionsTotalAmount = collectionsTotalAmount;
    	}
    /**
      * [collections_rate] getter，
      * 从甲方收款情况/回收率
      */
    	public double getCollectionsRate () {
    		return this.collectionsRate;
    	}

    /**
      * [collections_rate] setter，
      * 从甲方收款情况/回收率
      */
    	public void setCollectionsRate(double collectionsRate) {
    		this.collectionsRate = collectionsRate;
    	}
    /**
      * [customer_billing_amount] getter，
      * 客户开票情况/发票金额
      */
    	public double getCustomerBillingAmount () {
    		return this.customerBillingAmount;
    	}

    /**
      * [customer_billing_amount] setter，
      * 客户开票情况/发票金额
      */
    	public void setCustomerBillingAmount(double customerBillingAmount) {
    		this.customerBillingAmount = customerBillingAmount;
    	}
    /**
      * [customer_billing_total_amount] getter，
      * 客户开票情况/累计开票
      */
    	public double getCustomerBillingTotalAmount () {
    		return this.customerBillingTotalAmount;
    	}

    /**
      * [customer_billing_total_amount] setter，
      * 客户开票情况/累计开票
      */
    	public void setCustomerBillingTotalAmount(double customerBillingTotalAmount) {
    		this.customerBillingTotalAmount = customerBillingTotalAmount;
    	}
    /**
      * [payment_amount] getter，
      * 支付工程款情况/支付金额
      */
    	public double getPaymentAmount () {
    		return this.paymentAmount;
    	}

    /**
      * [payment_amount] setter，
      * 支付工程款情况/支付金额
      */
    	public void setPaymentAmount(double paymentAmount) {
    		this.paymentAmount = paymentAmount;
    	}
    /**
      * [payment_amount_clv] getter，
      * 支付工程款情况/差旅费
      */
    	public double getPaymentAmountClv () {
    		return this.paymentAmountClv;
    	}

    /**
      * [payment_amount_clv] setter，
      * 支付工程款情况/差旅费
      */
    	public void setPaymentAmountClv(double paymentAmountClv) {
    		this.paymentAmountClv = paymentAmountClv;
    	}
    /**
      * [payment_amount_cliang] getter，
      * 支付工程款情况/车辆费用
      */
    	public double getPaymentAmountCliang () {
    		return this.paymentAmountCliang;
    	}

    /**
      * [payment_amount_cliang] setter，
      * 支付工程款情况/车辆费用
      */
    	public void setPaymentAmountCliang(double paymentAmountCliang) {
    		this.paymentAmountCliang = paymentAmountCliang;
    	}
    /**
      * [payment_amount_zdai] getter，
      * 支付工程款情况/业务招待费
      */
    	public double getPaymentAmountZdai () {
    		return this.paymentAmountZdai;
    	}

    /**
      * [payment_amount_zdai] setter，
      * 支付工程款情况/业务招待费
      */
    	public void setPaymentAmountZdai(double paymentAmountZdai) {
    		this.paymentAmountZdai = paymentAmountZdai;
    	}
    /**
      * [payment_total_amount] getter，
      * 支付工程款情况/累计支付
      */
    	public double getPaymentTotalAmount () {
    		return this.paymentTotalAmount;
    	}

    /**
      * [payment_total_amount] setter，
      * 支付工程款情况/累计支付
      */
    	public void setPaymentTotalAmount(double paymentTotalAmount) {
    		this.paymentTotalAmount = paymentTotalAmount;
    	}
    /**
      * [tax_rate] getter，
      * 税金情况/比率
      */
    	public double getTaxRate () {
    		return this.taxRate;
    	}

    /**
      * [tax_rate] setter，
      * 税金情况/比率
      */
    	public void setTaxRate(double taxRate) {
    		this.taxRate = taxRate;
    	}
    /**
      * [tax_plan_amount] getter，
      * 税金情况/应缴税金
      */
    	public double getTaxPlanAmount () {
    		return this.taxPlanAmount;
    	}

    /**
      * [tax_plan_amount] setter，
      * 税金情况/应缴税金
      */
    	public void setTaxPlanAmount(double taxPlanAmount) {
    		this.taxPlanAmount = taxPlanAmount;
    	}
    /**
      * [tax_real_amount] getter，
      * 税金情况/已缴税金
      */
    	public double getTaxRealAmount () {
    		return this.taxRealAmount;
    	}

    /**
      * [tax_real_amount] setter，
      * 税金情况/已缴税金
      */
    	public void setTaxRealAmount(double taxRealAmount) {
    		this.taxRealAmount = taxRealAmount;
    	}
    /**
      * [tax_total_amount] getter，
      * 税金情况/累计已缴税金
      */
    	public double getTaxTotalAmount () {
    		return this.taxTotalAmount;
    	}

    /**
      * [tax_total_amount] setter，
      * 税金情况/累计已缴税金
      */
    	public void setTaxTotalAmount(double taxTotalAmount) {
    		this.taxTotalAmount = taxTotalAmount;
    	}
    /**
      * [tax_owe_amount] getter，
      * 税金情况/尚欠税金
      */
    	public double getTaxOweAmount () {
    		return this.taxOweAmount;
    	}

    /**
      * [tax_owe_amount] setter，
      * 税金情况/尚欠税金
      */
    	public void setTaxOweAmount(double taxOweAmount) {
    		this.taxOweAmount = taxOweAmount;
    	}
    /**
      * [arrears_amount] getter，
      * 往来欠款情况/金额
      */
    	public double getArrearsAmount () {
    		return this.arrearsAmount;
    	}

    /**
      * [arrears_amount] setter，
      * 往来欠款情况/金额
      */
    	public void setArrearsAmount(double arrearsAmount) {
    		this.arrearsAmount = arrearsAmount;
    	}
    /**
      * [expected_value] getter，
      * 型材（吨）/预计用量
      */
    	public double getExpectedValue () {
    		return this.expectedValue;
    	}

    /**
      * [expected_value] setter，
      * 型材（吨）/预计用量
      */
    	public void setExpectedValue(double expectedValue) {
    		this.expectedValue = expectedValue;
    	}
    /**
      * [profile_point] getter，
      * 型材（吨）/型材点
      */
    	public String getProfilePoint () {
    		return this.profilePoint;
    	}

    /**
      * [profile_point] setter，
      * 型材（吨）/型材点
      */
    	public void setProfilePoint(String profilePoint) {
    		this.profilePoint = profilePoint;
    	}
    /**
      * [create_time] getter，
      * 
      */
    	public Date getCreateTime () {
    		return this.createTime;
    	}

    /**
      * [create_time] setter，
      * 
      */
    	public void setCreateTime(Date createTime) {
    		this.createTime = createTime;
    	}
    /**
      * [field_01] getter，
      * 预留字段01
      */
    	public String getField01 () {
    		return this.field01;
    	}

    /**
      * [field_01] setter，
      * 预留字段01
      */
    	public void setField01(String field01) {
    		this.field01 = field01;
    	}
    /**
      * [field_02] getter，
      * 预留字段02
      */
    	public String getField02 () {
    		return this.field02;
    	}

    /**
      * [field_02] setter，
      * 预留字段02
      */
    	public void setField02(String field02) {
    		this.field02 = field02;
    	}
    /**
      * [field_03] getter，
      * 预留字段03
      */
    	public String getField03 () {
    		return this.field03;
    	}

    /**
      * [field_03] setter，
      * 预留字段03
      */
    	public void setField03(String field03) {
    		this.field03 = field03;
    	}
    /**
      * [field_04] getter，
      * 预留字段04
      */
    	public String getField04 () {
    		return this.field04;
    	}

    /**
      * [field_04] setter，
      * 预留字段04
      */
    	public void setField04(String field04) {
    		this.field04 = field04;
    	}
    /**
      * [field_05] getter，
      * 预留字段05
      */
    	public String getField05 () {
    		return this.field05;
    	}

    /**
      * [field_05] setter，
      * 预留字段05
      */
    	public void setField05(String field05) {
    		this.field05 = field05;
    	}
    
	@Override
	public String toString() {
		System.out.println(this.getClass().getName() + ".toString():");
        
        String str = StringUtils.EMPTY;
        str += MessageFormat.format("SerialId=\"{0}\",", this.getSerialId());
        str += MessageFormat.format("Trice=\"{0}\",", this.getTrice());
        str += MessageFormat.format("Description=\"{0}\",", StringUtils.trimToEmpty(this.getDescription()));
        str += MessageFormat.format("ProjectCode=\"{0}\",", StringUtils.trimToEmpty(this.getProjectCode()));
        str += MessageFormat.format("ProjectName=\"{0}\",", StringUtils.trimToEmpty(this.getProjectName()));
        str += MessageFormat.format("OrganizationName=\"{0}\",", StringUtils.trimToEmpty(this.getOrganizationName()));
        str += MessageFormat.format("PartyName=\"{0}\",", StringUtils.trimToEmpty(this.getPartyName()));
        str += MessageFormat.format("PartyAddress=\"{0}\",", StringUtils.trimToEmpty(this.getPartyAddress()));
        str += MessageFormat.format("Manager=\"{0}\",", StringUtils.trimToEmpty(this.getManager()));
        str += MessageFormat.format("Corperation=\"{0}\",", StringUtils.trimToEmpty(this.getCorperation()));
        str += MessageFormat.format("LegalAssignee=\"{0}\",", StringUtils.trimToEmpty(this.getLegalAssignee()));
        str += MessageFormat.format("IsWithholdingOffsite=\"{0}\",", StringUtils.trimToEmpty(this.getIsWithholdingOffsite()));
        str += MessageFormat.format("ContractCode=\"{0}\",", StringUtils.trimToEmpty(this.getContractCode()));
        str += MessageFormat.format("ContractAmount=\"{0}\",", this.getContractAmount());
        str += MessageFormat.format("ChangeAmount=\"{0}\",", this.getChangeAmount());
        str += MessageFormat.format("ChangeTotalAmount=\"{0}\",", this.getChangeTotalAmount());
        str += MessageFormat.format("SettlementAmount=\"{0}\",", this.getSettlementAmount());
        str += MessageFormat.format("DutyPaidCode=\"{0}\",", StringUtils.trimToEmpty(this.getDutyPaidCode()));
        str += MessageFormat.format("DutyPaidTime=\"{0}\",", this.getDutyPaidTime());
        str += MessageFormat.format("DutyPaidAmount=\"{0}\",", this.getDutyPaidAmount());
        str += MessageFormat.format("CapitalOccupied=\"{0}\",", StringUtils.trimToEmpty(this.getCapitalOccupied()));
        str += MessageFormat.format("ProjectStatus=\"{0}\",", StringUtils.trimToEmpty(this.getProjectStatus()));
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
        str += MessageFormat.format("PaymentAmountClv=\"{0}\",", this.getPaymentAmountClv());
        str += MessageFormat.format("PaymentAmountCliang=\"{0}\",", this.getPaymentAmountCliang());
        str += MessageFormat.format("PaymentAmountZdai=\"{0}\",", this.getPaymentAmountZdai());
        str += MessageFormat.format("PaymentTotalAmount=\"{0}\",", this.getPaymentTotalAmount());
        str += MessageFormat.format("TaxRate=\"{0}\",", this.getTaxRate());
        str += MessageFormat.format("TaxPlanAmount=\"{0}\",", this.getTaxPlanAmount());
        str += MessageFormat.format("TaxRealAmount=\"{0}\",", this.getTaxRealAmount());
        str += MessageFormat.format("TaxTotalAmount=\"{0}\",", this.getTaxTotalAmount());
        str += MessageFormat.format("TaxOweAmount=\"{0}\",", this.getTaxOweAmount());
        str += MessageFormat.format("ArrearsAmount=\"{0}\",", this.getArrearsAmount());
        str += MessageFormat.format("ExpectedValue=\"{0}\",", this.getExpectedValue());
        str += MessageFormat.format("ProfilePoint=\"{0}\",", StringUtils.trimToEmpty(this.getProfilePoint()));
        str += MessageFormat.format("CreateTime=\"{0}\",", this.getCreateTime());
        str += MessageFormat.format("Field01=\"{0}\",", StringUtils.trimToEmpty(this.getField01()));
        str += MessageFormat.format("Field02=\"{0}\",", StringUtils.trimToEmpty(this.getField02()));
        str += MessageFormat.format("Field03=\"{0}\",", StringUtils.trimToEmpty(this.getField03()));
        str += MessageFormat.format("Field04=\"{0}\",", StringUtils.trimToEmpty(this.getField04()));
        str += MessageFormat.format("Field05=\"{0}\",", StringUtils.trimToEmpty(this.getField05()));;
        return str;
                        
	}
}

