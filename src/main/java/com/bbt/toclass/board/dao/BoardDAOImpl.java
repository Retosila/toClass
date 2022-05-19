package com.bbt.toclass.board.dao;

import com.bbt.toclass.board.service.BoardServiceImpl;
import com.bbt.toclass.board.vo.ArticleVO;
import com.bbt.toclass.board.vo.ImageVO;
import com.bbt.toclass.board.vo.NoticeVO;
import com.bbt.toclass.member.vo.MemberVO;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> getStudentInfo(String teacherEmail) throws DataAccessException {
		logger.info("myBatis에게 쿼리 요청 : getStudentInfoByEmail : " + teacherEmail);
		List<MemberVO> studentList = sqlSession.selectList("mapper.board.getStudentInfoByEmail", teacherEmail);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info("조회된 학생 정보 : " + studentList.size());
		
		return studentList;
	}

	
	@Override
	public int insertNotice(NoticeVO nvo) throws DataAccessException {
		logger.info("myBatis에게 쿼리 요청 : insertNoticeByNoticeVO");
		int result = sqlSession.insert("mapper.board.insertNoticeByNoticeVO", nvo);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info("DB에 입력한 알림장  : " + result);
		
		return result;
		
	}
	
	@Override
	public String getTeacherName(String teacherEmail) throws DataAccessException {
		logger.info("myBatis에게 쿼리 요청 : getMemberNameByEmail");
		String teacherName = sqlSession.selectOne("mapper.board.getMemberNameByEmail", teacherEmail);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info("선생님 이름  : " + teacherName);
		
		return teacherName;
		
	}
	
	@Override
	public NoticeVO getRecentNotice(String studentEmail) throws DataAccessException {
		logger.info("myBatis에게 쿼리 요청 : getRecentNoticeByEmail");
		NoticeVO recentNotice = sqlSession.selectOne("mapper.board.getRecentNoticeByEmail", studentEmail);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info("학생 이메일  : " + studentEmail);
		
		return recentNotice;
		
	}
	
	
	
	
	
	
	@Override
	public List selectAllArticlesList() throws DataAccessException {

		List<ArticleVO> articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList");

		return articlesList;
	}
	@Override
	public int articleCount() throws DataAccessException {

		int result = sqlSession.selectOne("mapper.board.articleCount");

		return result;
	}

	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int articleNO = selectNewArticleNO();
		articleMap.put("articleNO", articleNO);
		sqlSession.insert("mapper.board.insertNewArticle",articleMap);
		return articleNO;
	}


	/*
	@Override
	public void insertNewImage(Map articleMap) throws DataAccessException {
		List<ImageVO> imageFileList = (ArrayList)articleMap.get("imageFileList");
		int articleNO = (Integer)articleMap.get("articleNO");
		int imageFileNO = selectNewImageFileNO();
		for(ImageVO imageVO : imageFileList){
			imageVO.setImageFileNO(++imageFileNO);
			imageVO.setArticleNO(articleNO);
		}
		sqlSession.insert("mapper.board.insertNewImage",imageFileList);
	}

   */

	@Override
	public ArticleVO selectArticle(int articleNO) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectArticle", articleNO);
	}

	@Override
	public void updateArticle(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateArticle", articleMap);
	}

	@Override
	public void addViews(int articleNO) throws DataAccessException {
		sqlSession.update("mapper.board.addViews", articleNO);
	}
	public void bad(int articleNO) throws DataAccessException {
		sqlSession.update("mapper.board.bad", articleNO);
	}
	public void good(int articleNO) throws DataAccessException {
		sqlSession.update("mapper.board.good", articleNO);
	}

	@Override
	public void deleteArticle(int articleNO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteArticle", articleNO);

	}

	@Override
	public List selectImageFileList(int articleNO) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board.selectImageFileList",articleNO);
		return imageFileList;
	}

	private int selectNewArticleNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewArticleNO");
	}

	private int selectNewImageFileNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
	}

}
