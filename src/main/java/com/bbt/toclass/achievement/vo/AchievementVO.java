package com.bbt.toclass.achievement.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("achievementVO")
public class AchievementVO {
	
	
	// 성적 정보
	private String achievement_id;
	private String member_email;
	private String subject_name;
	private String achievement_mid;
	private String achievement_final;
	private String achievement_avg;
	private String achievement_rank;
	private String achievement_grade;
	private String achievement_year;
	private String achievement_semester;
	private Date achievement_regdate;
	private Date achievement_moddate;
	
	
	
	
	// 생성자
	public AchievementVO() {}
	
	public AchievementVO(String achievement_id,String member_email,String subject_name, String achievement_mid, 
			String achievement_final, String achievement_avg, String achievement_rank, String achievement_grade,
			String achievement_year,String achievement_semester, Date achievement_regdate, Date achievement_moddate) {
		this.achievement_id = achievement_id;
		this.member_email = member_email;
		this.subject_name = subject_name;
		this.achievement_mid = achievement_mid;
		this.achievement_final = achievement_final;
		this.achievement_avg = achievement_avg;
		this.achievement_rank = achievement_rank;
		this.achievement_grade = achievement_grade;
		this.achievement_year = achievement_year;
		this.achievement_semester = achievement_semester;
		this.achievement_regdate = achievement_regdate;
		this.achievement_moddate = achievement_moddate;
	}

	// 메소드
	
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

	public String getAchievement_name() {
		return subject_name;
	}

	public void setAchievement_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public String getAchievement_mid() {
		return achievement_mid;
	}

	public void setAchievement_mid(String achievement_mid) {
		this.achievement_mid = achievement_mid;
	}

	public String getAchievement_final() {
		return achievement_final;
	}

	public void setAchievement_final(String achievement_final) {
		this.achievement_final = achievement_final;
	}

	public String getAchievement_avg() {
		return achievement_avg;
	}

	public void setAchievement_avg(String achievement_avg) {
		this.achievement_avg = achievement_avg;
	}

	public String getAchievement_rank() {
		return achievement_rank;
	}

	public void setAchievement_rank(String achievement_rank) {
		this.achievement_rank = achievement_rank;
	}

	public String getAchievement_grade() {
		return achievement_grade;
	}

	public void setAchievement_grade(String achievement_grade) {
		this.achievement_grade = achievement_grade;
	}

	public String getAchievement_year() {
		return achievement_year;
	}

	public void setAchievement_year(String achievement_year) {
		this.achievement_year = achievement_year;
	}

	public String getAchievement_semester() {
		return achievement_semester;
	}

	public void setAchievement_semester(String achievement_semester) {
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
