package com.bbt.toclass.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.bbt.toclass.member.vo.MemberVO;

// 로그온 체크용 인터셉터
public class LogOnCheckInterceptor extends HandlerInterceptorAdapter {

	// log4j 로깅용
	private static final Logger logger = LoggerFactory.getLogger(LogOnCheckInterceptor.class);

	// 각 요청 처리 전, 로그온 여부 확인
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.info("요청 URI : " + request.getRequestURI());
		logger.info("로그인이 필요한 서비스");
		logger.info("logOnCheckInterceptor 호출");
		HttpSession session = request.getSession();
		
		// null처리
		boolean logOn = false;
		if (session.getAttribute("logOn") != null) {
			logOn = (boolean)session.getAttribute("logOn");
		}
		
		// 로그온 확인
		logger.info("logOn : " + logOn);
		// contextPath
		String contextPath = request.getContextPath();

		// logOn 정보가 false일 시 로그인 화면으로 리다이렉트
		if (logOn == false) {
			// 로그인 요구 멘트
			FlashMap flashMap = new FlashMap();
			flashMap.put("msg", "로그인이 필요한 서비스입니다");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			
			response.sendRedirect(contextPath + "/login");
			logger.info("/login으로 리다이렉트");
			return false;
		}

		else {
			MemberVO mvo = (MemberVO)session.getAttribute("member");
			logger.info("로그인된 회원 : " + mvo.getMember_email());
			logger.info("기존 요청 처리");
			return super.preHandle(request, response, handler);
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}



}
