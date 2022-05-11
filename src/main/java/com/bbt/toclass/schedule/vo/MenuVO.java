package com.bbt.toclass.schedule.vo;

import org.springframework.stereotype.Component;

@Component("menuVO")
public class MenuVO {
	
	private String menu_content;

	public String getMenu_content() {
		return menu_content;
	}

	public void setMenu_content(String menu_content) {
		this.menu_content = menu_content;
	}

}
