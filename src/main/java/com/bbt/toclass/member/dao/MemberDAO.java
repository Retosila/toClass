package com.bbt.toclass.member.dao;

import org.springframework.dao.DataAccessException;

import com.bbt.toclass.member.vo.MemberVO;

public interface MemberDAO {

	MemberVO loginByEmail(MemberVO member) throws DataAccessException;
	
	int checkEmailDuplicate(MemberVO member) throws DataAccessException;
	
	int register(MemberVO member) throws DataAccessException;
	
	int unregister(MemberVO member) throws DataAccessException;
	
	MemberVO findAccount(MemberVO member) throws DataAccessException;
	
	MemberVO getMemberInfo(MemberVO member) throws DataAccessException;
	
	public MemberVO infoById(String email) throws DataAccessException;
	
	public int updateMember(MemberVO memberVO)throws DataAccessException;
	
	public MemberVO updateById(String email) throws DataAccessException;

	boolean checkPw(String member_email, String member_pw) throws DataAccessException;


	
	

	
	
}
