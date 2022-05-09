package com.bbt.toclass.attendance.service;

import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.ShowAttendVO;

import java.util.List;

public interface AttendanceService {


	ShowAttendVO getAttendanceInfo(AttendDTO attendDTO) throws Exception;

	//교사가 운영하는 학급에 속한 학생의 이메일 출력
	public List<String> getClassMemberEmail(String member_email) throws Exception;
}
