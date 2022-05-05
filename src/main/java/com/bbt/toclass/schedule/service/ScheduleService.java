package com.bbt.toclass.schedule.service;

import java.util.List;
import java.util.Map;

import com.bbt.toclass.schedule.vo.ScheduleVO;

public interface ScheduleService {

	
	List<ScheduleVO> getSchedule(String member_email) throws Exception;
	
	int addSchedule(ScheduleVO newSchedule) throws Exception;
	
	int delSchedule(Map<String, String> param) throws Exception;
	
	
	
	
}
