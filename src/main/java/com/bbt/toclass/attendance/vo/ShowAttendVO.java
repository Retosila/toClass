package com.bbt.toclass.attendance.vo;

import java.util.List;

public class ShowAttendVO {

	/*
	 * 
	 * ShowAttendVO는 프론트단에서 반복문을 통해 출결정보를 출력하기 위해 "AttendVO를 압축한" VO 객체이다.
	 * 
	 * mapper.attendance.getAttendanceInfoByDTO 쿼리문을 통해 select을 하게 되면 최대 5개의 레코드(월~금)가 조회되게 될 텐데,
	 * 이는 즉 하나의 AttendDTO를 통해 5개의 AttendVO를 반환받게 된다는 뜻이다. 
	 * 하지만, ShowAttendVO라는 새로운 VO 객체를 만든 후, 이를 하나의 회원이름, 5개의 출결상태, 출결시간을 담은 List 객체 두 개를 멤버변수(프로퍼티)로 갖도록 하면
	 * 하나의 객체 내에 한 회원 일주일간의 출결정보를 전부 집어넣을 수 있다. 
	 * 
	 */
	
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
