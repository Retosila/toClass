package com.bbt.toclass.attendance.vo;

import org.springframework.stereotype.Component;

@Component("attendDTO")
public class AttendDTO {

	private String member_email;
	private String monday;
	private String friday;
	
	
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMonday() {
		return monday;
	}
	public void setMonday(String monday) {
		this.monday = monday;
	}
	public String getFriday() {
		return friday;
	}
	public void setFriday(String friday) {
		this.friday = friday;
	}
	
}
