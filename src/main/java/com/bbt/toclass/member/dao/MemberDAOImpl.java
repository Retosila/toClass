package com.bbt.toclass.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bbt.toclass.member.vo.ApplicantVO;
import com.bbt.toclass.member.vo.ClassVO;
import com.bbt.toclass.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	@Autowired
	private SqlSession sqlSession;

	/*
	 * 
	 * 
	 * 회원관리
	 * 
	 * 
	 */
	
	@Override
	public MemberVO loginByEmail(MemberVO member) throws DataAccessException{
		logger.info("myBatis에게 쿼리 요청 : loginByEmail : " + member.getMember_email());
		MemberVO vo = sqlSession.selectOne("mapper.member.loginByEmail", member);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		if (vo != null) {
			logger.info("계정 로그인 승인 : " + vo.getMember_email() );
		}
		else {
			logger.info("계정 로그인 거부 " );
		}
		return vo;
	}

	@Override
	public int checkEmailDuplicate(MemberVO member) throws DataAccessException{
		logger.info("myBatis에게 쿼리 요청 : checkEmailDuplicate : " + member.getMember_email());
		int result = sqlSession.selectOne("mapper.member.checkEmailDuplicate", member);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info("result : " + result);
		return result;
	}

	@Override
	public MemberVO getMemberInfo(MemberVO member) throws DataAccessException{
		logger.info("myBatis에게 쿼리 요청 : getMemberInfoByEmail");
		MemberVO vo = sqlSession.selectOne("mapper.member.getMemberInfoByEmail", member);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		if (vo != null) {
			logger.info("대응되는 회원 레코드 조회 : " + vo.getMember_email());
		}
		else {
			logger.info("대응되는 회원 레코드 비존재");
		}
		return vo;
	}

	@Override
	public int register(MemberVO member) throws DataAccessException{
		logger.info("myBatis에게 요청 : insertMember : " + member.getMember_email());
		int result = sqlSession.insert("mapper.member.insertMember", member);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info(result + "개의 회원 레코드 추가");
		return result;
	}

	@Override
	public MemberVO findAccount(MemberVO member) throws DataAccessException{
		logger.info("myBatis에게 쿼리 요청 : findAccountByNameAndPhone");
		MemberVO vo = sqlSession.selectOne("mapper.member.findAccountByNameAndPhone", member);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		if (vo != null) {
			logger.info("대응되는 회원 레코드 조회 : " + vo.getMember_email());
		}
		else {
			logger.info("대응되는 회원 레코드 비존재");
		}
		return vo;
	}

	@Override
	public int unregister(MemberVO member) throws DataAccessException{
		logger.info("myBatis에게 쿼리 요청 : deleteMember : " + member.getMember_email());
		int result = sqlSession.delete("mapper.member.deleteMember", member);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info(result + "개의 회원 레코드 삭제");
		return result;
	}

	@Override
	public MemberVO infoById(String email) throws DataAccessException{
		MemberVO vo = sqlSession.selectOne("mapper.member.infoByEmail", email);
		logger.info(vo.getCurrentClass());
		return vo;
	}

	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException{
		System.out.println("memberDAO.updateMember 메소드 실행 성공");
		int result= sqlSession.update("mapper.member.updateMember", memberVO);
		System.out.println("쿼리문 실행 성공");
		return result;

	}

	@Override
	public MemberVO updateById(String email) throws DataAccessException{
		MemberVO vo = sqlSession.selectOne("mapper.member.updateById",email);
		return vo;
	}

	@Override
	public boolean checkPw(String member_email,String member_pw) {
		boolean result = false;
		Map<String, String> map= new HashMap<String, String>();
		map.put("member_email", member_email);
		map.put("member_pw", member_pw);
		int count = sqlSession.selectOne("mapper.member.checkPw",map);
		if(count==1) result=true;
		return result;
	}
	
	/*
	 * 
	 * 
	 * 학급 관리
	 * 
	 * 
	 */
	
	
	@Override
	public List<MemberVO> getMyStudentList(String class_id) throws DataAccessException{
		// 교사 이메일 정보를 사용하여 교사의 담당학급에 소속된 학생들의 이메일 정보를 추출
		logger.info("myBatis에게 쿼리 요청 : getClassMemberEmailByClassId : " + class_id);
		List<String> studentEmailList = sqlSession.selectList("mapper.member.getClassMemberEmailByClassId", class_id);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info(studentEmailList.size() + "개의 학생 이메일 추출");
		// for문을 돌려서 이메일 정보를 바탕으로 회원 정보를 추출
		List<MemberVO> studentList = new ArrayList<MemberVO>();
		int cnt = 0;
		for(String email : studentEmailList) {
			MemberVO mvo = sqlSession.selectOne("mapper.member.getStudentListByEmail", email);
			studentList.add(mvo);
			cnt += 1;
		}
		logger.info(cnt + "개의 학생 정보 추출");
		return studentList;
	}

	@Override
	public ClassVO getMyClassInfo(String class_id) throws DataAccessException{
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

	@Override
	public int checkClassCodeDuplicate(String class_code) throws DataAccessException{
		logger.info("myBatis에게 쿼리 요청 : checkClassCodeDuplicateByClassCode : " + class_code);
		int result = sqlSession.selectOne("mapper.member.checkClassCodeDuplicateByClassCode", class_code);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info("result : " + result);
		return result;
	}

	@Override
	public String createClass(Map<String, String> map) throws DataAccessException{
		logger.info("myBatis에게 쿼리 요청 : createNewClass");
		String class_code = map.get("class_code");
		String class_name = map.get("class_name");
		logger.info("클래스코드 : " + class_code);
		logger.info("클래스이름 : " + class_name);
		int result = sqlSession.insert("mapper.member.createNewClass", map);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		// 새 학급 생성 성공 시, 새로 생성된 학급의 ID를 가져옴
		if (result > 0) {
			String class_id = sqlSession.selectOne("mapper.member.getRecentClassIdByEmail", map.get("member_email"));
			logger.info("생성된 클래스의 ID : " + class_id);
			return class_id;
		}
		else {
			logger.info("오류 발생 : 클래스 생성 실패");
			return "오류 발생 : 클래스 생성 실패";
		}

	}

	@Override
	public int addClassLog(Map<String, String> map) throws DataAccessException{
		logger.info("myBatis에게 쿼리 요청 : addClassLog");
		int result = sqlSession.insert("mapper.member.addClassLog", map);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		if (result > 0) {
			logger.info(result + "개의 클래스 log 추가 완료");
		}
		else {
			logger.info("클래스 log 추가 실패");
		}

		return result;
	}

	@Override
	public int delMyClass(String class_id) throws DataAccessException{
		// Class 테이블에서 제거
		logger.info("myBatis에게 쿼리 요청 : delMyClassByClassId");
		int result = sqlSession.delete("mapper.member.delMyClassByClassId", class_id);
		logger.info("myBatis로부터 성공적으로 응답 수신");

		// Info 테이블에서 제거
		logger.info("myBatis에게 쿼리 요청 : delMyClassInfoByClassId");
		int result2 = sqlSession.delete("mapper.member.delMyClassInfoByClassId", class_id);
		logger.info("myBatis로부터 성공적으로 응답 수신");

		logger.info("myBatis로부터 성공적으로 응답 수신");
		if (result > 0 && result2 > 0) {
			logger.info(result + "개의 클래스 삭제 완료");
			logger.info(result2 + "개의 클래스 log 삭제 완료");
		}
		else {
			logger.info("클래스 삭제 실패");
		}

		return result;
	}

	@SuppressWarnings("unused")
	@Override
	public int applyClass(String class_code, MemberVO member) throws DataAccessException{
		// 클래스 코드와 매칭되는 인스턴스의 클래스 ID 추출
		logger.info("myBatis에게 쿼리 요청 : getClassIdByClassCode : " + class_code);
		String class_id = sqlSession.selectOne("mapper.member.getClassIdByClassCode", class_code);
		String name = member.getMember_name();
		String email = member.getMember_email();
		String phone = member.getMember_phone();
		logger.info("매칭되는 클래스 id : " + class_id);
		logger.info("회원명 : " + name);
		logger.info("회원이메일 : " + email);
		logger.info("회원연락처 : " + phone);
		// 매칭되는 클래스 id존재 시, class_applicant 테이블에
		if (class_id != null) {
			// ApplicantVO 객체에 값 저장
			ApplicantVO avo = new ApplicantVO();
			avo.setClass_id(class_id);
			avo.setName(name);
			avo.setEmail(email);
			avo.setPhone(phone);

			logger.info("myBatis에게 쿼리 요청 : addApplicant : " + email);
			int result = sqlSession.insert("mapper.member.addApplicant", avo);
			logger.info("myBatis로부터 성공적으로 응답 수신");
			logger.info(result + " 개의 applicant 추가 완료");

			return result;
		}
		else {
			logger.info("유효하지 않은 클래스코드입니다.");
			return 0;
		}

	}

	@Override
	public int checkIsPending(String member_email) throws DataAccessException {
		logger.info("myBatis에게 쿼리 요청 : checkIsPendingByEmail : " + member_email);
		int result = sqlSession.selectOne("mapper.member.checkIsPendingByEmail", member_email);
		logger.info("myBatis로부터 성공적으로 응답 수신");

		return result;
	}

	@Override
	public List<ApplicantVO> getApplicantList(String class_id) throws DataAccessException {
		logger.info("myBatis에게 쿼리 요청 : getApplicantListByClassId : " + class_id);
		List<ApplicantVO> applicantList = sqlSession.selectList("mapper.member.getApplicantListByClassId", class_id);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info(applicantList.size() + " 명의 applicant 추출 완료");

		return applicantList;
	}

	@Override
	public int acceptApplicant(String member_email, String class_id) throws DataAccessException  {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_email", member_email);
		map.put("class_id", class_id);

		// class_applicant에서 레코드 삭제
		logger.info("myBatis에게 쿼리 요청 : delApplicantByClassIdAndMemberEmail : " + member_email);
		int result = sqlSession.delete("mapper.member.delApplicantByClassIdAndMemberEmail", map);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info(result + " 명의 applicant 삭제 완료");

		// info 테이블에 레코드 추가
		if (result > 0) {
			logger.info("myBatis에게 쿼리 요청 : addClassLog : " + member_email);
			int result2 = sqlSession.insert("mapper.member.addClassLog", map);
			logger.info("myBatis로부터 성공적으로 응답 수신");
			logger.info(result2 + " 개의 클래스 log 추가 완료");

			return result2;
		}
		else {
			logger.info("존재하지 않는 가입 신청자");

			return 0;
		}

	}

	@Override
	public int rejectApplicant(String member_email, String class_id) throws DataAccessException  {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_email", member_email);
		map.put("class_id", class_id);

		// class_applicant에서 레코드 삭제
		logger.info("myBatis에게 쿼리 요청 : delApplicantByClassIdAndMemberEmail : " + member_email);
		int result = sqlSession.delete("mapper.member.delApplicantByClassIdAndMemberEmail", map);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info(result + " 명의 applicant 삭제 완료");

		return result;
	}

	@Override
	public int delMyStudent(String member_email, String class_id) throws DataAccessException  {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_email", member_email);
		map.put("class_id", class_id);

		// class_applicant에서 레코드 삭제
		logger.info("myBatis에게 쿼리 요청 : delMyStudentFromClassByClassId : " + member_email);
		int result = sqlSession.delete("mapper.member.delMyStudentFromClassByClassId", map);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info(result + " 명의 학급원 삭제 완료");

		return result;
	}





}
