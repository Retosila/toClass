package com.bbt.toclass.myclass.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bbt.toclass.member.vo.MemberVO;
import com.bbt.toclass.myclass.service.MyclassService;
import com.bbt.toclass.myclass.vo.MyclassVO;

@Controller("myclassController")
public class MyclassControllerImpl implements MyclassController{
	
	@Autowired
	private MyclassService myclassService;
	
	@Override
	@RequestMapping(value = "/myclass/teacher", method = RequestMethod.GET)
	@ResponseBody
	public String myclass_teacher(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		return "/myclass/myclass_teacher";
		
	}

	@RequestMapping(value = "/myclass/getStuCnt.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getStuCnt(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView("jsonView");
		response.setCharacterEncoding("UTF-8");

		String email = ((MemberVO) session.getAttribute("member")).getMember_email();
		String name = ((MemberVO) session.getAttribute("member")).getMember_name();
		
		if(email != null) {
			int cnt = myclassService.getStudentCnt(email);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name", name);
			map.put("email", email);
			map.put("stuCnt", cnt);
			
			mav.addAllObjects(map);
		}
		
		return mav;
		
	}
	
	@RequestMapping(value = "/myclass/saveMyClass.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView saveMyClass(@RequestBody @ModelAttribute MyclassVO myclassVo,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView("jsonView");
		
		String email = ((MemberVO) session.getAttribute("member")).getMember_email();
//		myclassVo.setClass_code();
		myclassService.saveMyclass(myclassVo);
		
		System.out.println(myclassVo.getClass_name());
		System.out.println(myclassVo.getClass_year());
		
		return mav;
	}
//	
//	/myclass/getStuCnt.do
//		
//	/myclass/saveMyClass.do
}

