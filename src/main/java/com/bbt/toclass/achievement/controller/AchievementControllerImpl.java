package com.bbt.toclass.achievement.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bbt.toclass.achievement.vo.AchievementVO;

@Controller("achievementController")
public class AchievementControllerImpl implements AchievementController {
	private static final Logger logger = LoggerFactory.getLogger(AchievementControllerImpl.class);
	//ㄴAchievementControllerImpl.class에 대한 로그를 콘솔창에 띄우기 위한 사전 작업인 듯 함
	
	// 성적 조회 페이지(/achievement/t_achievement.jsp)
	//요청 방식 지정 - @RequestMapping(밸류="/요청한URL", 매소드 = 리퀘스트매소드 .GET 방식(정보입력안함) 혹은 POST(정보입력함.login같은) 방식)
	//view 지정 방법 (메소드 반환 값에 따른 view page 지정)
	//방법 1: ModelAndView - setViewName()메소드 파라미터로 설정
	//방법 2:String - 메소드의 리턴 값
	@RequestMapping(value = "/achievement/t_achievement", method = RequestMethod.GET)
	public String t_achievement(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		logger.info("t_achievement.jsp 페이지 요청");
		
		return "/achievement/t_achievement";
	}
	
	// 성적 조회 페이지(/achievement/c_achievement.jsp)
	@RequestMapping(value = "/achievement/s_achievement", method = RequestMethod.GET)
	public ModelAndView s_achievement(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/achievement/s_achievement");
		
		AchievementVO avo = new AchievementVO();
		avo.setAchievement_avg("89.5");
		avo.setAchievement_final("45.6");
		mav.addObject("achievement", avo);
		
		logger.info("s_achievement.jsp 페이지 요청");
		
		return mav;
	}
	
	
}
