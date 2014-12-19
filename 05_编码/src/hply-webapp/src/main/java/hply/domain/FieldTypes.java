﻿/**
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
  * 数据表： [t_field_types]
  * 所有数据类型的测试样表
  */
public class FieldTypes implements Serializable {
    
    	/**
	 * 
	 */
	private static final long serialVersionUID = 7182240227606113943L;
		/*
    	 * 
    	 */
        public static final String FIELD_ID = "id";
    	/*
    	 * 
    	 */
        public static final String FIELD_FIELD_T01 = "field_t01";
    	/*
    	 * 
    	 */
        public static final String FIELD_FIELD_T02 = "field_t02";
    	/*
    	 * 
    	 */
        public static final String FIELD_FIELD_T03 = "field_t03";
    	/*
    	 * 
    	 */
        public static final String FIELD_FIELD_T04 = "field_t04";
    	/*
    	 * 
    	 */
        public static final String FIELD_FIELD_T05 = "field_t05";
    	/*
    	 * 
    	 */
        public static final String FIELD_FIELD_T06 = "field_t06";
    	/*
    	 * 
    	 */
        public static final String FIELD_FIELD_T07 = "field_t07";
    	/*
    	 * 
    	 */
        public static final String FIELD_FIELD_T08 = "field_t08";
    	/*
    	 * 
    	 */
        public static final String FIELD_FIELD_T09 = "field_t09";
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
	public FieldTypes() {
		this.id = Utility.getRandomUUID(); 
        this.version = -1; 
	}

    /**
      * [id]，
      * 
      */
      
      private String id;
      
    /**
      * [field_t01]，
      * 
      */
      
      private String fieldT01;
      
    /**
      * [field_t02]，
      * 
      */
      
      private double fieldT02;
      
    /**
      * [field_t03]，
      * 
      */
      
      private String fieldT03;
      
    /**
      * [field_t04]，
      * 
      */
      
      private String fieldT04;
      
    /**
      * [field_t05]，
      * 
      */
      
      private String fieldT05;
      
    /**
      * [field_t06]，
      * 
      */
      @DateTimeFormat(iso=ISO.DATE)
      private Date fieldT06;
      
    /**
      * [field_t07]，
      * 
      */
      
      private String fieldT07;
      
    /**
      * [field_t08]，
      * 
      */
      
      private Integer fieldT08;
      
    /**
      * [field_t09]，
      * 
      */
      
      private Integer fieldT09;
      
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
      * 
      */
    	public String getId () {
    		return this.id;
    	}

    /**
      * [id] setter，
      * 
      */
    	public void setId(String id) {
    		this.id = id;
    	}
    /**
      * [field_t01] getter，
      * 
      */
    	public String getFieldT01 () {
    		return this.fieldT01;
    	}

    /**
      * [field_t01] setter，
      * 
      */
    	public void setFieldT01(String fieldT01) {
    		this.fieldT01 = fieldT01;
    	}
    /**
      * [field_t02] getter，
      * 
      */
    	public double getFieldT02 () {
    		return this.fieldT02;
    	}

    /**
      * [field_t02] setter，
      * 
      */
    	public void setFieldT02(double fieldT02) {
    		this.fieldT02 = fieldT02;
    	}
    /**
      * [field_t03] getter，
      * 
      */
    	public String getFieldT03 () {
    		return this.fieldT03;
    	}

    /**
      * [field_t03] setter，
      * 
      */
    	public void setFieldT03(String fieldT03) {
    		this.fieldT03 = fieldT03;
    	}
    /**
      * [field_t04] getter，
      * 
      */
    	public String getFieldT04 () {
    		return this.fieldT04;
    	}

    /**
      * [field_t04] setter，
      * 
      */
    	public void setFieldT04(String fieldT04) {
    		this.fieldT04 = fieldT04;
    	}
    /**
      * [field_t05] getter，
      * 
      */
    	public String getFieldT05 () {
    		return this.fieldT05;
    	}

    /**
      * [field_t05] setter，
      * 
      */
    	public void setFieldT05(String fieldT05) {
    		this.fieldT05 = fieldT05;
    	}
    /**
      * [field_t06] getter，
      * 
      */
    	public Date getFieldT06 () {
    		return this.fieldT06;
    	}

    /**
      * [field_t06] setter，
      * 
      */
    	public void setFieldT06(Date fieldT06) {
    		this.fieldT06 = fieldT06;
    	}
    /**
      * [field_t07] getter，
      * 
      */
    	public String getFieldT07 () {
    		return this.fieldT07;
    	}

    /**
      * [field_t07] setter，
      * 
      */
    	public void setFieldT07(String fieldT07) {
    		this.fieldT07 = fieldT07;
    	}
    /**
      * [field_t08] getter，
      * 
      */
    	public Integer getFieldT08 () {
    		return this.fieldT08;
    	}

    /**
      * [field_t08] setter，
      * 
      */
    	public void setFieldT08(Integer fieldT08) {
    		this.fieldT08 = fieldT08;
    	}
    /**
      * [field_t09] getter，
      * 
      */
    	public Integer getFieldT09 () {
    		return this.fieldT09;
    	}

    /**
      * [field_t09] setter，
      * 
      */
    	public void setFieldT09(Integer fieldT09) {
    		this.fieldT09 = fieldT09;
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
        str += MessageFormat.format("FieldT01=\"{0}\",", StringUtils.trimToEmpty(this.getFieldT01()));
        str += MessageFormat.format("FieldT02=\"{0}\",", this.getFieldT02());
        str += MessageFormat.format("FieldT03=\"{0}\",", StringUtils.trimToEmpty(this.getFieldT03()));
        str += MessageFormat.format("FieldT04=\"{0}\",", StringUtils.trimToEmpty(this.getFieldT04()));
        str += MessageFormat.format("FieldT05=\"{0}\",", StringUtils.trimToEmpty(this.getFieldT05()));
        str += MessageFormat.format("FieldT06=\"{0}\",", this.getFieldT06());
        str += MessageFormat.format("FieldT07=\"{0}\",", StringUtils.trimToEmpty(this.getFieldT07()));
        str += MessageFormat.format("FieldT08=\"{0}\",", this.getFieldT08());
        str += MessageFormat.format("FieldT09=\"{0}\",", this.getFieldT09());
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

