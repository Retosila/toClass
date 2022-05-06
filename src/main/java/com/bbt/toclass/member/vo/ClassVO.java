package com.bbt.toclass.member.vo;

import java.sql.Date;

public class ClassVO {

	// 프로퍼티
	
	private String class_id;
	private String class_name;
	private String class_code;
	private Date class_regdate;
	private Date class_moddate;
	private String class_maker;
	
	// getter ~ setter
	
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getClass_code() {
		return class_code;
	}
	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}
	public Date getClass_regdate() {
		return class_regdate;
	}
	public void setClass_regdate(Date class_regdate) {
		this.class_regdate = class_regdate;
	}
	public Date getClass_moddate() {
		return class_moddate;
	}
	public void setClass_moddate(Date class_moddate) {
		this.class_moddate = class_moddate;
	}
	public String getClass_maker() {
		return class_maker;
	}
	public void setClass_maker(String class_maker) {
		this.class_maker = class_maker;
	}
	
}
