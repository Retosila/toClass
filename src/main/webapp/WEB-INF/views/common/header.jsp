<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>header</title>
</head>
<body>
<p>i am a header!</p>
<h3>${member.member_name}님 안녕하세요!</h3>
<button id="logout" type="button" onclick="location.href='${contextPath}/member/logout.do'">로그아웃</button>
<input type="button" value="내정보" class="btn" onclick="location.href='${contextPath}/info?email=${member.member_email}'">
<%-- <button id="myclass" type="button" onclick="location.href='${contextPath}/member/myClass.do'">내학급</button> --%>
</body>
</html>