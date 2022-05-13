package com.bbt.toclass.achievement.service;

import java.util.List;

import com.bbt.toclass.achievement.vo.AchievementVO;

public interface AchievementService {

	List<AchievementVO> getAchievement(String member_email) throws Exception;
	List<AchievementVO> getMyStudentAchievement(String member_email) throws Exception;
}
