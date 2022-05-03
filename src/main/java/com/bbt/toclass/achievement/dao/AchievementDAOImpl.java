package com.bbt.toclass.achievement.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bbt.toclass.achievement.vo.AchievementVO;

@Repository("AchievementDAO")
public class AchievementDAOImpl implements AchievementDAO {
	private static final Logger logger = LoggerFactory.getLogger(AchievementDAOImpl.class);
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public AchievementVO checkByAchievement(AchievementVO achievement) throws DataAccessException{
		logger.info("myBatis에게 쿼리 요청 : checkByAchievement : " + achievement.getMember_email());
		AchievementVO vo = sqlSession.selectOne("mapper.achievement.checkByAchievement", achievement);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info("성적 조회 : " + achievement.getAchievement_mid() );
		return vo;
	}
	
}
