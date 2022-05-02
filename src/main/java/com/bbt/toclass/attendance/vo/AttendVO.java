package com.bbt.toclass.attendance.vo;

import org.springframework.stereotype.Component;

@Component("attendVO")
public class AttendVO {
	private String member_name;
	private String attend_time;
	private String attend_status;
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getAttend_time() {
		return attend_time;
	}
	public void setAttend_time(String attend_time) {
		this.attend_time = attend_time;
	}
	public String getAttend_status() {
		return attend_status;
	}
	public void setAttend_status(String attend_status) {
		this.attend_status = attend_status;
	}
	
	
}
