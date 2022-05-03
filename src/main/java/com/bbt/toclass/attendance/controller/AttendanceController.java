package com.bbt.toclass.attendance.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AttendanceController {
	
	public ModelAndView attendance(HttpServletRequest request, HttpServletResponse response);
	
	public ModelAndView attendance2(HttpServletRequest request, HttpServletResponse response);

	
}
