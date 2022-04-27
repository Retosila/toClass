<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지_1단계(/member/register_1.jsp)</title>
</head>
<body>
<h4>확인용 | 회원타입 : ${member_type}</h4>

<form method="post" action="${contextPath}/member/register_2">
	<!-- 만 14세 이상 여부 확인<input name="fourteen" type="checkbox" value="true"/> -->
	약관 동의 여부(필수) | <a href="${contextPath}/member/policy" target="_blank">보기</a> &nbsp; <input name="policy" type="checkbox" value="true" required/>	<br>
	개인 정보 취급방침 동의 여부(필수)	| <a href="${contextPath}/member/personal" target="_blank">보기</a> &nbsp; <input name="personal" type="checkbox" value="true" required/><br>
	<br>
	<input type="submit"/><br>
</form>

</body>
</html>