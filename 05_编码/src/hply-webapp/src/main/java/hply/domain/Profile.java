﻿/**
  * @ ChengQiyi create in 2014-7-13 16:09:15 by Template at 2014年6月25日21:26:55
  * This class generated by CodeSmith Generator
  */

package hply.domain;

import hply.common.Utils;

import java.io.Serializable;
import java.text.MessageFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;


/**
  * 模型类，对应的数据库表： [t_profile]
  * 
  */
public class Profile implements Serializable {
        
  /**
	 * 
	 */
	private static final long serialVersionUID = -1316595910281788257L;
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
		
        
  private String projectid;
  
/**
  * 读，数据库列： ProjectID  
  * 
  */
	public String getProjectid() {
        return StringUtils.trimToEmpty(projectid);
	}

/**
  * 写，数据库列：ProjectID  
  * 
  */
	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
		
        
  private double expectedvalue;
  
/**
  * 读，数据库列： ExpectedValue  
  * 
  */
	public double getExpectedvalue() {
		return expectedvalue;
	}

/**
  * 写，数据库列：ExpectedValue  
  * 
  */
	public void setExpectedvalue(double expectedvalue) {
		this.expectedvalue = expectedvalue;
	}
		
        
  private String profilepoint;
  
/**
  * 读，数据库列： ProfilePoint  
  * 
  */
	public String getProfilepoint() {
        return StringUtils.trimToEmpty(profilepoint);
	}

/**
  * 写，数据库列：ProfilePoint  
  * 
  */
	public void setProfilepoint(String profilepoint) {
		this.profilepoint = profilepoint;
	}
		
        
  private Date trice;
  
/**
  * 读，数据库列： Trice  
  * 
  */
	public Date getTrice() {
		return trice;
	}

/**
  * 写，数据库列：Trice  
  * 
  */
	public void setTrice(Date trice) {
		this.trice = trice;
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
		
        
  private String createuser;
  
/**
  * 读，数据库列： CreateUser  
  * 
  */
	public String getCreateuser() {
        return StringUtils.trimToEmpty(createuser);
	}

/**
  * 写，数据库列：CreateUser  
  * 
  */
	public void setCreateuser(String createuser) {
		this.createuser = createuser;
	}
		
        
  private Date updatetime;
  
/**
  * 读，数据库列： UpdateTime  
  * 
  */
	public Date getUpdatetime() {
		return updatetime;
	}

/**
  * 写，数据库列：UpdateTime  
  * 
  */
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
		
        
  private String updateuser;
  
/**
  * 读，数据库列： UpdateUser  
  * 
  */
	public String getUpdateuser() {
        return StringUtils.trimToEmpty(updateuser);
	}

/**
  * 写，数据库列：UpdateUser  
  * 
  */
	public void setUpdateuser(String updateuser) {
		this.updateuser = updateuser;
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
        
        String str = Utils.EMPTY;
        str += MessageFormat.format("\tId=\"{0}\"\n", this.getId());
        str += MessageFormat.format("\tProjectid=\"{0}\"\n", this.getProjectid());
        str += MessageFormat.format("\tExpectedvalue=\"{0}\"\n", this.getExpectedvalue());
        str += MessageFormat.format("\tProfilepoint=\"{0}\"\n", this.getProfilepoint());
        str += MessageFormat.format("\tTrice=\"{0}\"\n", this.getTrice());
        str += MessageFormat.format("\tCreatetime=\"{0}\"\n", this.getCreatetime());
        str += MessageFormat.format("\tCreateuser=\"{0}\"\n", this.getCreateuser());
        str += MessageFormat.format("\tUpdatetime=\"{0}\"\n", this.getUpdatetime());
        str += MessageFormat.format("\tUpdateuser=\"{0}\"\n", this.getUpdateuser());
        str += MessageFormat.format("\tDescription=\"{0}\"\n", this.getDescription());;
        return str;
                        
	}

}

