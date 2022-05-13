package com.bbt.toclass.schedule.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bbt.toclass.member.vo.MemberVO;
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
	
	// 학사 캘린더
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
	
	// 임시 매핑용
	@RequestMapping(value = {"/schedule/undefined"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView temp(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		// undefined로 요청이 올 경우 일단 학사캘린더로 가도록 함
		mav.setViewName("calendar");
		
		return mav;
	}
	
	/*
	 * 
	 *  
	 *  로직 구현 (.do를 붙일 것)
	 *  
	 *  
	 */
	
	// ajax : 일정 정보 가져오기
	// produces 속성은 한글 깨짐 방지용
	@RequestMapping(value = {"/schedule/getSchedule.do"}, method = {RequestMethod.POST}, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getScheduleDo(@RequestParam Map<String, String> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String member_email = (String)param.get("member_email");
		
		// 한글 깨짐 방지용
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		logger.info("ajax 요청 : " + member_email + "의 일정 정보");
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
		String resp = result.toString();
		logger.info(resp);
		
		// ajax 요청에 대해 resp 객체를 응답
		return resp;
	}
	
	// ajax : 일정 추가 하기
	@RequestMapping(value = {"/schedule/addSchedule.do"}, method = {RequestMethod.POST}, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String addScheduleDo(@RequestParam Map<String, String> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글 깨짐 방지용
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		// ajax 요청 정보 변수에 저장
		logger.info("일정 추가 요청");
		String title = (String)param.get("title");
		String start = (String)param.get("start");
		String end = (String)param.get("end");
		String schedule_content = (String)param.get("schedule_content");
		String schedule_writer = (String)param.get("schedule_writer");
		String member_email = (String)param.get("member_email");
		String forAllCheck = (String)param.get("isForAll");
		boolean isForAll = false;
		
		if (forAllCheck.equals("true")) {
			isForAll = true;
		}
		else {
			isForAll = false;
		}
		
		logger.info("요청자 : " + member_email);
		logger.info("작성자 : " + schedule_writer);
		logger.info("일정 제목 : " + title);
		logger.info("일정 시작 : " + start);
		logger.info("일정 종료 : " + end);
		logger.info("일정 내용 : " + schedule_content);
		logger.info("일괄추가여부 : " + isForAll);
		
		// ScheduleVO 변수에 값 할당
		ScheduleVO newSchedule = new ScheduleVO();
		newSchedule.setTitle(title);
		newSchedule.setStart(start);
		newSchedule.setEnd(end);
		newSchedule.setSchedule_content(schedule_content);
		newSchedule.setSchedule_writer(schedule_writer);
		newSchedule.setMember_email(member_email);
		newSchedule.setForAll(isForAll);
		
		// 일정 정보 추가 로직 실행
		int result = scheduleService.addSchedule(newSchedule);
		
		// insert한 레코드의 개수값을 response해줌
		if (result > 0) {
			logger.info(result + " 개의 일정 추가 완료");
			String msg = "" + result + " 개의 일정 추가 완료";
			return msg;
		}
		else {
			logger.info("일정 추가 실패");
			String msg = "일정 추가 실패";
			return msg;
		}
	}
	
	// ajax : 일정 삭제하기
	@RequestMapping(value = {"/schedule/delSchedule.do"}, method = {RequestMethod.POST}, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String delScheduleDo(@RequestParam Map<String, String> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글 깨짐 방지용
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		String id = (String)param.get("id");
		String isForAllDelete = (String)param.get("isForAllDelete");
		logger.info("일정 삭제 요청 : " + id);
		logger.info("일괄 삭제 여부  : " + isForAllDelete);
		
		// 일정 정보 삭제 로직 실행
		int result = scheduleService.delSchedule(param);
		
		// delete한 레코드의 개수값을 response해줌
		if (result > 0) {
			logger.info(result + " 개의 일정 삭제 완료");
			String msg = result + " 개의 일정 삭제 완료";
			return msg;
		}
		else {
			logger.info("일정 삭제 실패");
			String msg = "일정 삭제 실패";
			return msg;
		}
		
	}
	
	
	
}
