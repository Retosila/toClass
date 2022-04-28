package com.bbt.toclass.attendance.controller;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AttendanceController {
	
	public ModelAndView attendance(HttpServletRequest request, HttpServletResponse response);
	
}
