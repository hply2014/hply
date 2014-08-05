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
  * 数据表： [t_field_types]
  * 所有数据类型的测试样表
  */
public class FieldTypes implements Serializable {

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
        str += MessageFormat.format("Status=\"{0}\",", this.getStatus());;
        return str;
                        
	}
}

