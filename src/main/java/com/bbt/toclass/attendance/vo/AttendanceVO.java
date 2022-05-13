package com.bbt.toclass.attendance.vo;

import java.sql.Date;
import org.springframework.stereotype.Component;

@Component("attendanceVO")
public class AttendanceVO {
	private String attendance_id;
	private String class_id;
	private String member_email;
	private String attendance_status;
	private Date attendance_regdate;
	private Date attendance_moddate;
	
	
	
	//생성자
	public AttendanceVO() {
		
	}
	
	public AttendanceVO(String attendance_id, String class_id, String member_email,
			String attendance_status,Date attendance_regdate, Date attendance_moddate) {
		this.attendance_id = attendance_id;
		this.class_id = class_id;
		this.member_email = member_email;
		this.attendance_status = attendance_status;
		this.attendance_regdate = attendance_regdate;
		this.attendance_moddate = attendance_moddate;
	}
	
	
	public String getAttendance_id() {
		return attendance_id;
	}
	public void setAttendance_id(String attendance_id) {
		this.attendance_id = attendance_id;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getAttendance_status() {
		return attendance_status;
	}
	public void setAttendance_status(String attendance_status) {
		this.attendance_status = attendance_status;
	}
	public Date getAttendance_regdate() {
		return attendance_regdate;
	}
	public void setAttendance_regdate(Date attendance_regdate) {
		this.attendance_regdate = attendance_regdate;
	}
	public Date getAttendance_moddate() {
		return attendance_moddate;
	}
	public void setAttendance_moddate(Date attendance_moddate) {
		this.attendance_moddate = attendance_moddate;
	}
	
	
	

}
