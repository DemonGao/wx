package com.wxkf.Po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="job_type") //配置关联的数据库表名
public class JobType {

	private int job_type_id;
	private String job_type_name;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)   //@GeneratedValue  一样  //作相当于mysql中设置字段自动增长
	@Column(length=10,unique=true)
	public int getJob_type_id() {
		return job_type_id;
	}
	public void setJob_type_id(int job_type_id) {
		this.job_type_id = job_type_id;
	}
	@Column(length=20)
	public String getJob_type_name() {
		return job_type_name;
	}
	public void setJob_type_name(String job_type_name) {
		this.job_type_name = job_type_name;
	}
	
	
}
