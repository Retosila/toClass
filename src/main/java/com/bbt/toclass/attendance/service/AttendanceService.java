package com.bbt.toclass.attendance.service;

import java.util.List;

import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.ShowAttendVO;

public interface AttendanceService {

	
	ShowAttendVO getAttendanceInfo(AttendDTO attendDTO) throws Exception;
	
	List<String> getStuEmails(String email);
}
