package com.bbt.toclass.schedule.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("scheduleController")
public class ScheduleControllerImpl implements ScheduleController {

	/*
	 * 
	 *  
	 *  뷰 페이지 매핑 (뷰 페이지의 논리 이름과 요청명을 일치시킬 것)
	 *  
	 *  
	 */
	
	@RequestMapping(value = {"/schedule/calendar"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myAttendance(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인 확인 로직
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView("calendar");
		if ((boolean)session.getAttribute("logOn") != true) {
	       mav.setViewName("redirect:/login");
	       return mav;
		}
		return mav;
	}
	
}
