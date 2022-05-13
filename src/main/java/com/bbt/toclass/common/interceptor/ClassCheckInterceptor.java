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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.bbt.toclass.member.vo.MemberVO;

// 로그온 체크용 인터셉터
public class ClassCheckInterceptor extends HandlerInterceptorAdapter {
	
	// log4j 로깅용
	private static final Logger logger = LoggerFactory.getLogger(LogOnCheckInterceptor.class);
	
	// 출결, 성적, 일정, 커뮤니티 기능 접근 시, 소속 클래스 확인
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("요청 URI : " + request.getRequestURI());
		logger.info("클래스가 필요한 서비스");
		logger.info("classCheckInterceptor 호출");
		
		HttpSession session = request.getSession();
		
		// 소속 클래스 확인
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		// null처리
		String currentClass = null;
		if (mvo.getCurrentClass() != null) {
			currentClass = mvo.getCurrentClass();
		}
		
		// contextPath
		String contextPath = request.getContextPath();
		
		// 소속 클래스 정보가 없을 시 myClass로 리다이렉트
		if (currentClass == null) {
			// 클래스 요구 멘트
			FlashMap flashMap = new FlashMap();
			flashMap.put("msg", "학급 가입 후 이용할 수 있는 서비스입니다.");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			
			response.sendRedirect(contextPath + "/member/myClass");
			logger.info("/member/myClass로 리다이렉트");
			return false;
		}
		
		else {
			logger.info("소속 학급 : " + currentClass);
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