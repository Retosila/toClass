package com.bbt.toclass.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bbt.toclass.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO loginByEmail(MemberVO member) throws DataAccessException{
		logger.info("myBatis에게 쿼리 요청 : loginByEmail : " + member.getMember_email());
		MemberVO vo = sqlSession.selectOne("mapper.member.loginByEmail", member);
		logger.info("myBatis로부터 성공적으로 응답 수신");
		logger.info("계정 로그인 승인 : " + member.getMember_email() );
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
	
}
