package com.bbt.toclass.attendance.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.AttendVO;

@Repository("attendanceDAO")
public class AttendanceDAOImpl implements AttendanceDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<AttendVO> getAttendanceInfo(AttendDTO attendDTO) throws Exception {
		System.out.println("DB에 getAttendanceInfoByDTO 요청");
		List<AttendVO> attendVOList = sqlSession.selectList("mapper.attendance.getAttendanceInfoByDTO", attendDTO);
		for (AttendVO avo : attendVOList) {
			System.out.println(avo.getAttend_status());
		}
		return attendVOList;
	}
	
}
