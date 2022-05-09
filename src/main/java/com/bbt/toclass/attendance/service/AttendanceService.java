package com.bbt.toclass.attendance.service;

import java.util.List;

import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.AttendVO;
import com.bbt.toclass.attendance.vo.ShowAttendVO;

public interface AttendanceService {

	
	ShowAttendVO getAttendanceInfo(AttendDTO attendDTO) throws Exception;
	
	//교사가 운영하는 학급에 속한 학생의 이메일 출력
	public List<String> getClassMemberEmail(String member_email) throws Exception;
}
