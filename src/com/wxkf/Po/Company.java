package com.wxkf.Po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Company {
	private String openid;
	private String company_username;
	private String company_password;
	private String company_email;
	private Long company_time;
	private int status;
	
	@Id
	@Column(length=30)
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	
	@Column(length=20)
	public String getCompany_username() {
		return company_username;
	}
	public void setCompany_username(String company_username) {
		this.company_username = company_username;
	}
	
	@Column(length=20)
	public String getCompany_password() {
		return company_password;
	}
	public void setCompany_password(String company_password) {
		this.company_password = company_password;
	}
	
	@Column(length=40)
	public String getCompany_email() {
		return company_email;
	}
	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}
	
	@Column(length=20)
	public Long getCompany_time() {
		return company_time;
	}
	public void setCompany_time(Long company_time) {
		this.company_time = company_time;
	}
	
	@Column(length=1,columnDefinition="INT default 0")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
