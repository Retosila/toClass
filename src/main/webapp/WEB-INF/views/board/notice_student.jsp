<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림장(학생)</title>
</head>
<body>

<h4>최근에 받은 알림</h4>

<p>발신자 : ${recentNotice.notice_sender} </p>
<p>수정일 : ${recentNotice.notice_moddate} </p>
<p>제목 : ${recentNotice.notice_title} </p>
<p>내용 : ${recentNotice.notice_content} </p>

</body>
</html>