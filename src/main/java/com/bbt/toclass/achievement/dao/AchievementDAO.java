package com.bbt.toclass.achievement.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.bbt.toclass.achievement.vo.AchievementVO;

public interface AchievementDAO {

	List<AchievementVO> getAchievement(String member_email) throws DataAccessException;
	List<AchievementVO> getMyStudentAchievement(String member_email) throws DataAccessException;

}
