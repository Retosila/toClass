package com.bbt.toclass.attendance.vo;


import org.springframework.stereotype.Component;

@Component("newAttendVO")
public class NewAttendVO {
	private String attend_status;
	private String attend_time;
	private String member_name;
	private String currentClass;
	private String member_email;
	
	public String getAttend_status() {
		return attend_status;
	}
	public void setAttend_status(String attend_status) {
		this.attend_status = attend_status;
	}
	public String getAttend_time() {
		return attend_time;
	}
	public void setAttend_time(String attend_time) {
		this.attend_time = attend_time;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getCurrentClass() {
		return currentClass;
	}
	public void setCurrentClass(String currentClass) {
		this.currentClass = currentClass;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
}
