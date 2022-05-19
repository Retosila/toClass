package com.bbt.toclass.board.service;

import com.bbt.toclass.board.dao.BoardDAO;
import com.bbt.toclass.board.vo.ArticleVO;
import com.bbt.toclass.board.vo.NoticeVO;
import com.bbt.toclass.member.vo.AuthVO;
import com.bbt.toclass.member.vo.MemberVO;
import com.bbt.toclass.schedule.controller.ScheduleControllerImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl  implements BoardService{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	BoardDAO boardDAO;

	public BoardServiceImpl(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}

	public List<ArticleVO> listArticles() throws Exception{
		List<ArticleVO> articlesList =  boardDAO.selectAllArticlesList();

        return articlesList;
	}

	@Override
	public int articleCount() throws Exception {
		return boardDAO.articleCount();
	}

	@Override
	public int addNewArticle(Map articleMap) throws Exception{
		return boardDAO.insertNewArticle(articleMap);
	}


	@Override
	public ArticleVO viewArticle(int articleNO) throws Exception {

		boardDAO.addViews(articleNO);
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}
	public ArticleVO bad(int articleNO) throws Exception {

		boardDAO.bad(articleNO);
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}
	public ArticleVO good(int articleNO) throws Exception {

		boardDAO.good(articleNO);
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}

	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
	}

	@Override
	public void removeArticle(int articleNO) throws Exception {
		boardDAO.deleteArticle(articleNO);
	}

	static void incrementNttRdCnt(String nttId) {

	}
	
	
	
	
	/*
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	
	@Override
	public int sendNotice(NoticeVO nvo) throws Exception {
		
		logger.info("service : sendNotice 요청 처리 시작");
		
		String notice_title = nvo.getNotice_title();
		String notice_sender = nvo.getNotice_sender();
		String notice_sender_name = boardDAO.getTeacherName(notice_sender);
		String notice_receiver = nvo.getNotice_receiver();
		String notice_receiver_name = nvo.getNotice_receiver_name();
		String notice_content = nvo.getNotice_content();
		
		// DB에 기록하는 로직
		logger.info("DAO에 insertNotice 로직 요청");
		int result = boardDAO.insertNotice(nvo);
		logger.info("DAO로부터 성공적으로 응답 수신");
		
		// DB에 기록 실패 시, 메일 전송 안 하고 바로 return
		if (result == 0) {
			logger.info("오류 : DB에 알림장 정보를 입력하지 못 했습니다.");
			return 0;
		}
		
		// 메일 보내는 로직(DB에 기록 성공 시)
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
			InternetAddress to = new InternetAddress(notice_receiver);

			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("[투클래스] " + notice_title, "UTF-8");
			msg.setText(notice_sender_name + "님이 " + notice_receiver_name + "님에게 보낸 알림 : \r\n" + notice_content, "UTF-8");
			Transport.send(msg);
			logger.info("이메일 전송 성공");
			return result;
		}

		catch(AddressException ae) {
			logger.info("AddressException : " + ae.getMessage());
			return 0;
		}

		catch(MessagingException me) {
			logger.info("MessagingException : " + me.getMessage());
			return 0;
		}

		catch(UnsupportedEncodingException e) {
			logger.info("UnsupportedEncodingException : " + e.getMessage());
			return 0;
		}
		
		
	}
	
	
	@Override
	public List<MemberVO> getStudentInfo(String teacherEmail) throws Exception {
		logger.info("service : getStudentInfo 요청 처리 시작");
		
		List<MemberVO> studentList = boardDAO.getStudentInfo(teacherEmail);
		logger.info("service : getStudentInfo 요청 처리 성공");
		
		return studentList;
	}
	
	@Override
	public NoticeVO getRecentNotice(String studentEmail) throws Exception {
		logger.info("service : getRecentNotice 요청 처리 시작");
		
		NoticeVO recentNotice = boardDAO.getRecentNotice(studentEmail);
		logger.info("service : getRecentNotice 요청 처리 성공");
		
		return recentNotice;
	}
	
	
	
	
	
	

}
