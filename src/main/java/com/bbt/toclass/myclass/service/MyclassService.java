package com.bbt.toclass.myclass.service;

import com.bbt.toclass.myclass.vo.MyclassVO;

public interface MyclassService {
	
	public int getStudentCnt(String email);
	
	public void saveMyclass(MyclassVO myclassVo);
}
