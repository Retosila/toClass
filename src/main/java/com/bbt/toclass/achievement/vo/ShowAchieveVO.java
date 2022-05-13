package com.bbt.toclass.achievement.vo;

import java.sql.Date;
import java.util.List;



public class ShowAchieveVO {

	
	// 성적 정보
	private String member_email;
	private List<String> subject_name;
	private List<String> achievement_mid;
	private List<String> achievement_final;
	private List<String> achievement_avg;
	private List<String> achievement_rank;
	private List<String> achievement_grade;
	private List<String> achievement_year;
	private List<String> achievement_semester;
	private Date achievement_regdate;
	private Date achievement_moddate;
	
	
	private String achievement_id;
	public String getAchievement_id() {
		return achievement_id;
	}
	public void setAchievement_id(String achievement_id) {
		this.achievement_id = achievement_id;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public List<String> getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(List<String> subject_name) {
		this.subject_name = subject_name;
	}
	public List<String> getAchievement_mid() {
		return achievement_mid;
	}
	public void setAchievement_mid(List<String> achievement_mid) {
		this.achievement_mid = achievement_mid;
	}
	public List<String> getAchievement_final() {
		return achievement_final;
	}
	public void setAchievement_final(List<String> achievement_final) {
		this.achievement_final = achievement_final;
	}
	public List<String> getAchievement_avg() {
		return achievement_avg;
	}
	public void setAchievement_avg(List<String> achievement_avg) {
		this.achievement_avg = achievement_avg;
	}
	public List<String> getAchievement_rank() {
		return achievement_rank;
	}
	public void setAchievement_rank(List<String> achievement_rank) {
		this.achievement_rank = achievement_rank;
	}
	public List<String> getAchievement_grade() {
		return achievement_grade;
	}
	public void setAchievement_grade(List<String> achievement_grade) {
		this.achievement_grade = achievement_grade;
	}
	public List<String> getAchievement_year() {
		return achievement_year;
	}
	public void setAchievement_year(List<String> achievement_year) {
		this.achievement_year = achievement_year;
	}
	public List<String> getAchievement_semester() {
		return achievement_semester;
	}
	public void setAchievement_semester(List<String> achievement_semester) {
		this.achievement_semester = achievement_semester;
	}
	public Date getAchievement_regdate() {
		return achievement_regdate;
	}
	public void setAchievement_regdate(Date achievement_regdate) {
		this.achievement_regdate = achievement_regdate;
	}
	public Date getAchievement_moddate() {
		return achievement_moddate;
	}
	public void setAchievement_moddate(Date achievement_moddate) {
		this.achievement_moddate = achievement_moddate;
	}

}
