package com.bbt.toclass.schedule.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bbt.toclass.schedule.vo.ScheduleVO;

public interface ScheduleDAO {

	List<ScheduleVO> getSchedule(String member_email) throws DataAccessException; 
	
	int addSchedule(ScheduleVO newSchedule) throws DataAccessException;
	
	int addScheduleAll(ScheduleVO newSchedule) throws DataAccessException;
	
	int delSchedule(Map<String, String> param) throws DataAccessException;
}
