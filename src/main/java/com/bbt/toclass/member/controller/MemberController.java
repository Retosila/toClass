package com.bbt.toclass.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbt.toclass.member.vo.MemberVO;

public interface MemberController {

	// 페이지 매핑
	ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception;
	String findAccount(HttpServletRequest request, HttpServletResponse response) throws Exception;
	String findPw(HttpServletRequest request, HttpServletResponse response) throws Exception;
	String register_0(HttpServletRequest request, HttpServletResponse response) throws Exception;
	String register_1(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView register_2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView register_3(HttpServletRequest request, HttpServletResponse response) throws Exception;
	String registerPolicy(HttpServletRequest request, HttpServletResponse response) throws Exception;
	String registerPersonal(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 로직
	ModelAndView loginDo(@ModelAttribute MemberVO member,
			RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView sendAuthCodeDo(@RequestParam Map<String, String> param) throws Exception;
	ModelAndView checkEmailDuplicateDo(@RequestBody @ModelAttribute MemberVO member) throws Exception;	
	ModelAndView logoutDo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	void registerDo(@ModelAttribute MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView unregisterDo(RedirectAttributes rAttr, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView findAccountDo(@RequestBody @ModelAttribute MemberVO member) throws Exception;
	ModelAndView findPwDo(@RequestBody @ModelAttribute MemberVO member) throws Exception;

}
