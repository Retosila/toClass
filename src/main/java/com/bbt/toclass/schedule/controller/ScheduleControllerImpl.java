package com.bbt.toclass.schedule.controller;

import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.bbt.toclass.schedule.dto.CalendarDTO;
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
	@Autowired
	private CalendarDTO calendarDTO;
	
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
	
	@RequestMapping(value = {"/schedule/loadCalendar.do"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView loadCalendarDo(HttpSession session, 
			HttpServletRequest request, HttpServletResponse response, CalendarDTO calendarDTO) throws Exception {
		Calendar cal = Calendar.getInstance();
		CalendarDTO calendarData;
		ModelAndView mav = new ModelAndView();
		
		//검색 날짜
		if(calendarDTO.getDate().equals("") && calendarDTO.getMonth().equals("")){
			calendarDTO = new CalendarDTO(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  calendarDTO.today_info(calendarDTO);
		List<CalendarDTO> dateList = new ArrayList<CalendarDTO>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new CalendarDTO(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new CalendarDTO(String.valueOf(calendarDTO.getYear()), String.valueOf(calendarDTO.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new CalendarDTO(String.valueOf(calendarDTO.getYear()), String.valueOf(calendarDTO.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new CalendarDTO(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		//배열에 담음
		//model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		//model.addAttribute("today_info", today_info);
		//return "views/calendar";
		return mav;
	}
	
}
