package com.bbt.toclass.myclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbt.toclass.myclass.dao.MyclassDAO;
import com.bbt.toclass.myclass.vo.MyclassVO;

@Service("myclassService")
public class MyclassServiceImpl implements MyclassService{
	
	@Autowired
	private MyclassDAO myclassDAO;
	
	@Override
	public int getStudentCnt(String email) {
		return myclassDAO.getStuCnt(email);
	}
	
	@Override
	public void saveMyclass(MyclassVO myclassVo) {
		myclassDAO.saveMyclass(myclassVo);
	}
}
