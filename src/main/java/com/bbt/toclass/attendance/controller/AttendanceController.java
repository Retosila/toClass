package com.bbt.toclass.attendance.controller;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface AttendanceController {

	public ModelAndView attendance(String member_email, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception;

}
