package com.bbt.toclass.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {

	// 회원 정보
	private String member_id;
	private String member_email;
	private String member_pw;
	private String member_name;
	private String member_phone;
	private String member_type;
	private Date member_regdate;
	private Date member_moddate;
	private String currentClass;
	
	// 생성자
	public MemberVO() {}

	public MemberVO(String member_id, String member_email, String member_pw, String member_name,
			String member_phone, String member_type, Date member_regdate, Date member_moddate, String currentClass) {
		this.member_id = member_id;
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_type = member_type;
		this.member_regdate = member_regdate;
		this.member_moddate = member_moddate;
		this.currentClass = currentClass;
	}
	
	// 메소드
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_email() {
		return member_email;
	}
	
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	public String getMember_pw() {
		return member_pw;
	}
	
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	
	public String getMember_name() {
		return member_name;
	}
	
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	public String getMember_phone() {
		return member_phone;
	}
	
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	
	public String getMember_type() {
		return member_type;
	}
	
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	
	public String getCurrentClass() {
		return currentClass;
	}
	
	public void setCurrentClass(String currentClass) {
		this.currentClass = currentClass;
	}
	
	public Date getMember_regdate() {
		return member_regdate;
	}
	
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}
	
	public Date getMember_moddate() {
		return member_moddate;
	}
	
	public void setMember_moddate(Date member_moddate) {
		this.member_moddate = member_moddate;
	}
	

}
