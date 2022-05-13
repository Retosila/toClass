package com.bbt.toclass.achievement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbt.toclass.achievement.dao.AchievementDAO;
import com.bbt.toclass.achievement.vo.AchievementVO;

@Service("achievementService")
public class AchievementServiceImpl implements AchievementService {

	@Autowired
	AchievementDAO achievementDAO;
	
	public List<AchievementVO> getAchievement(String member_email) throws Exception {
		return achievementDAO.getAchievement(member_email);
	}
	
	public List<AchievementVO> getMyStudentAchievement(String member_email) throws Exception {
		return achievementDAO.getMyStudentAchievement(member_email);
	}
}
