package com.bbt.toclass.attendance.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbt.toclass.attendance.dao.AttendanceDAO;
import com.bbt.toclass.attendance.vo.AttendDTO;
import com.bbt.toclass.attendance.vo.AttendVO;
import com.bbt.toclass.attendance.vo.ShowAttendVO;

@Service("attendanceService")
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	AttendanceDAO attendanceDAO;
	
	public ShowAttendVO getAttendanceInfo(AttendDTO attendDTO) throws Exception {
		List<AttendVO> attendVOList = attendanceDAO.getAttendanceInfo(attendDTO);
		ShowAttendVO savo = new ShowAttendVO();
		
		String member_name = attendVOList.get(0).getMember_name();
		List<String> attend_status = new ArrayList<String>();
		List<String> attend_time = new ArrayList<String>();
		
		for (int i = 0; i < attendVOList.size(); i++) {
			attend_status.add(attendVOList.get(i).getAttend_status());
			attend_time.add(attendVOList.get(i).getAttend_time());
		}
		
		savo.setMember_name(member_name);
		savo.setAttend_status(attend_status);
		savo.setAttend_time(attend_time);
		
		return savo;
	}
	
}
