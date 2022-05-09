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
<title>내 정보(/member/info.jsp)</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	// 
	function unregister() {
		var cmd = confirm("정말로 회원탈퇴하시겠습니까?");
		if (cmd) {
			location.href="${contextPath}/member/unregister.do?cmd="+cmd;
		}
	}

</script>
</head>
<body>
<h3>${member.member_name}님의 정보</h3>
<!-- 
<p> 식별번호 : ${member.member_id}</p>
<p> 이메일 : ${member.member_email}</p>
<p> 비밀번호 : ${member.member_pw}</p>
<p> 이름 : ${member.member_name}</p>
<p> 핸드폰 : ${member.member_phone}</p>
<p> 회원유형 : ${member.member_type}</p>
<p> 등록일 : ${member.member_regdate}</p>
<p> 수정일 : ${member.member_moddate}</p>
 -->
 <table align="center" border="1">
	

	<tr>
		<td>이메일</td>
		<td>${member.member_email }</td>
	</tr>	
	<tr>
		<td>이름</td>
		<td>${member.member_name }</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${member.member_phone }</td>
	</tr>
	<tr>
		<td>회원유형</td>
		<td>${member.member_type }</td>
	</tr>	
	<tr>
		<td>등록일</td>
		<td>${member.member_regdate }</td>
	</tr>
	<tr>
		<td>수정일</td>
		<td>${member.member_moddate }</td>
	</tr>
</table>
<tr>
<!--  <input type="button" value="메인으로" class="btn" onclick="location.href='${contextPath}/member/listMembers.do'">-->
<input type="button" value="내정보수정" class="btn" onclick="location.href='${contextPath}/member/checkPw?id=${member.member_email}'">

<button id="unregister" type="button" onclick="unregister()">회원탈퇴</button>
</tr>
</body>
</html>