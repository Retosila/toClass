package com.bbt.toclass.attendance.vo;

public class MyAttendVO {

	private String title;
	private String start;
	private String backgroundColor;
	private String borderColor;
	private String allDay;
	
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
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	
	// title(출결상태)에 따라 출결블록 색상을 변경 및, 결석일 경우 allDay로
	public void addSetting() {
		if (this.title != null) {
			if (this.title.equals("출석")) {
				this.backgroundColor = "#5e72e4";
				this.setBorderColor("#5e72e4");
			}	
			else if (this.title.equals("조퇴")) {
				this.backgroundColor = "#2dce89";
				this.setBorderColor("#2dce89");
			}
			else if (this.title.equals("지각")) {
				this.backgroundColor = "#ffd600";
				this.setBorderColor("#ffd600");
			}
			else if (this.title.equals("결석")) {
				this.backgroundColor = "#EC431F";
				this.setBorderColor("#EC431F");
				this.setAllDay("1");
			}
			else {
				this.backgroundColor = "#5e72e4";
				this.setBorderColor("#5e72e4");
			}
		}
		else {
			System.out.println("Error : property-title is null");
		}
		
	}


	
}
