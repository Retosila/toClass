package com.bbt.toclass.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller("attendanceController")
public class AttendanceControllerImp implements AttendanceController{
	@RequestMapping(value = { "/attendance/attendance"}, method = RequestMethod.GET)
	public ModelAndView attendance(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/attendance/attendance");
		return mav;

	}

}
