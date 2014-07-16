﻿/**
  * @ ChengQiyi create in 2014-7-13 16:09:15 by Template at 2014年6月25日21:26:55
  * This class generated by CodeSmith Generator
  */

package hply.domain;

import java.io.Serializable;
import java.util.Date;
import java.text.MessageFormat;
import hply.common.Utils;
import org.apache.commons.lang3.StringUtils;


/**
  * 模型类，对应的数据库表： [t_sys_user]
  * 
  */
public class SysUser implements Serializable {
        
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
		
        
  private String loginname;
  
/**
  * 读，数据库列： LoginName  
  * 
  */
	public String getLoginname() {
        return StringUtils.trimToEmpty(loginname);
	}

/**
  * 写，数据库列：LoginName  
  * 
  */
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
		
        
  private String realname;
  
/**
  * 读，数据库列： RealName  
  * 
  */
	public String getRealname() {
        return StringUtils.trimToEmpty(realname);
	}

/**
  * 写，数据库列：RealName  
  * 
  */
	public void setRealname(String realname) {
		this.realname = realname;
	}
		
        
  private String organizationid;
  
/**
  * 读，数据库列： OrganizationID  
  * 
  */
	public String getOrganizationid() {
        return StringUtils.trimToEmpty(organizationid);
	}

/**
  * 写，数据库列：OrganizationID  
  * 
  */
	public void setOrganizationid(String organizationid) {
		this.organizationid = organizationid;
	}
		
        
  private String password;
  
/**
  * 读，数据库列： Password  
  * 
  */
	public String getPassword() {
        return StringUtils.trimToEmpty(password);
	}

/**
  * 写，数据库列：Password  
  * 
  */
	public void setPassword(String password) {
		this.password = password;
	}
		
        
  private String lastloginip;
  
/**
  * 读，数据库列： LastLoginIP  
  * 
  */
	public String getLastloginip() {
        return StringUtils.trimToEmpty(lastloginip);
	}

/**
  * 写，数据库列：LastLoginIP  
  * 
  */
	public void setLastloginip(String lastloginip) {
		this.lastloginip = lastloginip;
	}
		
        
  private Date lastlogintime;
  
/**
  * 读，数据库列： LastLoginTime  
  * 
  */
	public Date getLastlogintime() {
		return lastlogintime;
	}

/**
  * 写，数据库列：LastLoginTime  
  * 
  */
	public void setLastlogintime(Date lastlogintime) {
		this.lastlogintime = lastlogintime;
	}
		
        
  private int fails;
  
/**
  * 读，数据库列： Fails  
  * 
  */
	public int getFails() {
		return fails;
	}

/**
  * 写，数据库列：Fails  
  * 
  */
	public void setFails(int fails) {
		this.fails = fails;
	}
		
        
  private int logined;
  
/**
  * 读，数据库列： Logined  
  * 
  */
	public int getLogined() {
		return logined;
	}

/**
  * 写，数据库列：Logined  
  * 
  */
	public void setLogined(int logined) {
		this.logined = logined;
	}
		
        
  private String position;
  
/**
  * 读，数据库列： Position  
  * 
  */
	public String getPosition() {
        return StringUtils.trimToEmpty(position);
	}

/**
  * 写，数据库列：Position  
  * 
  */
	public void setPosition(String position) {
		this.position = position;
	}
		
        
  private int enabled;
  
/**
  * 读，数据库列： Enabled  
  * 
  */
	public int getEnabled() {
		return enabled;
	}

/**
  * 写，数据库列：Enabled  
  * 
  */
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
		
        
  private int orderby;
  
/**
  * 读，数据库列： OrderBY  
  * 
  */
	public int getOrderby() {
		return orderby;
	}

/**
  * 写，数据库列：OrderBY  
  * 
  */
	public void setOrderby(int orderby) {
		this.orderby = orderby;
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
        str += MessageFormat.format("\tLoginname=\"{0}\"\n", this.getLoginname());
        str += MessageFormat.format("\tRealname=\"{0}\"\n", this.getRealname());
        str += MessageFormat.format("\tOrganizationid=\"{0}\"\n", this.getOrganizationid());
        str += MessageFormat.format("\tPassword=\"{0}\"\n", this.getPassword());
        str += MessageFormat.format("\tLastloginip=\"{0}\"\n", this.getLastloginip());
        str += MessageFormat.format("\tLastlogintime=\"{0}\"\n", this.getLastlogintime());
        str += MessageFormat.format("\tFails=\"{0}\"\n", this.getFails());
        str += MessageFormat.format("\tLogined=\"{0}\"\n", this.getLogined());
        str += MessageFormat.format("\tPosition=\"{0}\"\n", this.getPosition());
        str += MessageFormat.format("\tEnabled=\"{0}\"\n", this.getEnabled());
        str += MessageFormat.format("\tOrderby=\"{0}\"\n", this.getOrderby());
        str += MessageFormat.format("\tCreatetime=\"{0}\"\n", this.getCreatetime());
        str += MessageFormat.format("\tCreateuser=\"{0}\"\n", this.getCreateuser());
        str += MessageFormat.format("\tUpdatetime=\"{0}\"\n", this.getUpdatetime());
        str += MessageFormat.format("\tUpdateuser=\"{0}\"\n", this.getUpdateuser());
        str += MessageFormat.format("\tDescription=\"{0}\"\n", this.getDescription());;
        return str;
                        
	}

}

