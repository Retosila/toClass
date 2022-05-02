package com.bbt.toclass.attendance.vo;

import org.springframework.stereotype.Component;

@Component("attendDTO")
public class AttendDTO {

	/*
	 *  DTO는 Data Transfer Object를 말한다.
	 *  특정한 객체의 값Value을 저장하기 위한 객체인 VO와는 다르게 단순히 계층간 데이터의 전송을 위한 객체다.  
	 *   -> ex. Controller -> Service  
	 *  
	 *  AttendDTO는 현재 일자를 기준으로 특정 회원의 월~금까지의 출결 정보를 조회하기 위한 정보를 DB단에 전달하기 위한 객체다. 
	 *  
	 */
	
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
