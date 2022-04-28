package com.bbt.toclass.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.bbt.toclass.member.service.MemberService;
import com.bbt.toclass.member.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {

	// log4j 로깅용
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);

	// 의존성 주입
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;

	/*
	 *
	 *
	 *  뷰 페이지 매핑 (뷰 페이지의 논리 이름과 요청명을 일치시킬 것)
	 *
	 *
	 */

	// 로그인 페이지(/member/login.jsp)
	@RequestMapping(value = { "/login"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();

		logger.info("login.jsp 페이지 요청");

		ModelAndView mav = new ModelAndView();
		boolean logOn = false;

		// boolean 타입 변수는 null값을 가질 수 없기에 null처리를 위해 넣음
		if (session.getAttribute("logOn") == null) {
			logOn = false;
		}
		else {
			logOn = (boolean)session.getAttribute("logOn");
		}

		// 바인딩된 회원 정보 있을 시 회원유형에 따른 메인 페이지를 출력
		MemberVO logOnMember = (MemberVO)session.getAttribute("member");
		if (logOn) {
			String member_type = logOnMember.getMember_type();
			logger.info("logOn : " + logOn);
			logger.info("이미 로그온된 회원 : " + logOnMember.getMember_email());
			logger.info("회원유형 : " + member_type);

			session.setAttribute("LogOn", true);//헤더 전환용 변경필요

			// 회원유형이 학생인 경우 main_student.jsp로 이동
			if (member_type.equals("학생")) {
				mav.setViewName("main_student");
				return mav;
			}
			// 회원유형이 교사인 경우 main_teacher.jsp로 이동
			else if (member_type.equals("교사")) {
				mav.setViewName("main_teacher");
				return mav;
			}
			else if (member_type.equals("관리자")) {
				mav.setViewName("admin");
				return mav;
			}
			else {
				mav.setViewName("/errors/undefined_error");
				return mav;
			}
		}
		else {
			session.setAttribute("logOn", false);
			logger.info("logOn : " + logOn);
		}

		mav.setViewName("/member/login");
		// 로그인 실패로 인해 redirect되었을 시 데이터 바인딩
		if (RequestContextUtils.getInputFlashMap(request) != null) {
			Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
			String result = (String)redirectMap.get("result");
			logger.info("result : " + result);
			mav.addObject("result", result);
		}
		return mav;
	}

	// 계정 찾기 페이지(/member/findAccount.jsp)
	@RequestMapping(value = "/member/findAccount", method = RequestMethod.GET)
	public String findAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		logger.info("findAccount.jsp 페이지 요청");

		return "/member/findAccount";
	}

	// 비밀번호 찾기 페이지(/member/findPw.jsp)
	@RequestMapping(value = "/member/findPw", method = RequestMethod.GET)
	public String findPw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		logger.info("findPw.jsp 페이지 요청");

		return "/member/findPw";
	}

	// 회원가입 페이지 : 0단계(/member/register_0.jsp)
	@RequestMapping(value = "/member/register_0", method = RequestMethod.GET)
	public String register_0(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		logger.info("register_0.jsp 페이지 요청");

		return "/member/register_0";
	}

	// 회원가입 페이지 : 1단계(/member/register_1.jsp)
	@RequestMapping(value = "/member/register_1", method = RequestMethod.GET)
	public String register_1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		logger.info("register_1.jsp 페이지 요청");
		HttpSession session = request.getSession();
		String member_type = request.getParameter("member_type");
		// 회원 유형을 session에 바인딩. 이후 3단계 회원가입폼에서 사용
		session.setAttribute("member_type", member_type);

		return "/member/register_1";
	}

	// 회원가입 페이지 : 1단계 : 약관
	@RequestMapping(value = "/member/policy", method = RequestMethod.GET)
	public String registerPolicy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		logger.info("policy.jsp 페이지 요청");

		return "/member/policy";
	}

	// 회원가입 페이지 : 1단계 : 개인정보
	@RequestMapping(value = "/member/personal", method = RequestMethod.GET)
	public String registerPersonal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		logger.info("personal.jsp 페이지 요청");

		return "/member/personal";
	}

	// 회원가입 페이지 : 2단계(/member/register_2.jsp)
	@RequestMapping(value = "/member/register_2", method = RequestMethod.POST)
	public ModelAndView register_2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		logger.info("register_2.jsp 페이지 요청");

		ModelAndView mav = new ModelAndView("/member/register_2");
		String policy = (String)request.getParameter("policy");
		String personal = (String)request.getParameter("personal");

		logger.info("약관동의 여부 : " + policy);
		logger.info("개인정보 동의 여부 : " + personal);

		return mav;

	}

	// 회원가입 페이지 : 3단계(/member/register_3.jsp)
	@RequestMapping(value = "/member/register_3", method = RequestMethod.POST)
	public ModelAndView register_3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		logger.info("register_3.jsp 페이지 요청");

		ModelAndView mav = new ModelAndView("/member/register_3");
		String member_email = (String)request.getParameter("member_email");

		logger.info("전송 데이터 : " + member_email);
		mav.addObject("member_email", member_email);

		return mav;

	}

	// 회원정보 페이지(/member/info.jsp)
	@RequestMapping(value = "/member/info", method = {RequestMethod.GET, RequestMethod.POST})
	public String info(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "info";
	}

	/*
	 *
	 *
	 *  로직 구현 (.do를 붙일 것)
	 *
	 *
	 */

	// 로그인 버튼 : 로그인 요청
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView loginDo(@ModelAttribute MemberVO member,
				              RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		logger.info("로그인 요청 : " + member.getMember_email());

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();

		memberVO = memberService.login(member);

		// 입력된 email&pw값과 일치하는 회원 존재할 시
		if(memberVO != null) {
			logger.info("회원 정보 조회 성공");
		    session.setAttribute("member", memberVO);
		    session.setAttribute("logOn", true);
		    String name = memberVO.getMember_name();
		    String type = memberVO.getMember_type();
		    logger.info("회원이름 : " + type);
		    logger.info("회원유형 : " + name);

		    // 회원타입에 따라 다른 메인 페이지로 분기시킴
		    if (type.equals("교사")) {
		    	mav.setViewName("main_teacher");
		    }
		    else if (type.equals("학생")) {
		    	mav.setViewName("main_student");
		    }
		    else {
		    	// 회원유형이 없는 경우(ex. 구글 로그인api 사용시) 회원유형 및 기타정보들을 받을 수 있는 페이지로 이동
		    	mav.setViewName("/errors/undefined_error");
		    }
		}

		// 입력된 email&pw값과 일치하는 회원 존재하지 않을 시
		else {
		   rAttr.addFlashAttribute("result","loginFailed");
		   logger.info("회원 정보 조회 실패");
	       mav.setViewName("redirect:/login");
		}

		logger.info("logOn : " + (boolean)session.getAttribute("logOn"));

		return mav;

	}

	// ajax : 인증번호 전송 버튼 : 입력받은 이메일로 인증번호 전송
	@Override
	@RequestMapping(value = "/member/sendAuthCode.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView sendAuthCodeDo(@RequestParam Map<String, String> param) throws Exception {
		logger.info("ajax 요청 : 인증번호 전송");
		// ajax 요청에 대한 json 응답 문제를 해결하기 위해, jsonView로 데이터를 먼저 보냄
		ModelAndView mav = new ModelAndView("jsonView");

		String authCode = (String)param.get("authCode");
		String email = (String)param.get("email");

		logger.info("전송된 인증번호 : " + authCode);
		logger.info("수신 이메일 : " + email);

		// 프론트 단에서 생성 및 요청한 인증번호를 이메일로 전송
		memberService.sendAuthCode(authCode, email);

		// ajax 요청 응답 시 오류가 나지 않도록 key:value 형식으로 응답
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "ajax request success");
		// map에 저장된 key:value 형식의 json 데이터를 전부 ModelAndView에 addObject 해줌
		mav.addAllObjects(map);

		return mav;

	}

	// ajax : 이메일 중복확인 버튼 : 입력받은 이메일이 존재 여부 확인
	@Override
	@RequestMapping(value = "/member/checkEmailDuplicate.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView checkEmailDuplicateDo(@RequestBody @ModelAttribute MemberVO member) throws Exception {
		logger.info("이메일 중복확인 요청 : " + member.getMember_email());

		ModelAndView mav = new ModelAndView("jsonView");

		String isDuplicate = memberService.checkEmailDuplicate(member);

		Map<String, String> map = new HashMap<String, String>();
		map.put("check", isDuplicate);
		map.put("success", "ajax request success");
		mav.addAllObjects(map);

		return mav;
	}

	// ajax : 계정찾기 버튼 : 입력받은 휴대폰번호값을 가진 회원을 찾아줌
	@Override
	@RequestMapping(value = "/member/findAccount.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView findAccountDo(@RequestBody @ModelAttribute MemberVO member) throws Exception {
		logger.info("계정 찾기 요청");
		logger.info("요청 회원명 : " + member.getMember_name());
		logger.info("요청 연락처 : " + member.getMember_phone());

		// json데이터 처리 위해 jsonView 뷰리졸버 사용
		ModelAndView mav = new ModelAndView("jsonView");

		String isExist = "";
		String member_email = memberService.findAccount(member);
		logger.info("findAccount 메소드 실행 성공 : " + member_email);

		// 입력한 이름&폰번호로 조회된 회원이 없을 경우
		if (member_email.equals("NA")) {
			isExist = "false";
		}
		else {
			isExist = "true";
		}

		// json 형식 데이터로 담기
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_email", member_email);
		map.put("isExist", isExist);

		// 데이터 바인딩
		mav.addAllObjects(map);

		return mav;
	}

	// ajax : 비밀번호 찾기 버튼 : 입력받은 이메일 주소로 비밀번호를 전송해줌
	@Override
	@RequestMapping(value = "/member/findPw.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView findPwDo(@RequestBody @ModelAttribute MemberVO member) throws Exception {
		logger.info("비밀번호 이메일 전송 요청");
		// json데이터 처리를 위해 jsonView 뷰리졸버로 전송
		ModelAndView mav = new ModelAndView("jsonView");

		String isExist = "";
		String member_email = member.getMember_email();

		logger.info("요청 이메일 주소 : " + member_email);

		// 이메일 전송 로직 실행 후 결과 할당
		isExist = memberService.findPw(member);

		// ajax 요청 응답 시 오류가 나지 않도록 key:value 형식으로 응답
		Map<String, String> map = new HashMap<String, String>();
		map.put("isExist", isExist);
		mav.addAllObjects(map);

		return mav;

	}


	// 회원가입 버튼 : 회원정보 DB에 insert 및 로그인 요청
	@Override
	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	public void registerDo(@ModelAttribute MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		//response.setContentType("text/html; charset=UTF-8");

		logger.info("회원가입 요청");
		logger.info("이메일 : " + member.getMember_email());
		logger.info("비밀번호 : " + member.getMember_pw());
		logger.info("이름 : " + member.getMember_name());
		logger.info("연락처 : " + member.getMember_phone());
		logger.info("유형 : " + member.getMember_type());

		// 회원정보를 DB에 기록 후, 성공 여부를 true/false로 리턴
		boolean isRegister = memberService.register(member);
		HttpSession session = request.getSession();

		if (isRegister) {
			logger.info("회원등록 성공");
			session.setAttribute("member", member);
			//session.setAttribute("logOn", true);
			// 로그인 서블릿으로 요청을 forward
			RequestDispatcher dispatch = request.getRequestDispatcher("/member/login.do");
			dispatch.forward(request, response);
			logger.info("logOn : " + (boolean)session.getAttribute("logOn"));
		}
		else {
			logger.info("회원등록 실패");
			response.sendRedirect("/errors/undefined_error");
		}

	}

	// 로그아웃 버튼 : 로그아웃
	@Override
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logoutDo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 세션에 바인딩된 데이터 제거
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("logOn");

		// 로그인 화면으로 리다이렉트
		ModelAndView mav = new ModelAndView("redirect:/");

		return mav;
	}

	// 회원탈퇴 버튼 : 회원탈퇴
	@Override
	@RequestMapping(value = "/member/unregister.do", method = RequestMethod.GET)
	public ModelAndView unregisterDo(RedirectAttributes rAttr, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO member = (MemberVO)session.getAttribute("member");
		logger.info("회원탈퇴 요청 : " + member.getMember_email());
		// 회원탈퇴 커맨드가 정상적으로 입력된 경우
		String cmd = request.getParameter("cmd");
		logger.info("요청 커맨드 : " + cmd);
		if (cmd == null) {
			cmd = "false";
		}
		if (cmd.equals("true")) {
			boolean isUnregister = memberService.unregister(member);
			if (isUnregister) {
				logger.info("회원탈퇴 완료 : " + member.getMember_email());
				session.removeAttribute("member");
				session.removeAttribute("logOn");
				rAttr.addFlashAttribute("result","unregistered");
				mav.setViewName("redirect:/");
			}
			else {
				logger.info("회원탈퇴 실패");
				mav.setViewName("redirect:/errors/undefined_error");
			}
		}
		return mav;
	}

}
