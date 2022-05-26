package com.bbt.toclass.attendance.dao;

import com.bbt.toclass.attendance.vo.*;
import com.bbt.toclass.member.vo.ClassVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface AttendanceDAO {

	//출석정보 출력
	List<AttendVO> getAttendanceInfo(AttendDTO attendDTO) throws Exception;

	//교사가 담당하고 있는 학급의 학생들의 이메일 정보 출력
	List<AttendDTO> getClassMemberEmail(String class_id) throws Exception;

	//회원이 소속되어 있는 학급 정보를 조회, 조회된 학급 정보가 존재할 시 해당 회원과
	//class_id가 같은 회원들을 조회
	public ClassVO classInfo(AttendanceVO attendanceVO) throws Exception;

	public  ClassVO getMyClassInfo(String class_id) throws DataAccessException;

	//class_id와 member_name으로 member_email 정보 출력 후 member_email을 가지고 출석 정보 출력
	//List<MemberVO> getClassMemberEmailByClassIdAndName(String class_id, String member_name) throws Exception;

	List<MyAttendVO> getAttendance(String member_email) throws Exception;

	//출석 정보 DB에 insert
	public int insertAttend(NewAttendVO newAttend) throws DataAccessException;
}
