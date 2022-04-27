package com.bbt.toclass.schedule.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bbt.toclass.schedule.service.ScheduleService;
import com.bbt.toclass.schedule.vo.ScheduleVO;

@Controller("scheduleController")
public class ScheduleControllerImpl implements ScheduleController {
	
	// log4j 로깅용
	private static final Logger logger = LoggerFactory.getLogger(ScheduleControllerImpl.class);
	
	// 의존성 주입
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private ScheduleVO scheduleVO;
	
	/*
	 * 
	 *  
	 *  뷰 페이지 매핑 (뷰 페이지의 논리 이름과 요청명을 일치시킬 것)
	 *  
	 *  
	 */
	
	@RequestMapping(value = {"/schedule/calendar"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myAttendance(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인 확인 로직
		logger.info("/schedule/calendar.jsp 요청");
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("logOn") == null) {
			logger.info("logOn == null : 승인되지 않은 요청");
			logger.info("로그인 화면으로 redirect");
			mav.setViewName("redirect:/login");
			return mav;
		}
		else if((boolean)session.getAttribute("logOn") == false) {
			logger.info("logOn == false : 승인되지 않은 요청");
			logger.info("로그인 화면으로 redirect");
			mav.setViewName("redirect:/login");
			return mav;
		}
		else {
			logger.info("logOn == true : 승인된 요청");
			logger.info("/schedule/calender.jsp로 이동");
			mav.setViewName("calendar");
			return mav;
		}
	}
	
}
