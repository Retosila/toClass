package com.bbt.toclass.board.service;

import com.bbt.toclass.board.dao.BoardDAO;
import com.bbt.toclass.board.vo.ArticleVO;
import com.bbt.toclass.board.vo.NoticeVO;
import com.bbt.toclass.member.vo.AuthVO;
import com.bbt.toclass.member.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl  implements BoardService{
	@Autowired
	BoardDAO boardDAO;

	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);



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

	@Override
	public int sendNotice(NoticeVO nvo) throws Exception {

		logger.info("service : sendNotice ?????? ?????? ??????");

		String notice_title = nvo.getNotice_title();
		String notice_sender = nvo.getNotice_sender();
		String notice_sender_name = boardDAO.getTeacherName(notice_sender);
		String notice_receiver = nvo.getNotice_receiver();
		String notice_receiver_name = nvo.getNotice_receiver_name();
		String notice_content = nvo.getNotice_content();

		// DB??? ???????????? ??????
		logger.info("DAO??? insertNotice ?????? ??????");
		int result = boardDAO.insertNotice(nvo);
		logger.info("DAO????????? ??????????????? ?????? ??????");

		// DB??? ?????? ?????? ???, ?????? ?????? ??? ?????? ?????? return
		if (result == 0) {
			logger.info("?????? : DB??? ????????? ????????? ???????????? ??? ????????????.");
			return 0;
		}

		// ?????? ????????? ??????(DB??? ?????? ?????? ???)
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Authenticator auth = new AuthVO();
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);

		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("toclass.authentication@gmail.com", "????????????"));
			InternetAddress to = new InternetAddress(notice_receiver);

			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("[????????????] " + notice_title, "UTF-8");
			msg.setText(notice_sender_name + "?????? " + notice_receiver_name + "????????? ?????? ?????? : \r\n" + notice_content, "UTF-8");
			Transport.send(msg);
			logger.info("????????? ?????? ??????");
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
		logger.info("service : getStudentInfo ?????? ?????? ??????");

		List<MemberVO> studentList = boardDAO.getStudentInfo(teacherEmail);
		logger.info("service : getStudentInfo ?????? ?????? ??????");

		return studentList;
	}

	@Override
	public NoticeVO getRecentNotice(String studentEmail) throws Exception {
		logger.info("service : getRecentNotice ?????? ?????? ??????");

		NoticeVO recentNotice = boardDAO.getRecentNotice(studentEmail);
		logger.info("service : getRecentNotice ?????? ?????? ??????");

		return recentNotice;
	}




}
