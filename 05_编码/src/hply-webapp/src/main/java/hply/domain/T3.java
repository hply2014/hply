package hply.domain;

import java.io.Serializable;
import java.util.Date;

public class T3 implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7957645357018534917L;
	private String id;
	private String t1;
	private Date t2;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getT1() {
		return t1;
	}

	public void setT1(String t1) {
		this.t1 = t1;
	}

	public Date getT2() {
		return t2;
	}

	public void setT2(Date t2) {
		this.t2 = t2;
	}

	public String getT3() {
		return t3;
	}

	public void setT3(String t3) {
		this.t3 = t3;
	}

	private String t3;
}
