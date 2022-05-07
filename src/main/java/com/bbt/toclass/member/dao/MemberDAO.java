package com.bbt.toclass.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bbt.toclass.member.vo.ApplicantVO;
import com.bbt.toclass.member.vo.ClassVO;
import com.bbt.toclass.member.vo.MemberVO;

public interface MemberDAO {
	MemberVO loginByEmail(MemberVO member) throws DataAccessException;
	
	int checkEmailDuplicate(MemberVO member) throws DataAccessException;
	
	int register(MemberVO member) throws DataAccessException;
	
	int unregister(MemberVO member) throws DataAccessException;
	
	MemberVO findAccount(MemberVO member) throws DataAccessException;

	MemberVO getMemberInfo(MemberVO member) throws DataAccessException;

	List<MemberVO> getMyStudentList(String class_id) throws DataAccessException;

	ClassVO getMyClassInfo(String class_id) throws DataAccessException;

	int checkClassCodeDuplicate(String class_code) throws DataAccessException;

	String createClass(Map<String, String> map) throws DataAccessException;

	int addClassLog(Map<String, String> map) throws DataAccessException;

	int delMyClass(String class_id) throws DataAccessException;

	int applyClass(String class_code, MemberVO member) throws DataAccessException;

	int checkIsPending(String member_email) throws DataAccessException;

	List<ApplicantVO> getApplicantList(String class_id) throws DataAccessException;

	int acceptApplicant(String member_email, String class_id) throws DataAccessException;

	int rejectApplicant(String member_email, String class_id) throws DataAccessException;

	int delMyStudent(String member_email, String class_id) throws DataAccessException;
}