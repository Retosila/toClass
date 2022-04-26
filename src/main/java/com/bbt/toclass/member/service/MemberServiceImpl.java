package com.bbt.toclass.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbt.toclass.member.controller.MemberControllerImpl;
import com.bbt.toclass.member.dao.MemberDAO;
import com.bbt.toclass.member.vo.AuthVO;
import com.bbt.toclass.member.vo.MemberVO;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

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
	
	@Override
	public MemberVO login(MemberVO member) throws Exception{
		logger.info("DAO에 로그인 요청");
		return memberDAO.loginByEmail(member);
	}
	
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
	
}
