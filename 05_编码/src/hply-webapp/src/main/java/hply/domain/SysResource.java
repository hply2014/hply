/**
  * @ ChengQiyi create in 2014/7/6 21:34:51 by Template at 2014年6月25日21:26:55
  * This class generated by CodeSmith Generator
  */

package hply.domain;

import java.io.Serializable;
import java.util.Date;
import java.text.MessageFormat;
import hply.common.Utility;


/**
  * 模型类，对应的数据库表： [t_sys_resource]
  * 
  */
public class SysResource implements Serializable {
        
  private String id;
  
/**
  * 读，数据库列：id  
  * 
  */
	public String getId() {
		return id;
	}

/**
  * 写，数据库列：id  
  * 
  */
	public void setId(String id) {
		this.id = id;
	}
		
        
  private String resCode;
  
/**
  * 读，数据库列：res_code  
  * 
  */
	public String getResCode() {
		return resCode;
	}

/**
  * 写，数据库列：res_code  
  * 
  */
	public void setResCode(String resCode) {
		this.resCode = resCode;
	}
		
        
  private String resName;
  
/**
  * 读，数据库列：res_name  
  * 
  */
	public String getResName() {
		return resName;
	}

/**
  * 写，数据库列：res_name  
  * 
  */
	public void setResName(String resName) {
		this.resName = resName;
	}
		
        
  private String icon;
  
/**
  * 读，数据库列：icon  
  * 
  */
	public String getIcon() {
		return icon;
	}

/**
  * 写，数据库列：icon  
  * 
  */
	public void setIcon(String icon) {
		this.icon = icon;
	}
		
        
  private String resPath;
  
/**
  * 读，数据库列：res_path  
  * 
  */
	public String getResPath() {
		return resPath;
	}

/**
  * 写，数据库列：res_path  
  * 
  */
	public void setResPath(String resPath) {
		this.resPath = resPath;
	}
		
        
  private String resUrl;
  
/**
  * 读，数据库列：res_url  
  * 
  */
	public String getResUrl() {
		return resUrl;
	}

/**
  * 写，数据库列：res_url  
  * 
  */
	public void setResUrl(String resUrl) {
		this.resUrl = resUrl;
	}
		
        
  private String resType;
  
/**
  * 读，数据库列：res_type  
  * 
  */
	public String getResType() {
		return resType;
	}

/**
  * 写，数据库列：res_type  
  * 
  */
	public void setResType(String resType) {
		this.resType = resType;
	}
		
        
  private int orderBy;
  
/**
  * 读，数据库列：order_by  
  * 
  */
	public int getOrderBy() {
		return orderBy;
	}

/**
  * 写，数据库列：order_by  
  * 
  */
	public void setOrderBy(int orderBy) {
		this.orderBy = orderBy;
	}
		
        
  private String parentId;
  
/**
  * 读，数据库列：parent_id  
  * 
  */
	public String getParentId() {
		return parentId;
	}

/**
  * 写，数据库列：parent_id  
  * 
  */
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
		
        
  private int enabled;
  
/**
  * 读，数据库列：enabled  
  * 
  */
	public int getEnabled() {
		return enabled;
	}

/**
  * 写，数据库列：enabled  
  * 
  */
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
		
        
  private String description;
  
/**
  * 读，数据库列：description  
  * 
  */
	public String getDescription() {
		return description;
	}

/**
  * 写，数据库列：description  
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
        str += MessageFormat.format("\tResCode=\"{0}\"\n", this.getResCode());
        str += MessageFormat.format("\tResName=\"{0}\"\n", this.getResName());
        str += MessageFormat.format("\tIcon=\"{0}\"\n", this.getIcon());
        str += MessageFormat.format("\tResPath=\"{0}\"\n", this.getResPath());
        str += MessageFormat.format("\tResUrl=\"{0}\"\n", this.getResUrl());
        str += MessageFormat.format("\tResType=\"{0}\"\n", this.getResType());
        str += MessageFormat.format("\tOrderBy=\"{0}\"\n", this.getOrderBy());
        str += MessageFormat.format("\tParentId=\"{0}\"\n", this.getParentId());
        str += MessageFormat.format("\tEnabled=\"{0}\"\n", this.getEnabled());
        str += MessageFormat.format("\tDescription=\"{0}\"\n", this.getDescription());;
        return str;
                        
	}
    
//======================================================================================
// TODO: 附加的其他方法 （ hply.domain.SysResource ）
//======================================================================================


}

