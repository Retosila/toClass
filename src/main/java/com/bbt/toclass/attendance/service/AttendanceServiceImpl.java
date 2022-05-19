package com.bbt.toclass.attendance.service;

import com.bbt.toclass.attendance.dao.AttendanceDAO;
import com.bbt.toclass.attendance.vo.*;
import com.bbt.toclass.attendance.vo.ShowAttendVO;
import com.bbt.toclass.member.dao.MemberDAO;
import com.bbt.toclass.member.service.MemberServiceImpl;
import com.bbt.toclass.member.vo.ClassVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service("attendanceService")
public class AttendanceServiceImpl implements AttendanceService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	AttendanceDAO attendanceDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private AttendanceVO attendanceVO;

	@Override
	public ShowAttendVO getAttendanceInfo(AttendDTO attendDTO) throws Exception {

		// AttendDTO를 바탕으로 DB로부터 출결 정보 조회 후, AttendVO 객체(최대 5개) 반환
		List<AttendVO> attendVOList = attendanceDAO.getAttendanceInfo(attendDTO);

		// AttendVO를 하나로 압축하기 위한 객체 ShowAttendVO 객체 생성
		ShowAttendVO savo = new ShowAttendVO();

		System.out.println("dao로부터 요청 수신 성공! : " + attendVOList.size() );

		if (attendVOList.size() > 0) {
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
		}

		System.out.println("서비스는 무죄야!");


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
	public List<String> getClassMemberEmail(String class_id) throws Exception {
		logger.info("service : getClassMemberEmail 요청");
		List<AttendDTO> eList = attendanceDAO.getClassMemberEmail(class_id);
		List<String> emailList = new ArrayList<String>();
		logger.info("service : getClassMemberEmail 성공");
		List<String> member_email1 = new ArrayList<String>();
		for(int i = 0; i<eList.size(); i++ ) {
			member_email1.add(eList.get(i).getMember_email());
		}
	//	String member_email1 =  eList.get(0).getMember_email();
		emailList.addAll(member_email1);
		logger.info("service : getClassMemberEmail 무죄!");
		return emailList;
	}
	

	// 내 학급 정보 요청
		@Override
		public ClassVO getMyClassInfo(String class_id) throws Exception {
			logger.info("DAO에 학급 세부 정보 요청");
			ClassVO cvo = attendanceDAO.getMyClassInfo(class_id);
			logger.info("DAO로부터 성공적으로 응답 수신");

			return cvo;
		}

		@Override
		//출석 정보 DB에 insert
		public int insertAttend(NewAttendVO newAttend) throws Exception {
			logger.info("DAO에 출석 정보 저장 요청");
			int result = attendanceDAO.insertAttend(newAttend);


			return result;
		}
}
