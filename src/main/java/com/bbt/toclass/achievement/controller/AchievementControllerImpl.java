package com.bbt.toclass.achievement.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("achievmentController")
public class AchievementControllerImpl implements AchievementController{
	@RequestMapping(value = { "/achievement/achievement"}, method = RequestMethod.GET)
	public ModelAndView achievement(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/achievement/achievement");
		return mav;
		
	}

}

