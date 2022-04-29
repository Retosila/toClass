package com.bbt.toclass.schedule.service;

import java.util.List;

import com.bbt.toclass.schedule.vo.ScheduleVO;

public interface ScheduleService {

	
	public List<ScheduleVO> getSchedule(String member_email) throws Exception;
}
