package com.bbt.toclass.attendance.vo;

import java.util.List;

public class ShowAttendVO {

	private String member_name;
	private List<String> attend_status;
	private List<String> attend_time;
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public List<String> getAttend_status() {
		return attend_status;
	}
	public void setAttend_status(List<String> attend_status) {
		this.attend_status = attend_status;
	}
	public List<String> getAttend_time() {
		return attend_time;
	}
	public void setAttend_time(List<String> attend_time) {
		this.attend_time = attend_time;
	}
	
}
