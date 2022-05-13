package com.bbt.toclass.attendance.service;

import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.AttendanceVO;
import com.bbt.toclass.attendance.vo.MyAttendVO;
import com.bbt.toclass.attendance.vo.NewAttendVO;
import com.bbt.toclass.attendance.vo.ShowAttendVO;
import com.bbt.toclass.member.vo.ClassVO;

import java.util.List;
import java.util.Map;

public interface AttendanceService {


	ShowAttendVO getAttendanceInfo(AttendDTO attendDTO) throws Exception;

	//교사가 운영하는 학급에 속한 학생의 이메일 출력
	public List<String> getClassMemberEmail(String member_email) throws Exception;

	// 학급 정보 호출
	ClassVO getMyClassInfo(String class_id) throws Exception;

	//출석 정보 DB에 insert
	public int insertAttend(NewAttendVO newAttend) throws Exception;


	List<MyAttendVO> getAttendance(String member_email) throws Exception;
}
