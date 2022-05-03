package com.bbt.toclass.achievement.dao;

import org.springframework.dao.DataAccessException;

import com.bbt.toclass.achievement.vo.AchievementVO;

public interface AchievementDAO {

	AchievementVO checkByAchievement(AchievementVO achievement) throws DataAccessException;

}
