package com.bbt.toclass.member.service;

import java.util.List;
import java.util.Map;

import com.bbt.toclass.member.vo.ApplicantVO;
import com.bbt.toclass.member.vo.ClassVO;
import com.bbt.toclass.member.vo.MemberVO;
import org.springframework.dao.DataAccessException;

public interface MemberService {

	// 로그인
	MemberVO login(MemberVO member) throws Exception;

	// 인증번호 전송
	void sendAuthCode(String authCode, String email) throws Exception;

	// 이메일 중복확인
	String checkEmailDuplicate(MemberVO member) throws Exception;

	// 회원가입(DB에 등록)
	boolean register(MemberVO member) throws Exception;

	// 회원탈퇴(DB에서 삭제)
	boolean unregister(MemberVO member) throws Exception;

	// 계정찾기
	String findAccount(MemberVO member) throws Exception;

	// 비밀번호 찾기
	String findPw(MemberVO member) throws Exception;

	// 학생명부 호출
	List<MemberVO> getMyStudentList(String class_id) throws Exception;

	// 학급 정보 호출
	ClassVO getMyClassInfo(String class_id) throws Exception;

	// 새 학급 생성
	String createClass(Map<String, String> map) throws Exception;

	// info 테이블에 로그 생성
	int addClassLog(Map<String, String> map) throws Exception;

	// 학급 제거
	int delMyClass(String class_id) throws Exception;

	// 학급 가입 신청
	int applyClass(String class_code, MemberVO member) throws Exception;

	// 가입 승인 대기 여부 확인
	int checkIsPending(String member_email) throws Exception;

	// 학급 가입 신청자 명단 생성
	List<ApplicantVO> getApplicantList(String class_id) throws Exception;

	// 가입 신청자 승인/거부
	int acceptApplicant(String member_email, String accept, String class_id) throws Exception;

	// 학급원 삭제 요청
	int delMyStudent(String member_email, String class_id) throws Exception;
	public MemberVO viewInfo(String email) throws Exception;

	public int modMember(MemberVO memberVO) throws DataAccessException;

	public MemberVO updateDo(String email) throws Exception;

	boolean checkPwDo(String member_email, String member_pw) throws Exception;

}
