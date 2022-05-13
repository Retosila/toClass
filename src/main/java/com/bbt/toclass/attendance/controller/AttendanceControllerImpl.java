package com.bbt.toclass.attendance.controller;

import com.bbt.toclass.attendance.service.AttendanceService;
import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.AttendVO;
import com.bbt.toclass.attendance.vo.MyAttendVO;
import com.bbt.toclass.attendance.vo.ShowAttendVO;
import com.bbt.toclass.schedule.vo.ScheduleVO;

import net.sf.json.JSONArray;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller("attendanceController")
public class AttendanceControllerImpl implements AttendanceController{
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);

	@Autowired
	AttendanceService attendanceService;

	// 교사용
	@RequestMapping(value = { "/attendance/attendance"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView attendance(String member_email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("attendance");

		logger.info("주간 날짜 가져오기");
		ArrayList<String> week = WeekDay();
		request.setAttribute("week", week.get(0));
		request.setAttribute("week1", week.get(1));
		request.setAttribute("week2", week.get(2));
		request.setAttribute("week3", week.get(3));
		request.setAttribute("week4", week.get(4));
		System.out.println(week);

		logger.info("오늘 날짜 가져오기");
		String t_day = toDay();
		request.setAttribute("t_day", t_day);

		logger.info("출석 정보 가져오기");
		List<ShowAttendVO> savoList = new ArrayList<ShowAttendVO>();
		List<String> emailList = attendanceService.getClassMemberEmail(member_email);
		for(int i = 0; i< emailList.size(); i++) {
			AttendDTO attendDTO = new AttendDTO();

			String email = emailList.get(i);
			attendDTO.setMember_email(email);
			attendDTO.setMonday(week.get(0));

			attendDTO.setFriday(week.get(4));

			ShowAttendVO savo = attendanceService.getAttendanceInfo(attendDTO);
			savoList.add(savo);
			System.out.println(savo);
		}
		mav.addObject("ShowAttendVOList", savoList);
		return mav;
	}
	
	// 학생용 (캘린더 연동)
	@RequestMapping(value = {"/attendance/attendance_student"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView attendance_student(String member_email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("attendance_student");
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
	@RequestMapping(value = {"/schedule/getAttendance.do"}, method = {RequestMethod.POST}, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getAttendanceDo(@RequestParam Map<String, String> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String member_email = (String)param.get("member_email");
		
		// 한글 깨짐 방지용
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		logger.info("ajax 요청 : " + member_email + "의 출결 정보");
		// 서비스 객체를 통해 출결 데이터를 list 방식으로 저장
		List<MyAttendVO> mavoList = attendanceService.getAttendance(member_email);
		for (MyAttendVO mavo : mavoList) {
			logger.info("title : " + mavo.getTitle());
			logger.info("start : " + mavo.getStart());
		}
		
		// list 형식의 일정 데이터 json 데이터로 변환
		JSONArray result = JSONArray.fromObject(mavoList);
		// 배열 형식의 json 데이터를 한줄의 문자열로 변환
		String resp = result.toString();
		logger.info(resp);
		
		// ajax 요청에 대해 resp 객체를 응답
		return resp;
	}
	
	
	
	
	
	
	/*
	 * 
	 *  내부 메소드
	 * 
	 */

	//오늘 날짜를 기준으로 월~금의 날짜 가져와서 arraylist에 값 넣기
		private ArrayList<String> WeekDay() {

			//오늘날짜
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd",Locale.KOREAN);
			String time = sdf.format(System.currentTimeMillis());
			Calendar cal = Calendar.getInstance();
			//cal.setTime(date);
			ArrayList<String> day = new ArrayList<String>();
			for(int i=2;i<7;i++) {
				cal.add(Calendar.DATE, i- cal.get(Calendar.DAY_OF_WEEK));
				String w_day = sdf.format(cal.getTime());
				day.add(w_day);
				//cal.add(Calendar.DATE, 6- cal.get(Calendar.DAY_OF_WEEK));
				//return sdf.format(cal.getTime());
			}
			System.out.println(day);
			return day;

		}

		//오늘 날짜 가져오기
		private String toDay() {
			LocalDate now = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M월 d일 (E)");
			String formatedNow = now.format(formatter);
			System.out.println(formatedNow);
			return formatedNow;
		}
		
		
		
		
		
}
