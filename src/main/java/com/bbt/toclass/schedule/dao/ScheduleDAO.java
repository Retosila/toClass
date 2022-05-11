package com.bbt.toclass.schedule.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.bbt.toclass.schedule.vo.MenuDTO;
import com.bbt.toclass.schedule.vo.MenuVO;
import org.springframework.dao.DataAccessException;

import com.bbt.toclass.schedule.vo.ScheduleVO;

public interface ScheduleDAO {

	List<ScheduleVO> getSchedule(String member_email) throws DataAccessException;

	int addSchedule(ScheduleVO newSchedule) throws DataAccessException;

	int addScheduleAll(ScheduleVO newSchedule) throws DataAccessException;

	int delSchedule(Map<String, String> param) throws DataAccessException;
	List<MenuVO> getMenuInfoByDTO(MenuDTO menuDTO) throws Exception;

	List<MenuDTO> getMenuDate(Date menu_date) throws Exception;
}
