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
<title>교사 메인페이지(main_teacher.jsp)</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

</script>
</head>
<body>
<h3>${member.member_name} 선생님 환영합니다!</h3>
logOn=${LogOn}
${member.member_email}
</body>
</html>