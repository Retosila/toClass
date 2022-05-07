package com.bbt.toclass.myclass.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.bbt.toclass.member.vo.MemberVO;
import com.bbt.toclass.myclass.vo.MyclassVO;

import net.sf.json.JSONObject;

public interface MyclassController {
	public String myclass_teacher(HttpServletRequest request, HttpServletResponse response);
	
	public ModelAndView getStuCnt(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException;

	public ModelAndView saveMyClass(@RequestBody @ModelAttribute MyclassVO myclassVo,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException;
}
