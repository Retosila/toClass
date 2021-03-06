package com.bbt.toclass.attendance.controller;

import com.bbt.toclass.attendance.service.AttendanceService;
import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.MyAttendVO;
import com.bbt.toclass.attendance.vo.NewAttendVO;
import com.bbt.toclass.attendance.vo.ShowAttendVO;
import com.bbt.toclass.member.service.MemberService;
import com.bbt.toclass.member.vo.ClassVO;
import com.bbt.toclass.member.vo.MemberVO;

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
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller("attendanceController")
public class AttendanceControllerImpl implements AttendanceController{
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);

	@Autowired
	AttendanceService attendanceService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	MemberService memberService;

	@RequestMapping(value = { "/attendance/attendance"}, method = RequestMethod.GET)
	public ModelAndView attendance( String member_email, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		ModelAndView mav = new ModelAndView("attendance");

		logger.info("?????? ?????? ????????????");
		ArrayList<String> week = WeekDay();
		request.setAttribute("week", week.get(0));
		request.setAttribute("week1", week.get(1));
		request.setAttribute("week2", week.get(2));
		request.setAttribute("week3", week.get(3));
		request.setAttribute("week4", week.get(4));

		System.out.println(week);

		logger.info("?????? ?????? ????????????");
		String t_day = toDay();
		request.setAttribute("t_day", t_day);

		logger.info("?????? ?????? ????????????");

		//currentClass??? null??? ?????? ???, ????????? ????????????
		MemberVO member = (MemberVO) session.getAttribute("member");
		System.out.println(member);
		String currentClass = "";
		if(member.getCurrentClass() != null) {
			currentClass = member.getCurrentClass();
		 }

		//member_type??? ????????? ??? ????????? ???????????? ?????? ????????? ????????? ???????????? ???????????? ??????
		String member_type = member.getMember_type();

		if(currentClass != null || currentClass !="") {
			  logger.info("?????? ?????? ?????? : " + currentClass);
			  logger.info("???????????? : " + member_type);

			  logger.info("???????????? ?????? ?????? : getMyClassInfo");
			  ClassVO myClass = memberService.getMyClassInfo(currentClass);
			  logger.info("???????????? ?????? ?????? : getMyClassInfo");
			  	mav.addObject("myClass",myClass); }

		  if(member_type.equals("??????")) {
			  List<ShowAttendVO> savoList = new ArrayList<ShowAttendVO>();
			  List<String> emailList = attendanceService.getClassMemberEmail(currentClass);
			  for(int i = 0; i< emailList.size(); i++) {
				  AttendDTO attendDTO = new AttendDTO();

				  String email = emailList.get(i);
				  attendDTO.setMember_email(email);
				  attendDTO.setMonday(week.get(0));

				  attendDTO.setFriday(week.get(5));

		  ShowAttendVO savo = attendanceService.getAttendanceInfo(attendDTO);
		  savoList.add(savo);

		  }
			  mav.addObject("ShowAttendVOList", savoList);
		  } else {
			  logger.info("????????? ??? ?????? ??????");
			  }

		return mav;
	}

	// ????????? (????????? ??????)
	@RequestMapping(value = {"/attendance/attendance_student"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView attendance_student(String member_email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("attendance_student");
		return mav;

	}

	//?????? ?????? Ajax??? DB??? ??????
	@RequestMapping(value = {"/attendance/insertAttend.do"}, method = {RequestMethod.POST}, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String insertAttendDo(@RequestParam Map<String, String> param, HttpServletRequest request, HttpServletResponse response ) throws Exception {
		// ?????? ?????? ?????????
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		//ajax ?????? ?????? ????????? ??????
		logger.info("?????? insert ??????");
		String attend_status = (String)param.get("attend_status");
		String member_name = (String)param.get("member_name");
		String currentClass = (String)param.get("currentClass");

		logger.info("???????????? : " + attend_status);
		logger.info("?????? ?????? : " + member_name);
		logger.info("?????? : " + currentClass);

		NewAttendVO newAttend = new NewAttendVO();
		newAttend.setAttend_status(attend_status);
		newAttend.setMember_name(member_name);
		newAttend.setCurrentClass(currentClass);

		int result = attendanceService.insertAttend(newAttend);
		
		if(result > 0) {
			logger.info(result + "?????? ?????? ????????? ?????? ??????");
		}
		else {
			logger.info("?????? ????????? ?????? ??????");
		}
		
		// ????????? ?????? ????????? ????????????
		ArrayList<String> week = WeekDay();
		request.setAttribute("week", week.get(0));
		request.setAttribute("week1", week.get(1));
		request.setAttribute("week2", week.get(2));
		request.setAttribute("week3", week.get(3));
		request.setAttribute("week4", week.get(4));

		String t_day = toDay();
		request.setAttribute("t_day", t_day);

		//currentClass??? null??? ?????? ???, ????????? ????????????
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String currentClass2 = "";
		if(member.getCurrentClass() != null) {
			currentClass2 = member.getCurrentClass();
		 }

		List<ShowAttendVO> savoList = new ArrayList<ShowAttendVO>();
		List<String> emailList = attendanceService.getClassMemberEmail(currentClass2);
		for(int i = 0; i< emailList.size(); i++) {
			  AttendDTO attendDTO = new AttendDTO();

			  String email = emailList.get(i);
			  attendDTO.setMember_email(email);
			  attendDTO.setMonday(week.get(0));

			  attendDTO.setFriday(week.get(5));

			  ShowAttendVO savo = attendanceService.getAttendanceInfo(attendDTO);
			  savoList.add(savo);
		} 

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());
		
		int pendency = 0;
		int attend = 0;
		int absence = 0;
		int leaveEarly = 0;
		int lateness = 0;
		int sum = 0;

		pendency = savoList.size();
		sum = savoList.size();
		
		for (int i = 0; i < savoList.size(); i++) {
			List<String> attend_status2 = savoList.get(i).getAttend_status();
			List<String> attend_time = savoList.get(i).getAttend_time();
			for (int j = 0; j < attend_status2.size(); j++) {
				
				String thisTime = attend_time.get(j);
				if (attend_time.get(j) == null) {
					break;
				}
				
				String thisStatus = attend_status2.get(j);
				thisTime = thisTime.substring(0,10);
				if (thisTime.equals(strToday)) {
					if (thisStatus.equals("??????")) {
						attend++;
						pendency--;
					}
					else if (thisStatus.equals("??????")) {
						leaveEarly++;
						pendency--;
					}
					else if (thisStatus.equals("??????")) {
						lateness++;
						pendency--;
					}
					else if (thisStatus.equals("??????")) {
						absence++;
						pendency--;
					}
					else {}
				}
			}
			
		}  
		
		Map<String, Integer> temp = new HashMap<String, Integer>();
		temp.put("pendency", pendency);
		temp.put("attend", attend);
		temp.put("absence", absence);
		temp.put("leaveEarly", leaveEarly);
		temp.put("lateness", lateness);
		temp.put("sum", sum);
		
		JSONArray temp2 = JSONArray.fromObject(temp);
		// ?????? ????????? json ???????????? ????????? ???????????? ??????
		String resp = temp2.toString();
		  
		return resp;  
	}
	
	
	// ajax : ?????? ?????? ????????????
	// produces ????????? ?????? ?????? ?????????
	@RequestMapping(value = {"/schedule/getAttendance.do"}, method = {RequestMethod.POST}, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getAttendanceDo(@RequestParam Map<String, String> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String member_email = (String)param.get("member_email");
		
		// ?????? ?????? ?????????
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		logger.info("ajax ?????? : " + member_email + "??? ?????? ??????");
		// ????????? ????????? ?????? ?????? ???????????? list ???????????? ??????
		List<MyAttendVO> mavoList = attendanceService.getAttendance(member_email);
		for (MyAttendVO mavo : mavoList) {
			logger.info("title : " + mavo.getTitle());
			logger.info("start : " + mavo.getStart());
		}
		
		// list ????????? ?????? ????????? json ???????????? ??????
		JSONArray result = JSONArray.fromObject(mavoList);
		// ?????? ????????? json ???????????? ????????? ???????????? ??????
		String resp = result.toString();
		logger.info(resp);
		
		// ajax ????????? ?????? resp ????????? ??????
		return resp;
	}


	//?????? ????????? ???????????? ???~?????? ?????? ???????????? arraylist??? ??? ??????
		private ArrayList<String> WeekDay() {

			//????????????
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd",Locale.KOREAN);
			String time = sdf.format(System.currentTimeMillis());
			Calendar cal = Calendar.getInstance();
			//cal.setTime(date);
			ArrayList<String> day = new ArrayList<String>();
			for(int i=2;i<=7;i++) {
				cal.add(Calendar.DATE, i- cal.get(Calendar.DAY_OF_WEEK));
				String w_day = sdf.format(cal.getTime());
				day.add(w_day);
				//cal.add(Calendar.DATE, 6- cal.get(Calendar.DAY_OF_WEEK));
				//return sdf.format(cal.getTime());
			}
			System.out.println(day);
			return day;

		}

		//?????? ?????? ????????????
		private String toDay() {
			LocalDate now = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M??? d??? (E)");
			String formatedNow = now.format(formatter);
			System.out.println(formatedNow);
				return formatedNow;
				}
}
