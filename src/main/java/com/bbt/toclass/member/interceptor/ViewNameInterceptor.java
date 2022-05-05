package com.bbt.toclass.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends HandlerInterceptorAdapter {
	@Override
	// 컨트롤러가 요청을 처리하기 전에 intercept한다음 뭔가 추가해준다음 컨트롤러에 다시 보내줌
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			String viewName = (String)request.getAttribute("viewName");
			request.setAttribute("viewName", viewName);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	
	
}
