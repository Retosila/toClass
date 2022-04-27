package com.bbt.toclass.achievement.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AchievementController {
	
	public ModelAndView achievement(HttpServletRequest request, HttpServletResponse response);

}
