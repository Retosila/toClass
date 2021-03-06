package com.bbt.toclass.board.dao;

import com.bbt.toclass.board.vo.ArticleVO;
import com.bbt.toclass.board.vo.NoticeVO;
import com.bbt.toclass.member.vo.MemberVO;
import org.springframework.dao.DataAccessException;

import java.util.List;
import java.util.Map;


public interface BoardDAO {
	public List selectAllArticlesList() throws DataAccessException;
	public int articleCount()  throws DataAccessException;
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	//public void insertNewImage(Map articleMap) throws DataAccessException;

	public ArticleVO selectArticle(int articleNO) throws DataAccessException;
	public void updateArticle(Map articleMap) throws DataAccessException;
	public void deleteArticle(int articleNO) throws DataAccessException;
	public List selectImageFileList(int articleNO) throws DataAccessException;
	void addViews(int articleNO) throws DataAccessException;
	void bad(int articleNO) throws DataAccessException;
	void good(int articleNO) throws DataAccessException;

	List<MemberVO> getStudentInfo(String teacherEmail) throws DataAccessException;
	int insertNotice(NoticeVO nvo) throws DataAccessException;
	String getTeacherName(String teacherEmail) throws DataAccessException;
	NoticeVO getRecentNotice(String studentEmail) throws DataAccessException;


}
