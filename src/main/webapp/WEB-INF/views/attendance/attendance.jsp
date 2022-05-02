<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>

<!-- ShowAttendVOList 구조 설명
 1. ShowAttendVOList는 여러 개의 ShowAttendVO 객체로 구성된 List<ShowAttendVO> 배열 객체이다.
 2. ShowAttendVO객체는 String member_name(학생명), List<AttendVO> attend_status

 -->

<table border="1">
	<c:forEach var="showAttendVO" items="${ShowAttendVOList}">
		<tr>
			<th rowspan="2">${showAttendVO.member_name}</th>
			<c:forEach var="attendVOStat" items="${showAttendVO.attend_status}">
				<td>${attendVOStat}</td>	
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="attendVOTime" items="${showAttendVO.attend_time}">
				<td>${attendVOTime}</td>	
			</c:forEach>
		</tr>
	</c:forEach>
</table>

</body>
</html>
