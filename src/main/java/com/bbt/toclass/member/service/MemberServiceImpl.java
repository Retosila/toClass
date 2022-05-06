package com.bbt.toclass.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbt.toclass.member.controller.MemberControllerImpl;
import com.bbt.toclass.member.dao.MemberDAO;
import com.bbt.toclass.member.vo.ApplicantVO;
import com.bbt.toclass.member.vo.AuthVO;
import com.bbt.toclass.member.vo.ClassVO;
import com.bbt.toclass.member.vo.MemberVO;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired
	private MemberDAO memberDAO;
	
	// 로그인
	@Override
	public MemberVO login(MemberVO member) throws Exception{
		logger.info("DAO에 로그인 요청");
		return memberDAO.loginByEmail(member);
	}
	
	// 본인인증 코드 요청
	@Override
	public void sendAuthCode(String authCode, String email) {
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		
		Authenticator auth = new AuthVO();
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("toclass.authentication@gmail.com", "투클래스"));
			InternetAddress to = new InternetAddress(email);         
			
			msg.setRecipient(Message.RecipientType.TO, to);            
			msg.setSubject("[투클래스] 본인인증 번호", "UTF-8");            
			msg.setText("본인인증 번호는 " + authCode + "입니다.", "UTF-8");            
			Transport.send(msg);
			logger.info("이메일 전송 성공");
		} 
		
		catch(AddressException ae) {            
			logger.info("AddressException : " + ae.getMessage());
		} 
		
		catch(MessagingException me) {            
			logger.info("MessagingException : " + me.getMessage());
		} 
		
		catch(UnsupportedEncodingException e) {
			logger.info("UnsupportedEncodingException : " + e.getMessage());
		}
        
	}
	
	// 이메일 중복 확인
	@Override
	public String checkEmailDuplicate(MemberVO member) throws Exception{
		logger.info("DAO에 이메일 중복 확인 요청");
		int result = memberDAO.checkEmailDuplicate(member);
		String isDuplicate = "";
		
		if (result > 0) {
			isDuplicate = "true";
		}
		
		else {
			isDuplicate = "false";
		}
		
		logger.info("DAO로부터 성공적으로 응답 수신");
		logger.info("전송된 값. isDuplicate : " + isDuplicate);
		
		return isDuplicate;
	}
	
	// 회원 가입
	@Override
	public boolean register(MemberVO member) throws Exception {
		logger.info("DAO에 회원정보 등록 요청");
		int result = memberDAO.register(member);
		boolean isRegister = false;
		
		if (result == 1) {
			isRegister = true;
		}
		
		else {
			isRegister = false;
		}
		
		logger.info("DAO로부터 성공적으로 응답 수신");
		logger.info("전송된 값. isRegister : " + isRegister);
		
		return isRegister;
	}
	
	// 가입한 계정(이메일주소) 찾기
	@Override
	public String findAccount(MemberVO member) throws Exception {
		logger.info("DAO에 회원 정보 대조 요청");
		MemberVO memberVO = memberDAO.findAccount(member);
		String member_email = "";
		
		if (memberVO != null) {
			member_email = memberVO.getMember_email();
		}
		else {
			member_email = "NA"; 
		}
		
		logger.info("DAO로부터 성공적으로 응답 수신");
		logger.info("전송된 값. member_email : " + member_email);
		
		return member_email;
	}
	
	// 패스워드 찾기
	@SuppressWarnings("unused")
	@Override
	public String findPw(MemberVO member) throws Exception {
		logger.info("DAO에 회원 정보 요청");
		MemberVO memberVO = memberDAO.getMemberInfo(member);
		String isExist = "";
		
		// 해당 이메일로 등록된 회원 존재하지 않을 시
		if (memberVO == null) {
			isExist = "false";
			logger.info("DAO로부터 성공적으로 응답 수신");
			logger.info("전송된 값. isExist : " + isExist);
			return isExist;
		}
		
		// 해당 Email로 등록된 회원 레코드가 존재할 시 
		else {
			isExist = "true";
			logger.info("DAO로부터 성공적으로 응답 수신");
			logger.info("전송된 값. isExist : " + isExist);
			
			String member_email = memberVO.getMember_email();
			String member_name = memberVO.getMember_name();
			String member_pw = memberVO.getMember_pw();
			
			// 이메일 전송 코드
			Properties prop = System.getProperties();
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.port", "587");
			
			Authenticator auth = new AuthVO();
			Session session = Session.getDefaultInstance(prop, auth);
			MimeMessage msg = new MimeMessage(session);
			
			try {
				msg.setSentDate(new Date());
				msg.setFrom(new InternetAddress("toclass.authentication@gmail.com", "투클래스"));
				InternetAddress to = new InternetAddress(member_email);         
				
				msg.setRecipient(Message.RecipientType.TO, to);            
				msg.setSubject("[투클래스] 비밀번호 찾기 요청" , "UTF-8");            
				msg.setText(member_name + " 회원님의 비밀번호는 " + member_pw + " 입니다.", "UTF-8");            
				Transport.send(msg);
				logger.info("이메일 전송 성공");
			} 
			
			catch(AddressException ae) {            
				logger.info("AddressException : " + ae.getMessage());
			} 
			
			catch(MessagingException me) {            
				logger.info("MessagingException : " + me.getMessage());
			} 
			
			catch(UnsupportedEncodingException e) {
				logger.info("UnsupportedEncodingException : " + e.getMessage());
			}
	        
			return isExist;
		}
	}
	
	// 회원 탈퇴
	@Override
	public boolean unregister(MemberVO member) throws Exception {
		logger.info("DAO에 회원정보 삭제 요청");
		int result = memberDAO.unregister(member);
		boolean isUnregister = false;
		
		if (result == 1) {
			isUnregister = true;
		}
		
		else {
			isUnregister = false;
		}
		
		logger.info("DAO로부터 성공적으로 응답 수신");
		logger.info("전송된 값. isUnregister : " + isUnregister);
		
		return isUnregister;
	}
	
	// 내가 담당 중인 학급원 명단 요청
	@Override
	public List<MemberVO> getMyStudentList(String class_id) throws Exception {
		logger.info("DAO에 학급원 이메일 정보 요청");
		List<MemberVO> studentList = memberDAO.getMyStudentList(class_id);
		logger.info("DAO로부터 성공적으로 응답 수신");
		logger.info("조회된 학급원 정보 : " + studentList.size() +" 개");
		
		return studentList;
	}
	
	// 내 학급 정보 요청
	@Override
	public ClassVO getMyClassInfo(String class_id) throws Exception {
		logger.info("DAO에 학급 세부 정보 요청");
		ClassVO cvo = memberDAO.getMyClassInfo(class_id);
		logger.info("DAO로부터 성공적으로 응답 수신");
		
		return cvo;
	}
	
	// 새 학급 생성
	@Override
	public String createClass(Map<String, String> map) throws Exception {
		logger.info("Service : 새 학급 생성 요청");
		// 인증 코드 생성
		// 6자리 인증코드
		int codeLength = 8;
		// 숫자와 영문대문자로 구성
		char[] combination = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		String class_code = "";
		// 중복 여부 검증
		while (true) {
			for (int i = 0; i < codeLength; i++) {
				char ch = combination[random.nextInt(combination.length)];
				sb.append(ch);
			}
			class_code = sb.toString();
			logger.info("클래스 코드 생성 : " + class_code);
			logger.info("DAO에 중복 검증 요청");
			int result = memberDAO.checkClassCodeDuplicate(class_code);
			if (result == 0) {
				logger.info("중복 검증 완료");
				break;
			}
		}
		map.put("class_code", class_code);
		
		// DAO에 학급 생성 요청
		logger.info("DAO에 새 학급 생성 요청");
		
		String class_id = memberDAO.createClass(map);
		logger.info("DAO로부터 성공적으로 응답 수신");
		
		return class_id;
	}
	
	// INFO 테이블에 학급 로그 기록
	@Override
	public int addClassLog(Map<String, String> map) throws Exception {
		logger.info("Service : 새 학급 로그 생성 요청");
		
		int result = memberDAO.addClassLog(map);
		logger.info("DAO로부터 성공적으로 응답 수신");
		
		return result;
	}
	
	// 학급 폐쇄
	@Override
	public int delMyClass(String class_id) throws Exception {
		logger.info("Service : 학급 제거 요청 : " + class_id);
		
		int result = memberDAO.delMyClass(class_id);
		logger.info("DAO로부터 성공적으로 응답 수신");
		
		return result;
	}
	
	// 학급 가입 신청
	@Override
	public int applyClass(String class_code, MemberVO member) throws Exception {
		logger.info("Service : 학급 가입 요청");
		logger.info("클래스 코드 : " + class_code);
		logger.info("요청 회원 : " + member.getMember_email());
		
		int result = memberDAO.applyClass(class_code, member);
		logger.info("DAO로부터 성공적으로 응답 수신");
		
		return result;
	}
	
	// 학급 가입 승인 대기 여부 확인
	@Override
	public int checkIsPending(String member_email) throws Exception {
		logger.info("Service : 승인 대기 여부 확인");
		logger.info("요청 회원 : " + member_email);
		
		int result = memberDAO.checkIsPending(member_email);
		logger.info("DAO로부터 성공적으로 응답 수신");
		
		return result;
	}
	
	// 학급 가입 신청자 명단 요청
	@Override
	public List<ApplicantVO> getApplicantList(String class_id) throws Exception {
		logger.info("Service : 학급 가입 신청자 명단 요청");
		logger.info("요청 클래스ID : " + class_id);
		
		List<ApplicantVO> applicantList = memberDAO.getApplicantList(class_id);
		logger.info("DAO로부터 성공적으로 응답 수신");
		
		return applicantList;
	}
	
	// 가입 신청자 승인/거부
	@Override
	public int acceptApplicant(String member_email, String accept, String class_id) throws Exception {
		logger.info("Service : 학급 가입 승인/거부 요청");
		logger.info("대상 신청자 : " + member_email);
		
		// 가입 승인 시
		if (accept.equals("yes")) {
			// 가입 신청자 목록에서 제거 후, info 테이블에 레코드 추가
			int result = memberDAO.acceptApplicant(member_email, class_id);
			logger.info("DAO로부터 성공적으로 응답 수신");
			
			return result;
		}
		
		// 가입 거부 시
		else if (accept.equals("no")) {
			// 가입 신청자 목록에서 제거
			memberDAO.rejectApplicant(member_email, class_id);
			logger.info("DAO로부터 성공적으로 응답 수신");
			
			return -1;
		}
		
		else {
			logger.info("알 수 없는 명령어 : " + accept);
			return 0;
		}
		
	}
	
	@Override
	public int delMyStudent(String member_email, String class_id) throws Exception {
		logger.info("Service : 학급원 삭제 요청");
		logger.info("대상 학급원 : " + member_email);
		
		int result = memberDAO.delMyStudent(member_email, class_id);
		logger.info("DAO로부터 성공적으로 응답 수신");
		
		return result;
	}
	
	
	
	
	
	
	
	
	
}
