package com.bbt.toclass.achievement.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.bbt.toclass.achievement.vo.AchievementVO;

@Repository("achievementDAO")
public class AchievementDAOImpl implements AchievementDAO {
	private static final Logger logger = LoggerFactory.getLogger(AchievementDAOImpl.class);
	@Autowired
	private SqlSession sqlSession;
	//ㄴ의존성 주입 (마이바티스를 사용하기 위해서 (바이바티스가 지원하는 클래스임))
	
	@Override
	public List<AchievementVO> getAchievement(String member_email) throws DataAccessException {
		logger.info("myBatis에게 쿼리 요청 : 성적조회 -> " + member_email);
		List<AchievementVO> avoList = sqlSession.selectList("mapper.achievement.getAchievementByEmail", member_email);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info("추출한 레코드의 개수 : " + avoList.size());

		return avoList;
	}
	
	
	
}
