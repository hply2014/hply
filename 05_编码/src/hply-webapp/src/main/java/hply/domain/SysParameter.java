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
  * 数据表： [t_sys_parameter]
  * 14_系统参数
  */
public class SysParameter implements Serializable {
    
    	/**
	 * 
	 */
	private static final long serialVersionUID = -2658471845540529756L;
		/*
    	 * ID
    	 */
        public static final String FIELD_ID = "id";
    	/*
    	 * 参数英文名称
    	 */
        public static final String FIELD_EN_NAME = "en_name";
    	/*
    	 * 参数中文名称
    	 */
        public static final String FIELD_CN_NAME = "cn_name";
    	/*
    	 * 参数值
    	 */
        public static final String FIELD_PARAM_VALUE = "param_value";
    	/*
    	 * 默认值
    	 */
        public static final String FIELD_DEFAULT_VALUE = "default_value";
    	/*
    	 * 是否系统内置
    	 */
        public static final String FIELD_IS_INNER = "is_inner";
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
	public SysParameter() {
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
      * [en_name]，
      * 参数英文名称
      */
      
      private String enName;
      
    /**
      * [cn_name]，
      * 参数中文名称
      */
      
      private String cnName;
      
    /**
      * [param_value]，
      * 参数值
      */
      
      private String paramValue;
      
    /**
      * [default_value]，
      * 默认值
      */
      
      private String defaultValue;
      
    /**
      * [is_inner]，
      * 是否系统内置
      */
      
      private boolean isInner;
      
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
    /**
      * [en_name] getter，
      * 参数英文名称
      */
    	public String getEnName () {
    		return this.enName;
    	}

    /**
      * [en_name] setter，
      * 参数英文名称
      */
    	public void setEnName(String enName) {
    		this.enName = enName;
    	}
    /**
      * [cn_name] getter，
      * 参数中文名称
      */
    	public String getCnName () {
    		return this.cnName;
    	}

    /**
      * [cn_name] setter，
      * 参数中文名称
      */
    	public void setCnName(String cnName) {
    		this.cnName = cnName;
    	}
    /**
      * [param_value] getter，
      * 参数值
      */
    	public String getParamValue () {
    		return this.paramValue;
    	}

    /**
      * [param_value] setter，
      * 参数值
      */
    	public void setParamValue(String paramValue) {
    		this.paramValue = paramValue;
    	}
    /**
      * [default_value] getter，
      * 默认值
      */
    	public String getDefaultValue () {
    		return this.defaultValue;
    	}

    /**
      * [default_value] setter，
      * 默认值
      */
    	public void setDefaultValue(String defaultValue) {
    		this.defaultValue = defaultValue;
    	}
    /**
      * [is_inner] getter，
      * 是否系统内置
      */
    	public boolean getIsInner () {
    		return this.isInner;
    	}

    /**
      * [is_inner] setter，
      * 是否系统内置
      */
    	public void setIsInner(boolean isInner) {
    		this.isInner = isInner;
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
        str += MessageFormat.format("EnName=\"{0}\",", StringUtils.trimToEmpty(this.getEnName()));
        str += MessageFormat.format("CnName=\"{0}\",", StringUtils.trimToEmpty(this.getCnName()));
        str += MessageFormat.format("ParamValue=\"{0}\",", StringUtils.trimToEmpty(this.getParamValue()));
        str += MessageFormat.format("DefaultValue=\"{0}\",", StringUtils.trimToEmpty(this.getDefaultValue()));
        str += MessageFormat.format("IsInner=\"{0}\",", this.getIsInner());
        str += MessageFormat.format("CreateTime=\"{0}\",", this.getCreateTime());
        str += MessageFormat.format("CreateUser=\"{0}\",", StringUtils.trimToEmpty(this.getCreateUser()));
        str += MessageFormat.format("UpdateTime=\"{0}\",", this.getUpdateTime());
        str += MessageFormat.format("UpdateUser=\"{0}\",", StringUtils.trimToEmpty(this.getUpdateUser()));
        str += MessageFormat.format("Description=\"{0}\",", StringUtils.trimToEmpty(this.getDescription()));
        str += MessageFormat.format("Version=\"{0}\",", this.getVersion());
        str += MessageFormat.format("Field01=\"{0}\",", StringUtils.trimToEmpty(this.getField01()));
        str += MessageFormat.format("Field02=\"{0}\",", StringUtils.trimToEmpty(this.getField02()));
        str += MessageFormat.format("Field03=\"{0}\",", StringUtils.trimToEmpty(this.getField03()));
        str += MessageFormat.format("Field04=\"{0}\",", StringUtils.trimToEmpty(this.getField04()));
        str += MessageFormat.format("Field05=\"{0}\",", StringUtils.trimToEmpty(this.getField05()));;
        return str;
                        
	}
}

