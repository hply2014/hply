/**
  * @ cqiyi create in 2014-12-8 6:26:38 by Template
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
  * 数据表： [t_payment]
  * 06_付款情况
  */
public class Payment implements Serializable {
    
    	/**
	 * 
	 */
	private static final long serialVersionUID = 3490119865154533490L;
		/*
    	 * ID
    	 */
        public static final String FIELD_ID = "id";
        /*
         * 项目ID
         */
        public static final String FIELD_PROJECT_ID = "project_id";
    	/*
    	 * 客户开票情况ID
    	 */
        public static final String FIELD_CUSTOMER_BILLING_ID = "customer_billing_id";
    	/*
    	 * 凭证号
    	 */
        public static final String FIELD_TICKET_CODE = "ticket_code";
    	/*
    	 * 支付方式
    	 */
        public static final String FIELD_PAY_TYPE = "pay_type";
    	/*
    	 * 付款科目ID
    	 */
        public static final String FIELD_PAYMENT_ITEM_ID = "payment_item_id";
    	/*
    	 * 付款金额
    	 */
        public static final String FIELD_AMOUNT = "amount";
    	/*
    	 * 银行账号
    	 */
        public static final String FIELD_BANK_ACCOUNT = "bank_account";
    	/*
    	 * 开户行名称
    	 */
        public static final String FIELD_BANK_NAME = "bank_name";
    	/*
    	 * 付款时间
    	 */
        public static final String FIELD_TRICE = "trice";
    	/*
    	 * 创建时间
    	 */
        public static final String FIELD_CREATE_TIME = "create_time";
    	/*
    	 * 创建用户
    	 */
        public static final String FIELD_CREATE_USER = "create_user";
    	/*
    	 * 修改时间
    	 */
        public static final String FIELD_UPDATE_TIME = "update_time";
    	/*
    	 * 修改用户
    	 */
        public static final String FIELD_UPDATE_USER = "update_user";
    	/*
    	 * 备注
    	 */
        public static final String FIELD_DESCRIPTION = "description";
    	/*
    	 * 
    	 */
        public static final String FIELD_VERSION = "version";
    	/*
    	 * 数据状态，0：草稿/1：正式
    	 */
        public static final String FIELD_STATUS = "status";
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
	public Payment() {
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
      * [customer_billing_id]，
      * 客户开票情况ID
      */
      
      private String customerBillingId;
      
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
      
      private double amount;
      
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
       * 
       * 异地税金-ID
       */
      
      private String[] diffIds;

      
      /**
       * 
       * 异地税金-名称
       */
      
      private String[] diffNames;
      
      /**
       * 
       * 异地税金-金额
       */
      
      private double[] diffAmounts;
      
      /**
        * 
        * 异地税金-状态标识：-1删除，其他保存
        */
        
        private Integer[] diffStatuss;
      
    
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
      * [customer_billing_id] getter，
      * 客户开票情况ID
      */
    	public String getCustomerBillingId () {
    		return this.customerBillingId;
    	}

    /**
      * [customer_billing_id] setter，
      * 客户开票情况ID
      */
    	public void setCustomerBillingId(String customerBillingId) {
    		this.customerBillingId = customerBillingId;
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
    	public double getAmount () {
    		return this.amount;
    	}

    /**
      * [amount] setter，
      * 付款金额
      */
    	public void setAmount(double amount) {
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
    
	public String[] getDiffIds() {
		return diffIds;
	}

	public void setDiffIds(String[] diffIds) {
		this.diffIds = diffIds;
	}

	public String[] getDiffNames() {
		return diffNames;
	}

	public void setDiffNames(String[] diffNames) {
		this.diffNames = diffNames;
	}

	public double[] getDiffAmounts() {
		return diffAmounts;
	}

	public void setDiffAmounts(double[] diffAmounts) {
		this.diffAmounts = diffAmounts;
	}

	public Integer[] getDiffStatuss() {
		return diffStatuss;
	}

	public void setDiffStatuss(Integer[] diffStatuss) {
		this.diffStatuss = diffStatuss;
	}

	@Override
	public String toString() {
		System.out.println(this.getClass().getName() + ".toString():");
        
        String str = StringUtils.EMPTY;
        str += MessageFormat.format("Id=\"{0}\",", StringUtils.trimToEmpty(this.getId()));
        str += MessageFormat.format("ProjectId=\"{0}\",", StringUtils.trimToEmpty(this.getProjectId()));
        str += MessageFormat.format("CustomerBillingId=\"{0}\",", StringUtils.trimToEmpty(this.getCustomerBillingId()));
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
        str += MessageFormat.format("Status=\"{0}\",", this.getStatus());
        str += MessageFormat.format("Field01=\"{0}\",", StringUtils.trimToEmpty(this.getField01()));
        str += MessageFormat.format("Field02=\"{0}\",", StringUtils.trimToEmpty(this.getField02()));
        str += MessageFormat.format("Field03=\"{0}\",", StringUtils.trimToEmpty(this.getField03()));
        str += MessageFormat.format("Field04=\"{0}\",", StringUtils.trimToEmpty(this.getField04()));
        str += MessageFormat.format("Field05=\"{0}\",", StringUtils.trimToEmpty(this.getField05()));;
        return str;
                        
	}
}

