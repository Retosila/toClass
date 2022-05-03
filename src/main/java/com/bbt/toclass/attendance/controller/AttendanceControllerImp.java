package com.bbt.toclass.attendance.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("attendanceController")
public class AttendanceControllerImp implements AttendanceController{
	
	@Override
	@RequestMapping(value = { "/attendance/attendance"}, method = RequestMethod.GET)
	public ModelAndView attendance(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/attendance/attendance");
		return mav;
		
	}
	
	@RequestMapping(value = { "/attendance/attendance2"}, method = RequestMethod.GET)
	public ModelAndView attendance2(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/attendance/attendance2");
		return mav;
		
	}
}

