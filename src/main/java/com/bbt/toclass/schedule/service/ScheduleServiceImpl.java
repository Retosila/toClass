package com.bbt.toclass.schedule.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbt.toclass.schedule.dao.ScheduleDAO;
import com.bbt.toclass.schedule.vo.ScheduleVO;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleServiceImpl.class);
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	public List<ScheduleVO> getSchedule(String member_email) throws Exception {
		logger.info("DAO에 일정 정보 요청");
		return scheduleDAO.getSchedule(member_email);
	}
	
	
}
