package com.bbt.toclass.schedule.vo;

import org.springframework.stereotype.Component;

@Component("scheduleVO")
public class ScheduleVO {
	
	// 프로퍼티
	
	private String id;
	private String title;
	private String start;
	private String end;
	private boolean allDay;
	private boolean forAll;
	private String schedule_content;
	private String schedule_writer;
	private String member_email;
	
	// getter ~ setter
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public boolean isForAll() {
		return forAll;
	}
	public void setForAll(boolean forAll) {
		this.forAll = forAll;
	}
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	public String getSchedule_content() {
		return schedule_content;
	}
	public void setSchedule_content(String schedule_content) {
		this.schedule_content = schedule_content;
	}
	public String getSchedule_writer() {
		return schedule_writer;
	}
	public void setSchedule_writer(String schedule_writer) {
		this.schedule_writer = schedule_writer;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
}
