package com.bbt.toclass.attendance.dao;

import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.AttendVO;
import com.bbt.toclass.attendance.vo.MyAttendVO;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("attendanceDAO")
public class AttendanceDAOImpl implements AttendanceDAO {

	private static final Logger logger = LoggerFactory.getLogger(AttendanceDAOImpl.class);

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<AttendVO> getAttendanceInfo(AttendDTO attendDTO) throws Exception {
		logger.info("DB에 getAttendanceInfoByDTO 요청");
		List<AttendVO> attendVOList = sqlSession.selectList("mapper.attendance.getAttendanceInfoByDTO", attendDTO);
		for (AttendVO avo : attendVOList) {
			System.out.println(avo.getAttend_status());
		}
		return attendVOList;
	}

	@Override
	public List<MyAttendVO> getAttendance(String member_email) throws Exception {
		logger.info("DB에 getAttendanceByEmail 요청");
		List<MyAttendVO> myAttendVOList = sqlSession.selectList("mapper.attendance.getAttendanceByEmail", member_email);
		
		// 출결status에 따른 블록 색상 지정
		for (MyAttendVO mavo : myAttendVOList) {
			mavo.addSetting();
		}
		return myAttendVOList;
	}
	
	@Override
	public List<AttendDTO> getClassMemberEmail(String member_email) throws Exception {
		System.out.println("DB에 getClassMemberEmail 요청");
		List<AttendDTO> memberEmailList = sqlSession.selectList("mapper.attendance.getClassMemberEmail", member_email);
		for(AttendDTO adto : memberEmailList) {
			System.out.println(adto.getMember_email());
		}
		return memberEmailList;
	}
}
