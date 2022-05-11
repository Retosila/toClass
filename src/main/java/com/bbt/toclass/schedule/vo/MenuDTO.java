package com.bbt.toclass.schedule.vo;

import org.springframework.stereotype.Component;

import java.sql.Date;

@Component("menuDTO")
public class MenuDTO {

	private Date menu_date;
	private Date monday;
	private Date friday;

	public Date getMonday() {
		return monday;
	}
	public void setMonday(Date monday) {
		this.monday = monday;
	}
	public Date getFriday() {
		return friday;
	}
	public void setFriday(Date friday) {
		this.friday = friday;
	}
	public Date getMenu_date() {
		return menu_date;
	}
	public void setMenu_date(Date menu_date) {
		this.menu_date = menu_date;
	}

}
