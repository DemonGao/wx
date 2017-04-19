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
public class JobPost {

	private Long JobPost_id;
	private Job job;
	private Student student;
	private Long jobPost_time;		//学生收藏职位的时间
	/**
	 * 0:已投递
	 * 1:Hr已查看
	 * 2:标记感兴趣
	 * 3:已拒绝
	 * */
	private int jobPost_state;	//状态	0:展示	1:不展示
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)   //@GeneratedValue  一样
	@Column(length=10,unique=true)
	public Long getJobPost_id() {
		return JobPost_id;
	}
	public void setJobPost_id(Long jobPost_id) {
		JobPost_id = jobPost_id;
	}
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="job_id")//设置外键字段为job_id
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="openid")//设置外键字段为student_id
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	@Column(length=2,columnDefinition="INT default 0")
	public int getJobPost_state() {
		return jobPost_state;
	}
	public void setJobPost_state(int jobPost_state) {
		this.jobPost_state = jobPost_state;
	}
	
	@Column(length=20)
	public Long getJobPost_time() {
		return jobPost_time;
	}
	public void setJobPost_time(Long jobPost_time) {
		this.jobPost_time = jobPost_time;
	}
	
}
