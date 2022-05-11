package com.bbt.toclass.schedule.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.bbt.toclass.schedule.vo.MenuDTO;
import com.bbt.toclass.schedule.vo.ScheduleVO;
import com.bbt.toclass.schedule.vo.ShowMenuVO;

public interface ScheduleService {


	List<ScheduleVO> getSchedule(String member_email) throws Exception;

	int addSchedule(ScheduleVO newSchedule) throws Exception;

	int delSchedule(Map<String, String> param) throws Exception;
	ShowMenuVO getMenuInfoByDTO(MenuDTO menuDTO) throws Exception;

	List<Date> getMenuDate(Date menu_date) throws Exception;



}
