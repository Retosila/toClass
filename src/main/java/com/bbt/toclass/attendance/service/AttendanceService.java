package com.bbt.toclass.attendance.service;

import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.AttendVO;
import com.bbt.toclass.attendance.vo.ShowAttendVO;

public interface AttendanceService {

	
	ShowAttendVO getAttendanceInfo(AttendDTO attendDTO) throws Exception;
}
