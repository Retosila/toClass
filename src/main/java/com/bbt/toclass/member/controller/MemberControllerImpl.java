package com.bbt.toclass.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import com.bbt.toclass.member.vo.ApplicantVO;
import com.bbt.toclass.member.vo.ClassVO;
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
	@RequestMapping(value = { "/","/login"}, method = {RequestMethod.GET, RequestMethod.POST})
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
		if (logOn == true && logOnMember != null) {
			String member_type = logOnMember.getMember_type();
			logger.info("logOn : " + logOn);
			logger.info("이미 로그온된 회원 : " + logOnMember.getMember_email());
			logger.info("회원유형 : " + member_type);
			
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
	
	// 학급관리 페이지(/member/myClass.jsp)
	@SuppressWarnings("unused")
	@RequestMapping(value = "/member/myClass", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myClass(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		logger.info("myClass.jsp 페이지 요청");
		ModelAndView mav = new ModelAndView("myClass");
		
		// curretClass가 null이 아닐 때, 데이터 바인딩
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		String currentClass = "";
		if (member.getCurrentClass() != null) {
			currentClass = member.getCurrentClass();
		}
		String member_type = member.getMember_type();
		String member_email = member.getMember_email();
		if (currentClass != null || currentClass != "") {
			logger.info("학급 정보 존재 : " + currentClass);
			logger.info("회원유형 : " + member_type);
			
			logger.info("비즈니스 로직 요청 : getMyClassInfo");
			ClassVO myClass = memberService.getMyClassInfo(currentClass);
			logger.info("비즈니스 로직 성공 : getMyClassInfo");
			mav.addObject("myClass", myClass);
			
			// 교사 회원인 경우 
			if (member_type.equals("교사")) {
				// 교사가 현재 담당 중인 학급의 구성원 정보를 List에 담은 후 데이터 바인딩
				logger.info("비즈니스 로직 요청 : getMyStudentList");
				List<MemberVO> studentList = memberService.getMyStudentList(currentClass);
				logger.info("비즈니스 로직 성공 : getMyStudentList");
				mav.addObject("studentList", studentList);
				
				// 학급 가입 신청자 명단 바인딩
				logger.info("비즈니스 로직 요청 : getApplicantList");
				List<ApplicantVO> applicantList = memberService.getApplicantList(currentClass);
				logger.info("비즈니스 로직 성공 : getApplicantList");
				// 조회된 신청자 정보가 1개 이상일 시
				if (applicantList != null && applicantList.size() >= 1) {
					mav.addObject("applicantList", applicantList);
				}
				else {
					logger.info("가입 승인 대기 중인 학생 없음 ");
				}
			}
			
			// 학생 회원인 경우
			else if (member_type.equals("학생")) {
				// 가입 승인 대기 여부 확인용 데이터 바인딩
				logger.info("비즈니스 로직 요청 : checkIsPending");
				int result = memberService.checkIsPending(member_email);
				if (result > 0) {
					logger.info("교사의 학급 가입 승인 대기 목록에 존재");
					mav.addObject("isPending", true);
				}
				else {
					logger.info("교사의 학급 가입 승인 대기 목록에 비존재");
					mav.addObject("isPending", false);
				}
			}
			else {
				logger.info("관리자 계정");
			}
			
		}
		else {
			logger.info("학급 정보 없음");
		}
		
		// *.do에서 result값을 가지고 리다이렉트되었을 때
		if (RequestContextUtils.getInputFlashMap(request) != null) {
			Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
			String result = (String)redirectMap.get("result");
			logger.info("result : " + result);
			mav.addObject("result", result);
		}
		
		return mav;
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
		    String currentClass = memberVO.getCurrentClass();
		    logger.info("회원이름 : " + type);
		    logger.info("회원유형 : " + name);
		    logger.info("학급ID : " + currentClass);
		    
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
		ModelAndView mav = new ModelAndView("redirect:/login");
		
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
				mav.setViewName("redirect:/login");
			}
			else {
				logger.info("회원탈퇴 실패");
				mav.setViewName("redirect:/errors/undefined_error");
			}
		}
		return mav;
	}

	
	/*
	 * 
	 * 학급 관리 관련
	 * 
	 */
	
	// 새 학급 생성 버튼 : 새로운 학급 생성
	@RequestMapping(value = "/member/createClass.do", method = RequestMethod.POST)
	public ModelAndView createClassDo(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 요청 처리 후 myClass.jsp로 리다이렉트
		ModelAndView mav = new ModelAndView("redirect:/member/myClass");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String member_email = member.getMember_email();
		String class_name = request.getParameter("class_name");
		logger.info("새 학급 생성 요청 : " + member_email);
		logger.info("학급명 : " + class_name);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_email", member_email);
		map.put("class_name", class_name);
		
		// 우선 Class 테이블에 새로운 클래스를 만듦. 생성한 클래스의 id를 받아옴
		String class_id = memberService.createClass(map);
		
		// 그리고, Info 테이블에 해당 교사이메일+새로 생성한 클래스id로 인스턴스 생성
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("member_email", member_email);
		map2.put("class_id", class_id);
		logger.info("클래스 로그 추가 요청");
		memberService.addClassLog(map2);
		logger.info("클래스 로그 추가 성공");
		
		// 현재 로그온된 회원 정보에 currentClass 프로퍼티 추가
		member.setCurrentClass(class_id);
		session.setAttribute("member", member);
		
		return mav;
	}
	
	// 학급 폐쇄 버튼 : 학급 정보 제거
	@RequestMapping(value = "/member/delMyClass.do", method = RequestMethod.POST)
	public ModelAndView delMyClassDo(@RequestParam("class_id") String class_id, HttpSession session, RedirectAttributes rAttr, 
										HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("학급 제거 요청 : " + class_id);
		// 요청 처리 후 myClass.jsp로 리다이렉트
		ModelAndView mav = new ModelAndView("redirect:/member/myClass");
		
		// 비즈니스 로직 처리 요청
		int result = memberService.delMyClass(class_id);
		
		if (result > 0) {
			logger.info("학급 제거 요청 성공");
		    rAttr.addFlashAttribute("result","delSuccess");
		    MemberVO member = (MemberVO)session.getAttribute("member");
		    // currentClass 정보를 null로 변경
		    member.setCurrentClass(null);
		    session.setAttribute("member", member);
		}
		else {
			logger.info("학급 제거 실패");
			rAttr.addFlashAttribute("result","delFailed");
		}
		
		return mav;
		
	}
	
	// 학급 가입 신청 버튼 : 학급 가입 신청
	@RequestMapping(value = "/member/applyClass.do", method = RequestMethod.POST)
	public ModelAndView applyClassDo(@RequestParam("class_code") String class_code, HttpSession session, RedirectAttributes rAttr, 
					HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("학급 가입 요청 : " + class_code);
		// 요청 처리 후 myClass.jsp로 리다이렉트
		ModelAndView mav = new ModelAndView("redirect:/member/myClass");
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		int result = memberService.applyClass(class_code, member);
		
		if (result > 0) {
			logger.info("학급 가입 요청 성공");
		    rAttr.addFlashAttribute("result","applySuccess");
		    session.setAttribute("isPending", true);
		}
		else {
			logger.info("학급 가입 요청 실패");
			rAttr.addFlashAttribute("result","applyFailed");
		}
		
		return mav;
	}
	
	// 가입 신청 승인 및 거절 버튼
	@RequestMapping(value = "/member/acceptApplicant.do", method = RequestMethod.GET)
	public ModelAndView acceptApplicantDo(@RequestParam("email") String member_email, @RequestParam("accept") String accept, @RequestParam("class_id") String class_id, 
					RedirectAttributes rAttr, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("가입 신청 승인/거절 요청");
		logger.info("요청 클래스 : " + class_id);
		logger.info("대상 신청자 : " + member_email);
		logger.info("가부 : " + accept);
		// 요청 처리 후 myClass.jsp로 리다이렉트
		ModelAndView mav = new ModelAndView("redirect:/member/myClass");
		
		// 비즈니스 로직 처리 요청
		int result = memberService.acceptApplicant(member_email, accept, class_id);
		logger.info("비즈니스 로직 처리 성공 : acceptApplicant : " + result);
		
		// result 값에 따라 분기
		if (result > 0) {
			logger.info("학급 가입 승인 처리 완료");
		    rAttr.addFlashAttribute("result","acceptSuccess");
		}
		else if (result < 0) {
			logger.info("학급 가입 거부 처리 완료");
			rAttr.addFlashAttribute("result","rejectSuccess");
		}
		else {
			logger.info("오류 : 요청 처리 실패");
			rAttr.addFlashAttribute("result","requestFailed");
		}
		
		return mav;
	}
	
	// 학급원 내보내기 버튼 : info 테이블에서 학급원 정보 삭제
	@RequestMapping(value = "/member/delMyStudent.do", method = RequestMethod.GET)
	public ModelAndView delMyStudentDo(@RequestParam("member_email") String member_email, @RequestParam("class_id") String class_id, RedirectAttributes rAttr,
					HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("학급원 삭제 요청");
		logger.info("요청 클래스 : " + class_id);
		logger.info("대상 학급원 : " + member_email);
		// 요청 처리 후 myClass.jsp로 리다이렉트
		ModelAndView mav = new ModelAndView("redirect:/member/myClass");
		
		// 비즈니스 로직 처리 요청
		int result = memberService.delMyStudent(member_email, class_id);
		logger.info("비즈니스 로직 처리 성공 : delMyStudent : " + result);
		
		// result 값에 따라 분기
		if (result > 0) {
			logger.info("학급원 삭제 처리 완료");
		    rAttr.addFlashAttribute("result","studentDeleteSuccess");
		}
		else {
			logger.info("오류 : 요청 처리 실패");
			rAttr.addFlashAttribute("result","requestFailed");
		}
		
		return mav;
	}
	
}