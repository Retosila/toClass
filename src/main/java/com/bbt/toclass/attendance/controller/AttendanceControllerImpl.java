package com.bbt.toclass.attendance.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bbt.toclass.attendance.service.AttendanceService;
import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.ShowAttendVO;
import com.bbt.toclass.member.vo.MemberVO;

@Controller("attendanceController")
public class AttendanceControllerImpl implements AttendanceController{
	
	@Autowired
	AttendanceService attendanceService;
	
	@RequestMapping(value = { "/attendance/attendance"}, method = RequestMethod.GET)
	public ModelAndView attendance(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("attendance");
		
		MemberVO nowInfo = ((MemberVO) request.getSession().getAttribute("member"));
		if(nowInfo == null) {
			ModelAndView mav2 = new ModelAndView();
			request.getSession().setAttribute("logOn", false);
			mav2.setViewName("/member/login");
			return mav2;
		}
		
		if(nowInfo.getMember_type().equals("교사")) {
			List<ShowAttendVO> savoList = new ArrayList<ShowAttendVO>();
			List<String> stuEmails = attendanceService.getStuEmails(nowInfo.getMember_email());
			
			
			for(String email : stuEmails) {
				AttendDTO attendDTO = new AttendDTO();
				attendDTO.setMember_email(email);
				attendDTO.setMonday(getMonday());
				attendDTO.setFriday(getFriday());
				ShowAttendVO savo = attendanceService.getAttendanceInfo(attendDTO);
				savoList.add(savo);
			}
			
			for(ShowAttendVO saVo : savoList) {
				saVo.getAttend_status();
			}
			
			mav.addObject("allStudentCnt", savoList.size());
			mav.addObject("ShowAttendVOList", savoList);
		}
		/*
		 * 위 url로 요청을 받는 순간(=출결관리 메뉴를 클릭하는 순간) 아래와 같은 로직을 실행한다.
		 * 
		 * -- 교사 회원의 요청이라고 가정한다(이 부분은, member_type.equals("교사")를 통해 분기시킬 수 있음)
		 * 0. 세션에서 member_email 정보를 받아온다음, 해당 정보를 바탕으로 DB에 "해당 이메일을 가진 교사와 동일한 학급에 소속된 학생의 이메일 정보들"을 추출한다.
		 *   -> ex) neru@naver.com 선생이 관리하는 reto@naver.com, lala@naver.com....
		 *   -> 해당 이메일 정보들은 List<String>의 형태로 저장해둔다.
		 * 1. 현재 날짜를 기준으로 이번 주 월요일과 금요일 날짜를 받아온다.
		 * 2. List<String>의 size만큼 for문을 돌려 아래와 같은 방식으로 AttendDTO 객체를 만들고 List에 담는다.
		 * 3. 배열 내의 AttendDTO 객체의 수만큼 for문을 돌려 attendanceService.getAttendanceInfo(attendDTO) 메소드를 실행한다.
		 * 4. 메소드에서 return된 값을 List<ShowAttendVO> 배열 객체에 add한다.
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
//		List<ShowAttendVO> savoList = new ArrayList<ShowAttendVO>();
//		
//		// AttendDTO 객체 생성 : 레토의 이번주 월~금 출결 정보 탐색을 위해 필요한 정보들 
//		AttendDTO attendDTO = new AttendDTO();
//		attendDTO.setMember_email("reto@naver.com");
//		attendDTO.setMonday("2022-05-02");
//		attendDTO.setFriday("2022-05-04");
//		// DB에서 데이터를 받아온 AttendVO들을 ShowAttendVO 하나로 압축한 후 할당
//		ShowAttendVO savo = attendanceService.getAttendanceInfo(attendDTO);
//		// 생성해둔 배열객체 savoList에 ShowAttendVO 객체 추가
//		savoList.add(savo);
//		
//		AttendDTO attendDTO2 = new AttendDTO();
//		attendDTO2.setMember_email("lala@naver.com");
//		attendDTO2.setMonday("2022-05-02");
//		attendDTO2.setFriday("2022-05-04");
//		ShowAttendVO savo2 = attendanceService.getAttendanceInfo(attendDTO2);
//		savoList.add(savo2);
		
		
		// 데이터 바인딩
		
		return mav;
	}

	
	
	private String getMonday() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		cal.setTime(date);

		System.out.println("입력한 날짜 : "+sdf.format(cal.getTime()));
		cal.add(Calendar.DATE, 2 - cal.get(Calendar.DAY_OF_WEEK));
		System.out.println("평일 첫번째 요일(월요일)날짜:"+sdf.format(cal.getTime()));
		cal.setTime(date);
		return sdf.format(cal.getTime());
	}
	
	private String getFriday() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		cal.setTime(date);

		System.out.println("입력한 날짜 : "+sdf.format(cal.getTime()));
		cal.add(Calendar.DATE, 6 - cal.get(Calendar.DAY_OF_WEEK));
		System.out.println("평일 마지막 요일(금요일)날짜:"+sdf.format(cal.getTime()));
		cal.setTime(date);
		return sdf.format(cal.getTime());
	}
	
	
}




