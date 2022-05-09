package com.bbt.toclass.achievement.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bbt.toclass.achievement.service.AchievementService;
import com.bbt.toclass.achievement.vo.AchievementVO;
import com.bbt.toclass.member.vo.MemberVO;

@Controller("achievementController")
//Controller:해당 클래스가 컨트롤러 라는 걸 나타내기 위한 어노테이션
public class AchievementControllerImpl implements AchievementController {
	private static final Logger logger = LoggerFactory.getLogger(AchievementControllerImpl.class);
	
	@Autowired
	private AchievementService achievementService;
	//의존성 주입, 해당 곳에 있는 메소드등을 쓸 수 있게 하는 작업이다.
	
	//선생님 성적 조회 페이지(/achievement/t_achievement.jsp)
	@RequestMapping(value = "/achievement/t_achievement", method = RequestMethod.GET)
	//RequestMapping:요청에 대해 어떤 Controller, 어떤 메소드가 처리할지를 맵핑하기 위한 어노테이션
	//method:필드가 물체의 상태라면, 물체의 행동에 해당하는게 메소드다. 
	//car에 이름과 번호가 있기도 하지만, car는 앞으로 전진할수도 있고 후진하는 행동도 할 수 있다.
	public ModelAndView t_achievement(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/achievement/t_achievement");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		String member_email = member.getMember_email();
		
		List<AchievementVO> avo = achievementService.getAchievement(member_email);
		
		mav.addObject("achievement", avo);
		
		
		logger.info("t_achievement.jsp 페이지 요청");
		
		return mav;
	}
	
	//학생 성적 조회 페이지(/achievement/s_achievement.jsp)
	@RequestMapping(value = "/achievement/s_achievement", method = RequestMethod.GET)
	public ModelAndView s_achievement(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 위 처럼 스트링 같은게 아니라 ModelAndView라면 addObject를 쓰는게 아니라,를 쓴다.
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/achievement/s_achievement");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		String member_email = member.getMember_email();
		
		logger.info("비즈니스 로직 요청 : achievmentService.getAchievement");
		List<AchievementVO> avoList = achievementService.getAchievement(member_email);
		logger.info("비즈니스 로직 요청 성공");
		
		mav.addObject("achievement", avoList);
		
		logger.info("s_achievement.jsp 페이지 요청");
		
		return mav;
	}
	
	
}
