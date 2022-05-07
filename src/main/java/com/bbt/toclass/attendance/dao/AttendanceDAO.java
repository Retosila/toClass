package com.bbt.toclass.attendance.dao;


import java.util.List;

import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.AttendVO;
public interface AttendanceDAO {

	List<AttendVO> getAttendanceInfo(AttendDTO attendDTO) throws Exception;

	List<String> getStuEmails(String email);
	
	AttendVO getStuNames(String email);
}