package com.wxkf.Po;

import javax.persistence.Entity;

@Entity
public class JobMsg {

	private Long jobmsg_id;								//id
	private int jobmsg_status;							//消息状态(0:)
	private Job job;									//职位
	private StudentExperience studentExperience;		//简历
}
