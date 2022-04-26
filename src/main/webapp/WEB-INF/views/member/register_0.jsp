<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>회원가입 페이지_0단계(/member/register_0.jsp)</title>

</head>

<body>

<a href="${contextPath}/member/register_1?member_type=교사">교사</a>
<br>
<a href="${contextPath}/member/register_1?member_type=학생">학생</a>



</body>
</html>