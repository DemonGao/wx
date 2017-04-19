package com.wxkf.Po;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Job {

	private Long job_id;		//职位id
	private String job_name;	//职位名称
	private int job_salary; 	//工资
	private String job_limittime;//期限
	private Long job_time;//发布时间
	private String job_education;//学历
	private String job_label;	//职位标签
	private String job_recivenum;//招聘人数
	private String job_require;//职位要求
	private String job_type;//职位分类
	private String job_style;//工作类型  全职 兼职 实习
	private int job_delete;//是否隐藏
	private CompanyInfo companyinfo;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)   //@GeneratedValue  一样
	@Column(length=20,unique=true)
	public Long getJob_id() {
		return job_id;
	}
	public void setJob_id(Long job_id) {
		this.job_id = job_id;
	}
	@Column(length=20)
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	@Column(length=20)
	public int getJob_salary() {
		return job_salary;
	}
	public void setJob_salary(int job_salary) {
		this.job_salary = job_salary;
	}
	@Column(length=20)
	public String getJob_limittime() {
		return job_limittime;
	}
	public void setJob_limittime(String job_limittime) {
		this.job_limittime = job_limittime;
	}
	@Column(length=20)
	public String getJob_education() {
		return job_education;
	}
	public void setJob_education(String job_education) {
		this.job_education = job_education;
	}
	@Column(length=100)
	public String getJob_label() {
		return job_label;
	}
	public void setJob_label(String job_label) {
		this.job_label = job_label;
	}
	@Column(length=20)
	public String getJob_recivenum() {
		return job_recivenum;
	}
	public void setJob_recivenum(String job_recivenum) {
		this.job_recivenum = job_recivenum;
	}
	@Column(length=500)
	public String getJob_require() {
		return job_require;
	}
	public void setJob_require(String job_require) {
		this.job_require = job_require;
	}
	@Column(length=20)
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	
	@Column(length=20)
	public String getJob_style() {
		return job_style;
	}
	public void setJob_style(String job_style) {
		this.job_style = job_style;
	}
	@Column(length=20)
	public Long getJob_time() {
		return job_time;
	}
	public void setJob_time(Long job_time) {
		this.job_time = job_time;
	}
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="company_id")//设置外键字段为user_id
	public CompanyInfo getCompanyinfo() {
		return companyinfo;
	}
	public void setCompanyinfo(CompanyInfo companyinfo) {
		this.companyinfo = companyinfo;
	}
	@Column(length=2)
	public int getJob_delete() {
		return job_delete;
	}
	public void setJob_delete(int job_delete) {
		this.job_delete = job_delete;
	}
	
	
}
