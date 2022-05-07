package com.bbt.toclass.attendance.vo;

import org.springframework.stereotype.Component;

@Component("attendVO")
public class AttendVO {
	
	/*
	 * 
	 * AttendVO는 AttendDTO를 바탕으로 조회한 특정 회원의 일주일간(월~금)의 출결 정보를 담기 위한 객체이다.
	 * 회원이름, 출결정보 입력 시간, 출결상태, 이렇게 3가지의 정보를 담고 있다.
	 *  -> DTO와 크게 다를 바 없어보이지만 그냥 VO로 설정함..VO인지 DTO인지에 크게 의미를 두지 말고 그냥 무엇을 위한 객체인지만 인지할 것 
	 * 
	 */
	
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
