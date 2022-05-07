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
		
		// AttendDTO를 바탕으로 DB로부터 출결 정보 조회 후, AttendVO 객체(최대 5개) 반환 
		List<AttendVO> attendVOList = attendanceDAO.getAttendanceInfo(attendDTO);
		
		if(attendVOList.isEmpty()) {
			ShowAttendVO savo = new ShowAttendVO();
			savo.setMember_name(attendanceDAO.getStuNames(attendDTO.getMember_email()).getMember_name());
			savo.setAttend_status(setButton(new ArrayList<>()));
			return savo;
		}
		// AttendVO를 하나로 압축하기 위한 객체 ShowAttendVO 객체 생성
		ShowAttendVO savo = new ShowAttendVO();
		
		// ShowAttendVO에 set하기 위한 변수들
		String member_name = attendVOList.get(0).getMember_name();
		List<String> attend_status = new ArrayList<String>();
		List<String> attend_time = new ArrayList<String>();
		
		// for문을 통해 AttendVO 객체들을 ShowAttendVO 객체로 압축
		for (int i = 0; i < attendVOList.size(); i++) {
			attend_status.add(attendVOList.get(i).getAttend_status());
			attend_time.add(attendVOList.get(i).getAttend_time());
		}
		
		// setter로 값 설정
		savo.setMember_name(member_name);
		savo.setAttend_status(attend_status);
		savo.setAttend_time(attend_time);
		
		return savo;
	}
	
	@Override
	public List<String> getStuEmails(String email) {
		return attendanceDAO.getStuEmails(email);
	}
	
	private List<String> setButton(List<String> nowStatus) {
		
		String t1 = "<td><button class=\"btn btn-primary dropdownMenuButton\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" style=\"border-color: rgb(255 255 255/ 50%) !important;\">출석</button>"
					+ "<div class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuButton\">"
					+ "								<a class=\"dropdown-item\">출석</a> <a class=\"dropdown-item\">조퇴</a>"
					+ "								<a class=\"dropdown-item\">지각</a> <a class=\"dropdown-item\">결석</a>"
					+ "							</div>"
					+ "						</div></td>";
		
		int idx = 0;
		
		if (nowStatus.size() == 5) return nowStatus;
		else if(nowStatus.size() < 5) idx = 5 - nowStatus.size();
			
		for(int i=0; i<idx; i++) {
			nowStatus.add(t1);
		}
		
		return nowStatus;
	}
	
}
