package com.wxkf.Po;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.apache.struts2.json.annotations.JSON;


@Entity
public class StudentExperience {
	private Long studentexp_id;
	private String studentexp_jobtype;//工作类型
	private String studentexp_company;//公司
	private String studentexp_jobname;//职位名称
	private String studentexp_entrytime;//入职时间
	private String studentexp_departuretime;//离职时间
	private String studentexp_describe;//工作描述
	private Student student;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)   //@GeneratedValue  一样
	@Column(length=3,unique=true)
	public Long getStudentexp_id() {
		return studentexp_id;
	}
	public void setStudentexp_id(Long studentexp_id) {
		this.studentexp_id = studentexp_id;
	}
	@Column(length=20)
	public String getStudentexp_jobtype() {
		return studentexp_jobtype;
	}
	public void setStudentexp_jobtype(String studentexp_jobtype) {
		this.studentexp_jobtype = studentexp_jobtype;
	}
	@Column(length=30)
	public String getStudentexp_company() {
		return studentexp_company;
	}
	public void setStudentexp_company(String studentexp_company) {
		this.studentexp_company = studentexp_company;
	}
	@Column(length=40)
	public void setStudentexp_jobname(String studentexp_jobname) {
		this.studentexp_jobname = studentexp_jobname;
	}
	public void setStudentexp_entrytime(String studentexp_entrytime) {
		this.studentexp_entrytime = studentexp_entrytime;
	}
	@Column(length=20)
	public String getStudentexp_entrytime() {
		return studentexp_entrytime;
	}
	public String getStudentexp_jobname() {
		return studentexp_jobname;
	}
	@Column(length=20)
	public String getStudentexp_departuretime() {
		return studentexp_departuretime;
	}
	public void setStudentexp_departuretime(String studentexp_departuretime) {
		this.studentexp_departuretime = studentexp_departuretime;
	}
	@Column(length=100)
	public String getStudentexp_describe() {
		return studentexp_describe;
	}
	public void setStudentexp_describe(String studentexp_describe) {
		this.studentexp_describe = studentexp_describe;
	}
	@JSON(serialize=false)//此字段将不转换成Json
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="student_id")//设置外键字段为user_id
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	
	
	
}
