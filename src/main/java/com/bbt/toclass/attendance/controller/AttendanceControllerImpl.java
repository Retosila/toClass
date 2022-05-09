package com.bbt.toclass.attendance.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bbt.toclass.attendance.service.AttendanceService;
import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.ShowAttendVO;

@Controller("attendanceController")
public class AttendanceControllerImpl implements AttendanceController{
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	@Autowired
	AttendanceService attendanceService;
	
	@RequestMapping(value = { "/attendance/attendance"}, method = RequestMethod.GET)
	public ModelAndView attendance(String member_email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("attendance");
		
		/*
		 * 위 url로 요청을 받는 순간(=출결관리 메뉴를 클릭하는 순간) 아래와 같은 로직을 실행한다.
		 * 
		 * -- 교사 회원의 요청이라고 가정한다(이 부분은, member_type.equals("교사")를 통해 분기시킬 수 있음)
		 * 0. 세션에서 member_email 정보를 받아온다음, 해당 정보를 바탕으로 DB에 "해당 이메일을 가진 교사와 동일한 학급에 소속된 학생의 이메일 정보들을 추출한다.
		 *   -> ex) neru@naver.com 선생이 관리하는 reto@naver.com, lala@naver.com....
		 *   -> 해당 이메일 정보들은 List<String>의 형태로 저장해둔다.
		 * 1. 현재 날짜를 기준으로 이번 주 월요일과 금요일 날짜를 받아온다.
		 * 2. List<String>의 size만큼 for문을 돌려 아래와 같은 방식으로 AttendDTO 객체를 만들고 List에 담는다.
		 * 3. 배열 내의 AttendDTO 객체의 수만큼 for문을 돌려 attendanceService.getAttendanceInfo(attendDTO) 메소드를 실행한다.
		 * 4. 메소드에서 return된 값을 List<ShowAttendVO>  배열 객체에 add한다.
		 * 5. 바인딩된 데이터를 프론트단에 넘겨준다.
		 * 
		 */
		
		/*
		 * 
		 * 아래 로직은 임시로 AttendDTO 객체를 만들어서 실행해본 예시임.
		 * 위 설명과 아래의 구현 예제를 통해 기능 구현을 할 것
		 * 
		 */
		
		// 여러 개의 ShowAttendVO 객체를 담기 위한 배열 생성
		// ShowAttendVO는 일주일 치의 AttendVO 객체를 하나로 압축해둔 VO 객체임(for문을 통한 배열 탐색을 위함) 
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
