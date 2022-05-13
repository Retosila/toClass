package com.bbt.toclass.assignment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AssignmentController {

	ModelAndView temp(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
