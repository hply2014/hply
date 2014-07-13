﻿/**
  * @ ChengQiyi create in 2014-7-13 16:09:15 by Template at 2014年6月25日21:26:55
  * This class generated by CodeSmith Generator
  */

package hply.domain;

import java.io.Serializable;
import java.util.Date;
import java.text.MessageFormat;
import hply.common.Utility;
import org.apache.commons.lang3.StringUtils;


/**
  * 模型类，对应的数据库表： [t_sys_organization]
  * 
  */
public class SysOrganization implements Serializable {
        
  private String id;
  
/**
  * 读，数据库列： ID  
  * 
  */
	public String getId() {
        return StringUtils.trimToEmpty(id);
	}

/**
  * 写，数据库列：ID  
  * 
  */
	public void setId(String id) {
		this.id = id;
	}
		
        
  private String organizationname;
  
/**
  * 读，数据库列： OrganizationName  
  * 
  */
	public String getOrganizationname() {
        return StringUtils.trimToEmpty(organizationname);
	}

/**
  * 写，数据库列：OrganizationName  
  * 
  */
	public void setOrganizationname(String organizationname) {
		this.organizationname = organizationname;
	}
		
        
  private Date createtime;
  
/**
  * 读，数据库列： CreateTime  
  * 
  */
	public Date getCreatetime() {
		return createtime;
	}

/**
  * 写，数据库列：CreateTime  
  * 
  */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
		
        
  private String description;
  
/**
  * 读，数据库列： Description  
  * 
  */
	public String getDescription() {
        return StringUtils.trimToEmpty(description);
	}

/**
  * 写，数据库列：Description  
  * 
  */
	public void setDescription(String description) {
		this.description = description;
	}
		
        
    @Override
	public String toString() {
		System.out.println(this.getClass().getName() + ".toString():");
        
        String str = Utility.EMPTY_STRING;
        str += MessageFormat.format("\tId=\"{0}\"\n", this.getId());
        str += MessageFormat.format("\tOrganizationname=\"{0}\"\n", this.getOrganizationname());
        str += MessageFormat.format("\tCreatetime=\"{0}\"\n", this.getCreatetime());
        str += MessageFormat.format("\tDescription=\"{0}\"\n", this.getDescription());;
        return str;
                        
	}

}

