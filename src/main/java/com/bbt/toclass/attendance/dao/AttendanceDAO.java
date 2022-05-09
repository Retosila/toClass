package com.bbt.toclass.attendance.dao;

import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.AttendVO;

import java.util.List;

public interface AttendanceDAO {

	List<AttendVO> getAttendanceInfo(AttendDTO attendDTO) throws Exception;
	List<AttendDTO> getClassMemberEmail(String member_email) throws Exception;
}
