package com.bbt.toclass.schedule.service;

import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.bbt.toclass.schedule.vo.MenuDTO;
import com.bbt.toclass.schedule.vo.MenuVO;
import com.bbt.toclass.schedule.vo.ShowMenuVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbt.toclass.member.vo.MemberVO;
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

	public int addSchedule(ScheduleVO newSchedule) throws Exception {
		logger.info("DAO에 일정 추가 요청");

		// isForAll의 값에 따라 다른 로직 구현
		boolean isForAll = newSchedule.isForAll();
		logger.info("일괄 추가 옵션 : " + isForAll);

		// 1. isForAll == true 일 때 교사의 담당 학생들의 DB에도 일정 추가
		if (isForAll == true) {
			int result = scheduleDAO.addScheduleAll(newSchedule);
			return result;
		}

		// 2. ifForAll == false 일 때 해당 회원만 일정 추가
		else if (isForAll == false) {
			int result = scheduleDAO.addSchedule(newSchedule);
			return result;
		}
		else {
			logger.info("오류 : 추가된 일정이 없습니다.");
			return 0;
		}

	}

	public int delSchedule(Map<String, String> param) throws Exception{
		logger.info("DAO에 일정 삭제 요청");
		return scheduleDAO.delSchedule(param);
	}
	@Override
	public ShowMenuVO getMenuInfoByDTO(MenuDTO menuDTO) throws Exception{

		List<MenuVO> menuVOList = scheduleDAO.getMenuInfoByDTO(menuDTO);

		ShowMenuVO smvo = new ShowMenuVO();

		Integer test = menuVOList.size();
		logger.info(test.toString());
		String menu_content1 = menuVOList.get(0).getMenu_content();
		logger.info(menu_content1);
		List<String> menu_content2 = new ArrayList<String>();

		for(int i = 0; i < menuVOList.size(); i++ ) {
			menu_content2.add(menuVOList.get(i).getMenu_content());
		}

		smvo.setMenu_content(menu_content2);
		return smvo;
	}


	@Override
	public List<Date> getMenuDate(Date menu_date)  throws Exception {
		List<MenuDTO> dList = scheduleDAO.getMenuDate(menu_date);
		List<Date> dateList = new ArrayList<Date>();

		List<Date> menu_date1 = new ArrayList<Date>();
		for(int i = 0; i<dList.size(); i++ ) {
			menu_date1.add(dList.get(i).getMenu_date());
		}
		dateList.addAll(menu_date1);
		return dateList;

	}

}
