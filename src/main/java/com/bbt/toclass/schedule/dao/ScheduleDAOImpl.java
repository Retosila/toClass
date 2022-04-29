package com.bbt.toclass.schedule.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bbt.toclass.schedule.vo.ScheduleVO;

@Repository("scheduleDAO")
public class ScheduleDAOImpl implements ScheduleDAO {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleDAOImpl.class);
	@Autowired
	private SqlSession sqlSession;
	
	public List<ScheduleVO> getSchedule(String member_email) throws DataAccessException {
		logger.info("myBatis에게 쿼리 요청 : getScheduleByEmail : " + member_email);
		List<ScheduleVO> schedule = sqlSession.selectList("mapper.schedule.getScheduleByEmail", member_email);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info("일정 정보 추출 완료");
		return schedule;
	}
	
}
