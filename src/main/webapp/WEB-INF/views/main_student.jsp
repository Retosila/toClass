<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<body>
<h3>${member.member_name} 학우님 환영합니다!</h3>
</body>
</html>
