package com.bbt.toclass.achievement.dao;

import java.util.ArrayList;
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
	
	@Override
	public List<AchievementVO> getMyStudentAchievement(String member_email) throws DataAccessException {
		logger.info("myBatis에게 쿼리 요청 : 성적조회 -> " + member_email);
		List<String> emailList = sqlSession.selectList("mapper.achievement.getMyStudentEmailByEmail", member_email);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info("추출한 레코드의 개수 : " + emailList.size());
		for (String str : emailList) {
			System.out.println("추출된 학생 이메일 : "+str);
		}
		
		List<AchievementVO> avoList = new ArrayList<AchievementVO>();
		for (String email : emailList) {
			List<AchievementVO> temp = sqlSession.selectList("mapper.achievement.getAchievementByEmail", email);
			for (AchievementVO avo : temp) {
				avoList.add(avo);
				System.out.println("입력된 학생 정보 : " + avo.getMember_email());
				
			}
		}
		logger.info("학생 정보 추출 및 통합 입력 완료");
		logger.info("추출한 학생 정보 개수 : " + avoList.size());
		
		return avoList;
	}
	
	
}
