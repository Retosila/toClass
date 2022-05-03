package com.bbt.toclass.myclass.dao;

import org.springframework.dao.DataAccessException;

import com.bbt.toclass.member.vo.MemberVO;
import com.bbt.toclass.myclass.vo.MyclassVO;

public interface MyclassDAO {

	public int getStuCnt(String email) throws DataAccessException;
	
	public void saveMyclass(MyclassVO myclassVo);
	
	int checkEmailDuplicate(MemberVO member) throws DataAccessException;
	
	int register(MemberVO member) throws DataAccessException;
	
	int unregister(MemberVO member) throws DataAccessException;
	
	MemberVO findAccount(MemberVO member) throws DataAccessException;
	
	MemberVO getMemberInfo(MemberVO member) throws DataAccessException;
}
