package com.bbt.toclass.achievement.controller;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AchievementController {
	
	public ModelAndView achievement(HttpServletRequest request, HttpServletResponse response);

}
