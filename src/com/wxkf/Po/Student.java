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
public class Student {
	private String open_id;
	private String student_name;
	private String student_gender;			//性别
	private String student_residence;		//现居地
	private String student_state;			//状态
	private String student_birthday;		//出生日期
	private String student_tel;				//电话
	private String student_mailbox;			//邮箱
	private String student_qq;				//QQ
	private String student_img;				//个人图片
	private String student_school;			//学校
	private String student_major;			//专业
	private String student_qualifications;	//学历
	private String student_time;			//更新时间
	private String student_aboutme;			//关于我
	private String student_speciality;		//专长
	private String student_skill;			//技能
	private Set<StudentExperience> studentExperience = new HashSet<StudentExperience>();
	@Id
	@Column(length=30,unique=true)
	public String getOpen_id() {
		return open_id;
	}
	public void setOpen_id(String open_id) {
		this.open_id = open_id;
	}
	@Column(length=10)
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	@Column(length=4)
	public String getStudent_gender() {
		return student_gender;
	}
	public void setStudent_gender(String student_gender) {
		this.student_gender = student_gender;
	}
	@Column(length=40)
	public String getStudent_residence() {
		return student_residence;
	}
	public void setStudent_residence(String student_residence) {
		this.student_residence = student_residence;
	}
	@Column(length=20)
	public String getStudent_state() {
		return student_state;
	}
	public void setStudent_state(String student_state) {
		this.student_state = student_state;
	}
	@Column(length=10)
	public String getStudent_birthday() {
		return student_birthday;
	}
	public void setStudent_birthday(String student_birthday) {
		this.student_birthday = student_birthday;
	}
	@Column(length=15)
	public String getStudent_tel() {
		return student_tel;
	}
	public void setStudent_tel(String student_tel) {
		this.student_tel = student_tel;
	}
	@Column(length=20)
	public String getStudent_mailbox() {
		return student_mailbox;
	}
	public void setStudent_mailbox(String student_mailbox) {
		this.student_mailbox = student_mailbox;
	}
	@Column(length=10)
	public String getStudent_qq() {
		return student_qq;
	}
	public void setStudent_qq(String student_qq) {
		this.student_qq = student_qq;
	}
	@Column(length=100)
	public String getStudent_img() {
		return student_img;
	}
	public void setStudent_img(String student_img) {
		this.student_img = student_img;
	}
	@Column(length=20)
	public String getStudent_time() {
		return student_time;
	}
	public void setStudent_time(String student_time) {
		this.student_time = student_time;
	}
	@Column(length=30)
	public String getStudent_school() {
		return student_school;
	}
	public void setStudent_school(String student_school) {
		this.student_school = student_school;
	}
	@Column(length=20)
	public String getStudent_major() {
		return student_major;
	}
	public void setStudent_major(String student_major) {
		this.student_major = student_major;
	}
	@Column(length=20)
	public String getStudent_qualifications() {
		return student_qualifications;
	}
	public void setStudent_qualifications(String student_qualifications) {
		this.student_qualifications = student_qualifications;
	}
	@Column(length=200)
	public String getStudent_aboutme() {
		return student_aboutme;
	}
	public void setStudent_aboutme(String student_aboutme) {
		this.student_aboutme = student_aboutme;
	}
	@Column(length=200)
	public String getStudent_speciality() {
		return student_speciality;
	}
	public void setStudent_speciality(String student_speciality) {
		this.student_speciality = student_speciality;
	}
	@Column(length=200)
	public String getStudent_skill() {
		return student_skill;
	}
	public void setStudent_skill(String student_skill) {
		this.student_skill = student_skill;
	}
	@OneToMany(mappedBy="student",cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	public Set<StudentExperience> getStudentExperience() {
		return studentExperience;
	}
	public void setStudentExperience(Set<StudentExperience> studentExperience) {
		this.studentExperience = studentExperience;
	}
	
	
	
	public Student(){}
}
