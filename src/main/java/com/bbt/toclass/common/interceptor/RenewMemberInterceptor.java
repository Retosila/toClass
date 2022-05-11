package com.bbt.toclass.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bbt.toclass.member.service.MemberService;
import com.bbt.toclass.member.vo.MemberVO;

public class RenewMemberInterceptor extends HandlerInterceptorAdapter {
		
		// log4j 로깅용
		private static final Logger logger = LoggerFactory.getLogger(LogOnCheckInterceptor.class);
		
		@Autowired
		MemberService memberService;
		
		// 출결, 성적, 일정, 커뮤니티 및 마이페이지 접근 시 회원정보를 새로 갱신
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			logger.info("요청 URI : " + request.getRequestURI());
			logger.info("회원정보 갱신이 필요한 서비스");
			logger.info("renewMemberInterceptor 호출");
			
			HttpSession session = request.getSession();
			
			// 바인딩된 회원정보 추출
			MemberVO mvo = (MemberVO)session.getAttribute("member");
			
			// 추출된 회원 정보가 존재할 시, 새 회원정보를 바인딩
			if (mvo != null) {
				MemberVO renewedMember = memberService.login(mvo);
				session.setAttribute("member", renewedMember);
				return super.preHandle(request, response, handler);
			}
			// 회원 정보 없을 시, 기존 요청 처리
			else {
				logger.info("회원 정보 없음");
				logger.info("기존 요청 처리");
				return super.preHandle(request, response, handler);
			}
		}
		
	}