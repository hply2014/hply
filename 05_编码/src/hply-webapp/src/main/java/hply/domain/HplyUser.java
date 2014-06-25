/**
 * @Template info: 2013/08/16, Chengqiyi, Beijing ieforever Corporation in HFP Project.
 * ChengQiyi create in 2014/6/25 19:00:47
 * This class generated by CodeSmith Generator
 */

package hply.domain;

import java.io.Serializable;
import java.util.Date;
import java.text.MessageFormat;
import hply.common.Utility;

/**
 * 模型类，对应的数据库表： [t_hply_user]
 * 
 */
public class HplyUser implements Serializable {

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

	private String loginid;

	/**
	 * 读，数据库列：login_id
	 * 
	 */
	public String getLoginId() {
		return loginid;
	}

	/**
	 * 写，数据库列：login_id
	 * 
	 */
	public void setLoginId(String loginid) {
		this.loginid = loginid;
	}

	private String password;

	/**
	 * 读，数据库列：password
	 * 
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * 写，数据库列：password
	 * 
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	private String realname;

	/**
	 * 读，数据库列：real_name
	 * 
	 */
	public String getRealName() {
		return realname;
	}

	/**
	 * 写，数据库列：real_name
	 * 
	 */
	public void setRealName(String realname) {
		this.realname = realname;
	}

	private String lastloginip;

	/**
	 * 读，数据库列：last_login_ip
	 * 
	 */
	public String getLastLoginIp() {
		return lastloginip;
	}

	/**
	 * 写，数据库列：last_login_ip
	 * 
	 */
	public void setLastLoginIp(String lastloginip) {
		this.lastloginip = lastloginip;
	}

	private Date lastlogintime;

	/**
	 * 读，数据库列：last_login_time
	 * 
	 */
	public Date getLastLoginTime() {
		return lastlogintime;
	}

	/**
	 * 写，数据库列：last_login_time
	 * 
	 */
	public void setLastLoginTime(Date lastlogintime) {
		this.lastlogintime = lastlogintime;
	}

	private int logincount;

	/**
	 * 读，数据库列：login_count
	 * 
	 */
	public int getLoginCount() {
		return logincount;
	}

	/**
	 * 写，数据库列：login_count
	 * 
	 */
	public void setLoginCount(int logincount) {
		this.logincount = logincount;
	}

	private int failcount;

	/**
	 * 读，数据库列：fail_count
	 * 
	 */
	public int getFailCount() {
		return failcount;
	}

	/**
	 * 写，数据库列：fail_count
	 * 
	 */
	public void setFailCount(int failcount) {
		this.failcount = failcount;
	}

	private Date locktime;

	/**
	 * 读，数据库列：lock_time
	 * 
	 */
	public Date getLockTime() {
		return locktime;
	}

	/**
	 * 写，数据库列：lock_time
	 * 
	 */
	public void setLockTime(Date locktime) {
		this.locktime = locktime;
	}

	private String createuserid;

	/**
	 * 读，数据库列：create_user_id
	 * 
	 */
	public String getCreateUserId() {
		return createuserid;
	}

	/**
	 * 写，数据库列：create_user_id
	 * 
	 */
	public void setCreateUserId(String createuserid) {
		this.createuserid = createuserid;
	}

	private Date createtime;

	/**
	 * 读，数据库列：create_time
	 * 
	 */
	public Date getCreateTime() {
		return createtime;
	}

	/**
	 * 写，数据库列：create_time
	 * 
	 */
	public void setCreateTime(Date createtime) {
		this.createtime = createtime;
	}

	private String enabled;

	/**
	 * 读，数据库列：enabled
	 * 
	 */
	public String getEnabled() {
		return enabled;
	}

	/**
	 * 写，数据库列：enabled
	 * 
	 */
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	private int level;

	/**
	 * 读，数据库列：level
	 * 
	 */
	public int getLevel() {
		return level;
	}

	/**
	 * 写，数据库列：level
	 * 
	 */
	public void setLevel(int level) {
		this.level = level;
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
		str += MessageFormat.format("\tLoginId=\"{0}\"\n", this.getLoginId());
		str += MessageFormat.format("\tPassword=\"{0}\"\n", this.getPassword());
		str += MessageFormat.format("\tRealName=\"{0}\"\n", this.getRealName());
		str += MessageFormat.format("\tLastLoginIp=\"{0}\"\n",
				this.getLastLoginIp());
		str += MessageFormat.format("\tLastLoginTime=\"{0}\"\n",
				this.getLastLoginTime());
		str += MessageFormat.format("\tLoginCount=\"{0}\"\n",
				this.getLoginCount());
		str += MessageFormat.format("\tFailCount=\"{0}\"\n",
				this.getFailCount());
		str += MessageFormat.format("\tLockTime=\"{0}\"\n", this.getLockTime());
		str += MessageFormat.format("\tCreateUserId=\"{0}\"\n",
				this.getCreateUserId());
		str += MessageFormat.format("\tCreateTime=\"{0}\"\n",
				this.getCreateTime());
		str += MessageFormat.format("\tEnabled=\"{0}\"\n", this.getEnabled());
		str += MessageFormat.format("\tLevel=\"{0}\"\n", this.getLevel());
		str += MessageFormat.format("\tDescription=\"{0}\"\n",
				this.getDescription());
		;
		return str;

	}

	// ======================================================================================
	// TODO: 附加的其他方法
	// ======================================================================================

}
