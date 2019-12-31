/**
  * @ tianyongcang create in 2019-05-24 08:51:16
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
  * 数据表： [t_information_certificate_amount]
  * 10+C_信息登记证书费
  */
public class InformationCertificateAmount implements Serializable {
    
    	/**
	 * 
	 */
	private static final long serialVersionUID = -7141284040589002950L;
		/*
    	 * ID
    	 */
        public static final String FIELD_ID = "id";
        /*
    	 * 信息登记主键
    	 */
        public static final String FIELD_INFORMATION_ID = "information_id";
        /*
    	 * 证书使用人员姓名
    	 */
        public static final String FIELD_REAL_NAME = "real_name";
        /*
    	 * 使用起始时间
    	 */
        public static final String FIELD_BEGIN_TIME = "begin_time";
        /*
    	 * 使用截止时间
    	 */
        public static final String FIELD_END_TIME = "end_time";
    	/*
    	 * 证书类别
    	 */
        public static final String FIELD_TYPE = "type";
    	/*
    	 * 是否锁证0-未锁证，1-已锁证
    	 */
        public static final String FIELD_LOCK_FLAG = "lock_flag";
    	/*
    	 * 应收证书费
    	 */
        public static final String FIELD_PLAN_AMOUNT = "plan_amount";
    	/*
    	 * 已收证书费
    	 */
        public static final String FIELD_REAL_AMOUNT = "real_amount";
    	/*
    	 * 尚欠证书费
    	 */
        public static final String FIELD_OWE_AMOUNT = "owe_amount";
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
	public InformationCertificateAmount() {
		this.id = Utility.getRandomUUID(); 
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
      * [information_id]，
      * 信息登记主键
      */
      
      private String informationId;
      
    /**
      * [real_name]，
      * 证书使用人员姓名
      */
      
      private String realName;
      
    /**
      * [begin_time]，
      * 使用起始时间
      */

      @DateTimeFormat(iso=ISO.DATE)
      private Date beginTime;
      
    /**
      * [end_time]，
      * 使用截止时间
      */

      @DateTimeFormat(iso=ISO.DATE)
      private Date endTime;

      
      /**
        * [type]，
        * 证书类别
        */
        
        private String type;
      
    /**
      * [lock_flag]，
      * 是否锁证0-未锁证，1-已锁证
      */
      
      private String lockFlag;
      
    /**
      * [plan_amount]，
      * 应收证书费
      */
      
      private double planAmount;
      
    /**
      * [real_amount]，
      * 已收证书费
      */
      
      private double realAmount;
      
    /**
      * [owe_amount]，
      * 尚欠证书费
      */
      
      private double oweAmount;
      
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
    
    	
    public String getInformationId() {
		return informationId;
	}

	public void setInformationId(String informationId) {
		this.informationId = informationId;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	/**
      * [type] getter，
      * 证书类别
      */
    	public String getType () {
    		return this.type;
    	}

    /**
      * [type] setter，
      * 证书类别
      */
    	public void setType(String type) {
    		this.type = type;
    	}
    /**
      * [lock_flag] getter，
      * 是否锁证0-未锁证，1-已锁证
      */
    	public String getLockFlag () {
    		return this.lockFlag;
    	}

    /**
      * [lock_flag] setter，
      * 是否锁证0-未锁证，1-已锁证
      */
    	public void setLockFlag(String lockFlag) {
    		this.lockFlag = lockFlag;
    	}


    	public double getPlanAmount() {
    		return planAmount;
    	}

    	public void setPlanAmount(double planAmount) {
    		this.planAmount = planAmount;
    	}

    	public double getRealAmount() {
    		return realAmount;
    	}

    	public void setRealAmount(double realAmount) {
    		this.realAmount = realAmount;
    	}

    	public double getOweAmount() {
    		return oweAmount;
    	}

    	public void setOweAmount(double oweAmount) {
    		this.oweAmount = oweAmount;
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
    
	@Override
	public String toString() {
		System.out.println(this.getClass().getName() + ".toString():");
        
        String str = StringUtils.EMPTY;
        str += MessageFormat.format("Id=\"{0}\",", StringUtils.trimToEmpty(this.getId()));
        str += MessageFormat.format("InformationId=\"{0}\",", StringUtils.trimToEmpty(this.getInformationId()));
        str += MessageFormat.format("RealName=\"{0}\",", StringUtils.trimToEmpty(this.getRealName()));
        str += MessageFormat.format("BeginTime=\"{0}\",", this.getBeginTime());
        str += MessageFormat.format("EndTime=\"{0}\",", this.getEndTime());
        str += MessageFormat.format("Type=\"{0}\",", StringUtils.trimToEmpty(this.getType()));
        str += MessageFormat.format("LockFlag=\"{0}\",", StringUtils.trimToEmpty(this.getLockFlag()));
        str += MessageFormat.format("PlanAmount=\"{0}\",", this.getPlanAmount());
        str += MessageFormat.format("RealAmount=\"{0}\",", this.getRealAmount());
        str += MessageFormat.format("OweAmount=\"{0}\",", this.getOweAmount());
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

