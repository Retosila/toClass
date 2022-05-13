package com.bbt.toclass.attendance.dao;

import com.bbt.toclass.attendance.vo.*;
import com.bbt.toclass.member.vo.ClassVO;
import com.bbt.toclass.member.vo.MemberVO;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("attendanceDAO")
public class AttendanceDAOImpl implements AttendanceDAO {

	private static final Logger logger = LoggerFactory.getLogger(AttendanceDAOImpl.class);

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<AttendVO> getAttendanceInfo(AttendDTO attendDTO) throws Exception {
		System.out.println("DB에 getAttendanceInfoByDTO 요청");
		System.out.println("요청이메일 : " + attendDTO.getMember_email());
		System.out.println("월요일 : " + attendDTO.getMonday());
		System.out.println("금요일 : " + attendDTO.getFriday());
		List<AttendVO> attendVOList = sqlSession.selectList("mapper.attendance.getAttendanceInfoByDTO", attendDTO);
		System.out.println("DB에 getAttendanceInfoByDTO 요청성공! : " + attendVOList.size());
		//데이터가 없어도 member_name이 출력
		if (attendVOList.size() == 0) {
			AttendVO avo = new AttendVO();
			String member_name = sqlSession.selectOne("mapper.attendance.getMemberNameByEmail", attendDTO.getMember_email());
			avo.setMember_name(member_name);
			attendVOList.add(avo);
		}


		for (AttendVO avo : attendVOList) {
			System.out.println(avo.getAttend_status());
		}
		return attendVOList;
	}

	@Override
	public List<MyAttendVO> getAttendance(String member_email) throws Exception {
		logger.info("DB에 getAttendanceByEmail 요청");
		List<MyAttendVO> myAttendVOList = sqlSession.selectList("mapper.attendance.getAttendanceByEmail", member_email);

		// 출결status에 따른 블록 색상 지정
		for (MyAttendVO mavo : myAttendVOList) {
			mavo.addSetting();
		}
		return myAttendVOList;
	}

	@Override
	public List<AttendDTO> getClassMemberEmail(String class_id) throws Exception {
		System.out.println("DB에 getClassMemberEmailByClassId 요청");
		List<AttendDTO> memberEmailList = sqlSession.selectList("mapper.attendance.getClassMemberEmailByClassId", class_id);
		for(AttendDTO adto : memberEmailList) {
			System.out.println(adto.getMember_email());
		}
		return memberEmailList;
	}

	@Override
	//회원이 소속되어 있는 학급 정보를 조회, 조회된 학급 정보가 존재할 시 해당 회원과
	//class_id가 같은 회원들을 조회
	public ClassVO classInfo(AttendanceVO attendanceVO) throws Exception{
		String member_email = attendanceVO.getMember_email();
		logger.info("myBatis에게 쿼리 요청 : getClassIdByEmail : " + member_email);
		String class_id = sqlSession.selectOne("mapper.attendance.getClassIdByEmail", member_email);
		logger.info("소속 학급 정보 추출 성공 : " + class_id);

		ClassVO atvo = new ClassVO();
		atvo.setClass_id(class_id);

		return atvo;

	}

	public ClassVO  getMyClassInfo(String class_id) throws DataAccessException{
		logger.info("myBatis에게 쿼리 요청 : getMyClassInfoByClassId : " + class_id);
		ClassVO cvo = sqlSession.selectOne("mapper.member.getMyClassInfoByClassId", class_id);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		if (cvo != null) {
			logger.info("대응하는 학급 존재 : " + cvo.getClass_id());
		}
		else {
			logger.info("대응하는 학급 비존재");
		}

		return cvo;

	}
	/*
	@Override
	//class_id와 member_name으로 member_email 정보 출력
	public List<MemberVO> getClassMemberEmailByClassIdAndName(String class_id, String member_name) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		map.put("member_name", member_name);
		map.put("class_id", class_id);

		System.out.println("DB에 getClassMemberEmailByClassIdAndMember_name 요청");
		List<MemberVO> memEmailList = sqlSession.selectList("mapper.attendance.getClassMemberEmailByClassIdAndMember_name", map);
		for(MemberVO mvo : memEmailList) {
			System.out.println(mvo.getMember_email());
		}
		return memEmailList;
	}

	@Override
	//출석 정보 저장
	public int insertAttend(NewAttendVO newAttendVO) throws DataAccessException {
		logger.info("DB에게 쿼리 요청 : insertAttendByMember_name : " + newAttendVO.getMember_name());
		int result = sqlSession.insert("mapper.attendance.insertAttendByMember_name", newAttendVO);
		logger.info("DB로부터 성공적으로 응답 수신");
		logger.info(result + " 개의 출석 정보 추가 완료");
		return result;
	} */

	@Override
	//출석 정보 DB에 insert
	public int insertAttend(NewAttendVO newAttend) throws DataAccessException {

		//class_id와 member_name을 사용하여 member_email 정보 추출
		String member_name = newAttend.getMember_name();
		String class_id = newAttend.getCurrentClass();

		logger.info(member_name);
		logger.info(class_id);

		System.out.println("DB에 getClassMemberEmailByClassIdAndMember_name 요청");
		String memberEmail = sqlSession.selectOne("mapper.attendance.getClassMemberEmailByClassIdAndMember_name", newAttend);

		logger.info("DB로부터 성공적으로 응답 수신");
		logger.info(memberEmail + "의 학생 이메일 추출");
		newAttend.setMember_email(memberEmail);

		int result = sqlSession.insert("mapper.attendance.insertAttendByMember_email", newAttend);




//		logger.info("DB에게 쿼리 요청 : insertAttendByMember_email : " + member_email);
//		int result = sqlSession.insert("mapper.attendance.insertAttendByMember_email", newAttendVO);
//		logger.info("DB로부터 성공적으로 응답 수신");
//		logger.info(result + " 개의 출석 정보 추가 완료");

		return result;
	}
}
