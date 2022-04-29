package com.bbt.toclass.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bbt.toclass.schedule.service.ScheduleService;
import com.bbt.toclass.schedule.vo.ScheduleVO;

import net.sf.json.JSONArray;

@Controller("scheduleController")
public class ScheduleControllerImpl implements ScheduleController {
	
	// log4j 로깅용
	private static final Logger logger = LoggerFactory.getLogger(ScheduleControllerImpl.class);
	
	// 의존성 주입
	@Autowired
	private ScheduleService scheduleService;
	
	/*
	 * 
	 *  
	 *  뷰 페이지 매핑 (뷰 페이지의 논리 이름과 요청명을 일치시킬 것)
	 *  
	 *  
	 */
	
	@RequestMapping(value = {"/schedule/calendar"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView calendar(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
	
	/*
	 * 
	 *  
	 *  로직 구현 (.do를 붙일 것)
	 *  
	 *  
	 */
	
	// produces 속성은 한글 깨짐 방지용
	@RequestMapping(value = {"/schedule/getSchedule.do"}, method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getScheduleDo(@RequestParam Map<String, String> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String member_email = (String)param.get("member_email");
		
		// 한글 깨짐 방지용
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		logger.info("ajax 요청 : " + member_email + "의 일정 정보");
		//ModelAndView mav = new ModelAndView("jsonView");
		// 서비스 객체를 통해 스케쥴 데이터를 list 방식으로 저장
		List<ScheduleVO> schedule = scheduleService.getSchedule(member_email);
		for (ScheduleVO s : schedule) {
			logger.info("id : " + s.getId());
			logger.info("title : " + s.getTitle());
			logger.info("start : " + s.getStart());
			logger.info("end : " + s.getEnd());
			logger.info("allDay : " + s.isAllDay());
		}
		
		// list 형식의 일정 데이터 json 데이터로 변환
		JSONArray result = JSONArray.fromObject(schedule);
		// 배열 형식의 json 데이터를 한줄의 문자열로 변환
		String data = result.toString();
		logger.info(data);
		return data;
	}
	
}
