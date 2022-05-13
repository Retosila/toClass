package com.bbt.toclass.attendance.service;

import com.bbt.toclass.attendance.dao.AttendanceDAO;
import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.AttendVO;
import com.bbt.toclass.attendance.vo.MyAttendVO;
import com.bbt.toclass.attendance.vo.ShowAttendVO;
import com.bbt.toclass.member.controller.MemberControllerImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("attendanceService")
public class AttendanceServiceImpl implements AttendanceService {

	// log4j 로깅용
	private static final Logger logger = LoggerFactory.getLogger(AttendanceServiceImpl.class);
	
	@Autowired
	AttendanceDAO attendanceDAO;

	@Override
	public ShowAttendVO getAttendanceInfo(AttendDTO attendDTO) throws Exception {

		// AttendDTO를 바탕으로 DB로부터 출결 정보 조회 후, AttendVO 객체(최대 5개) 반환
		List<AttendVO> attendVOList = attendanceDAO.getAttendanceInfo(attendDTO);

		// AttendVO를 하나로 압축하기 위한 객체 ShowAttendVO 객체 생성
		ShowAttendVO savo = new ShowAttendVO();

		// ShowAttendVO에 set하기 위한 변수들
		String member_name = attendVOList.get(0).getMember_name();
		List<String> attend_status = new ArrayList<String>();
		List<String> attend_time = new ArrayList<String>();

		// for문을 통해 AttendVO 객체들을 ShowAttendVO 객체로 압축
		for (int i = 0; i < attendVOList.size(); i++) {
			attend_status.add(attendVOList.get(i).getAttend_status());
			attend_time.add(attendVOList.get(i).getAttend_time());
		}

		// setter로 값 설정
		savo.setMember_name(member_name);
		savo.setAttend_status(attend_status);
		savo.setAttend_time(attend_time);

		return savo;
	}
	
	
	@Override
	public List<MyAttendVO> getAttendance(String member_email) throws Exception {
		
		// 이메일 정보를 바탕으로 로그인 학생의 출결정보 획득
		logger.info("DAO에 출결 정보 요청");
		logger.info("요청 학급원 : " + member_email);
		
		List<MyAttendVO> myAttendVOList = attendanceDAO.getAttendance(member_email);
		logger.info("DAO로부터 성공적으로 응답 수신");
		
		return myAttendVOList;
	}

	//교사가 운영하는 학급에 속한 학생의 이메일 출력
	@Override
	public List<String> getClassMemberEmail(String member_email) throws Exception {
		List<AttendDTO> eList = attendanceDAO.getClassMemberEmail(member_email);
		List<String> emailList = new ArrayList<String>();

		List<String> member_email1 = new ArrayList<String>();
		for(int i = 0; i<eList.size(); i++ ) {
			member_email1.add(eList.get(i).getMember_email());
		}
		emailList.addAll(member_email1);
		return emailList;
	}
		
		
		
}
