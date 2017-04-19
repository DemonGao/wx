package com.wxkf.Po;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class CompanyInfo {
	private String openid;
	private String companyinfo_name;//名称
	private String companyinfo_img;//公司logo
	private String companyinfo_address;//详细地址
	private String companyinfo_city;//城市区域
	private String companyinfo_type;//公司性质
	private String companyinfo_style;//公司领域
	private String companyinfo_about;//公司简介
	private String companyinfo_email;//公司邮箱
	private String companyinfo_nickname;//负责人姓名
	private String companyinfo_tel;//负责人电话
	private String companyinfo_pjob;//负责人职位
	private int companyinfo_status;	//公司认证情况 0:未认证 	1:已认证
	private String companyinfo_size;	//公司规模 
	private String companyinfo_url;	//公司网址
	private String companyinfo_copy;//营业执照
	private String companyinfo_certificates;//法人身份证
	private String companyinfo_legal_person;//法人
	private Long companyinfo_uptime;	//简历修改时间
	
	private Set<Job> jobSet = new HashSet<Job>();
	@Id
	@Column(length=30)
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	@Column(length=30)
	public String getCompanyinfo_name() {
		return companyinfo_name;
	}
	public void setCompanyinfo_name(String companyinfo_name) {
		this.companyinfo_name = companyinfo_name;
	}
	@Column(length=50)
	public String getCompanyinfo_address() {
		return companyinfo_address;
	}
	public void setCompanyinfo_address(String companyinfo_address) {
		this.companyinfo_address = companyinfo_address;
	}
	@Column(length=20)
	public String getCompanyinfo_city() {
		return companyinfo_city;
	}
	public void setCompanyinfo_city(String companyinfo_city) {
		this.companyinfo_city = companyinfo_city;
	}
	@Column(length=20)
	public String getCompanyinfo_tel() {
		return companyinfo_tel;
	}
	public void setCompanyinfo_tel(String companyinfo_tel) {
		this.companyinfo_tel = companyinfo_tel;
	}
	@Column(length=100)
	public String getCompanyinfo_img() {
		return companyinfo_img;
	}
	public void setCompanyinfo_img(String companyinfo_img) {
		this.companyinfo_img = companyinfo_img;
	}
	@Column(length=500)
	public String getCompanyinfo_about() {
		return companyinfo_about;
	}
	public void setCompanyinfo_about(String companyinfo_about) {
		this.companyinfo_about = companyinfo_about;
	}
	@Column(length=20)
	public String getCompanyinfo_nickname() {
		return companyinfo_nickname;
	}
	public void setCompanyinfo_nickname(String companyinfo_nickname) {
		this.companyinfo_nickname = companyinfo_nickname;
	}
	@Column(length=30)
	public String getCompanyinfo_email() {
		return companyinfo_email;
	}
	public void setCompanyinfo_email(String companyinfo_email) {
		this.companyinfo_email = companyinfo_email;
	}
	@Column(length=2)
	public int getCompanyinfo_status() {
		return companyinfo_status;
	}
	public void setCompanyinfo_status(int companyinfo_status) {
		this.companyinfo_status = companyinfo_status;
	}
	@Column(length=10)
	public String getCompanyinfo_size() {
		return companyinfo_size;
	}
	public void setCompanyinfo_size(String companyinfo_size) {
		this.companyinfo_size = companyinfo_size;
	}
	@Column(length=50)
	public String getCompanyinfo_url() {
		return companyinfo_url;
	}
	public void setCompanyinfo_url(String companyinfo_url) {
		this.companyinfo_url = companyinfo_url;
	}
	@Column(length=20)
	public String getCompanyinfo_type() {
		return companyinfo_type;
	}
	public void setCompanyinfo_type(String companyinfo_type) {
		this.companyinfo_type = companyinfo_type;
	}
	
	@Column(length=20)
	public String getCompanyinfo_style() {
		return companyinfo_style;
	}
	public void setCompanyinfo_style(String companyinfo_style) {
		this.companyinfo_style = companyinfo_style;
	}
	
	@OneToMany(mappedBy="companyinfo",cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	public Set<Job> getJobSet() {
		return jobSet;
	}
	public void setJobSet(Set<Job> jobSet) {
		this.jobSet = jobSet;
	}
	
	@Column(length=20)
	public String getCompanyinfo_pjob() {
		return companyinfo_pjob;
	}
	public void setCompanyinfo_pjob(String companyinfo_pjob) {
		this.companyinfo_pjob = companyinfo_pjob;
	}
	
	@Column(length=50)
	public String getCompanyinfo_copy() {
		return companyinfo_copy;
	}
	public void setCompanyinfo_copy(String companyinfo_copy) {
		this.companyinfo_copy = companyinfo_copy;
	}
	@Column(length=50)
	public String getCompanyinfo_certificates() {
		return companyinfo_certificates;
	}
	public void setCompanyinfo_certificates(String companyinfo_certificates) {
		this.companyinfo_certificates = companyinfo_certificates;
	}
	@Column(length=20)
	public String getCompanyinfo_legal_person() {
		return companyinfo_legal_person;
	}
	public void setCompanyinfo_legal_person(String companyinfo_legal_person) {
		this.companyinfo_legal_person = companyinfo_legal_person;
	}
	
	@Column(length=30)
	public Long getCompanyinfo_uptime() {
		return companyinfo_uptime;
	}
	public void setCompanyinfo_uptime(Long companyinfo_uptime) {
		this.companyinfo_uptime = companyinfo_uptime;
	}
	
	

}
