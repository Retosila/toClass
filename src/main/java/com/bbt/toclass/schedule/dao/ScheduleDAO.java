package com.bbt.toclass.schedule.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.bbt.toclass.schedule.vo.ScheduleVO;

public interface ScheduleDAO {

	List<ScheduleVO> getSchedule(String member_email) throws DataAccessException; 
	
	
}
