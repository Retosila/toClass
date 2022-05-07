package com.bbt.toclass;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

// 이렇게 해두면, com.mySpring.myapp 아래에 있는 모든 파일들에대해서
// 예외처리를 해주는 것이 가능!
@ControllerAdvice("com.mySpring.myapp")
public class ExceptionController {
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView view500Page(RuntimeException e) {
		ModelAndView view = new ModelAndView();
		view.setViewName("errors/500");
		view.addObject("message", "에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
		return view;
	}
	
}
