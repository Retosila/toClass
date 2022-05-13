package com.bbt.toclass.assignment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("assignmentController")
public class AssignmentControllerImpl implements AssignmentController {

	// 임시 매핑 : 모든 /assignment 관련 요청은 assignment.jsp로 보냄
	@Override
	@RequestMapping(value = {"/assignment/**"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView temp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("assignment");
		
		return mav;
	}
	
	
}
