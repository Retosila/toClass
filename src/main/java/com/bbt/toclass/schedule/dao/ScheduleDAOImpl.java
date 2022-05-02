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
	
	public int addSchedule(ScheduleVO newSchedule) throws DataAccessException {
		logger.info("myBatis에게 쿼리 요청 : addScheduleByEmail : " + newSchedule.getMember_email());
		int result = sqlSession.insert("mapper.schedule.addScheduleByEmail", newSchedule);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info(result + " 개의 일정 정보 추가 완료");
		return result;
	}
	
	public int addScheduleAll(ScheduleVO newSchedule) throws DataAccessException {
		// 회원이 현재 소속되어 있는 학급 정보를 조회
		String member_email = newSchedule.getMember_email();
		logger.info("myBatis에게 쿼리 요청 : getClassIdByEmail : " + member_email);
		String class_id = sqlSession.selectOne("mapper.schedule.getClassIdByEmail", member_email);
		logger.info("소속 학급 정보 추출 성공 : " + class_id);
		
		// 조회된 학급 정보가 존재할 시 해당 회원과 class_id가 같은 회원들을 일괄 조회
		if (class_id != null) {
			int result = 0;
			List<String> list = sqlSession.selectList("mapper.schedule.getClassMemberEmailByClassId", class_id);
			for (String email : list) {
				ScheduleVO sch = newSchedule;
				sch.setMember_email(email);
				addSchedule(sch);
				result += 1;
			}
			return result;
		}
		else {
			logger.info("오류 : 소속된 학급이 존재하지 않습니다.");
			return 0;
		}
		
	}
	
	public int delSchedule(String id) throws DataAccessException {
		logger.info("myBatis에게 쿼리 요청 : delScheduleByScheduleId : " + id);
		int result = sqlSession.delete("mapper.schedule.delScheduleByScheduleId", id);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info(result + " 개의 일정 정보 삭제 완료");
		return result;
	}
	
}
