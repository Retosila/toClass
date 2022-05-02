package com.bbt.toclass.attendance.controller;

import java.util.ArrayList;
import java.util.List;

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

@Controller("attendanceController")
public class AttendanceControllerImpl implements AttendanceController{
	
	@Autowired
	AttendanceService attendanceService;
	
	@RequestMapping(value = { "/attendance/attendance"}, method = RequestMethod.GET)
	public ModelAndView attendance(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("attendance");
		
		/*
		 * 위 url로 요청을 받는 순간(=출결관리 메뉴를 클릭하는 순간) 아래와 같은 로직을 실행한다.
		 * 
		 * -- 교사 회원의 요청이라고 가정한다(이 부분은, member_type.equals("교사")를 통해 분기시킬 수 있음)
		 * 0. 세션에서 member_email 정보를 받아온다음, 해당 정보를 바탕으로 DB에 "해당 이메일을 가진 교사와 동일한 학급에 소속된 학생의 이메일 정보들"을 추출한다.
		 *   -> ex) neru@naver.com 선생이 관리하는 reto@naver.com, lala@naver.com....
		 *   -> 해당 이메일 정보들은 List<String>의 형태로 저장해둔다.
		 * 1. 현재 날짜를 기준으로 이번 주 월요일과 금요일 날짜를 받아온다.
		 * 2. 
		 * 3. List<String>의 size만큼 for문을 돌려 아래와 같은 방식으로 AttendDTO 객체를 만들고 
		 * 
		 */
		
		
		
		List<ShowAttendVO> savoList = new ArrayList<ShowAttendVO>();
		
		AttendDTO attendDTO = new AttendDTO();
		attendDTO.setMember_email("reto@naver.com");
		attendDTO.setMonday("2022-04-25");
		attendDTO.setFriday("2022-04-29");
		ShowAttendVO savo = attendanceService.getAttendanceInfo(attendDTO);
		savoList.add(savo);
		
		AttendDTO attendDTO2 = new AttendDTO();
		attendDTO2.setMember_email("neru@naver.com");
		attendDTO2.setMonday("2022-04-25");
		attendDTO2.setFriday("2022-04-29");
		ShowAttendVO savo2 = attendanceService.getAttendanceInfo(attendDTO2);
		savoList.add(savo2);
		
		
		
		mav.addObject("ShowAttendVOList", savoList);
		
		return mav;
	}
	
	

}
