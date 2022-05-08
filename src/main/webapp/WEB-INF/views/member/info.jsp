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
<style>
th {
	font-size: 13px;
	font-weight: 300;
	background: rgb(241, 242, 244);
	text-align: left;
}
td {
	font-size: 13px;
	background: #fff;
}
.btnSet_center {
    width: 100%;
    padding: 20px 0px;
    text-align: center;
}
button.wBtn03 {
    height: 36px;
    padding: 0px 20px 3px;
    border: none;
    background: url(http://toclass.smartschool.kr/LMS/images/btn_typeW3_1.png) 0px 0px no-repeat, 
    url(http://toclass.smartschool.kr/LMS/images/btn_typeW3_3.png) 100% 0px no-repeat, 
    url(http://toclass.smartschool.kr/LMS/images/btn_typeW3_2.png) repeat-x;
    color: rgb(135, 135, 137);
    font-size: 12px;
    letter-spacing: -0.5px;
    box-sizing: border-box;
}
button.bBtn06 {
    height: 36px;
    padding: 0px 20px 3px;
    border: none;
    background: url(http://toclass.smartschool.kr/LMS/images/btn_typeB6_1.png) 0px 0px no-repeat, 
    url(http://toclass.smartschool.kr/LMS/images/btn_typeB6_3.png) 100% 0px no-repeat, 
    url(http://toclass.smartschool.kr/LMS/images/btn_typeB6_2.png) repeat-x;
    color: rgb(255, 255, 255);
    font-size: 12px;
    text-shadow: rgb(0 0 0) 0px 0px 2px;
    letter-spacing: -0.5px;
    box-sizing: border-box;
}
</style>
</head>
<body>
<div class="container pt-lg-4">
			<h3>${member.member_name}님의 정보</h3>
			<hr>
			<table class="table table-bordered" id="infoMyClass" style="max-width: 830px;">
				<tr>
					<th>식별번호<font color="#CC0000">*</font></th>
					<td>${member.member_id}</td>
					<th>이메일</th>
					<td>${member.member_email}</td>
				</tr>
				<tr>
					<th>이름<font color="#CC0000">*</font></th>
					<td>${member.member_name}</td>
					<th>핸드폰</th>
					<td>${member.member_phone}</td>
				</tr>
				<tr>
					<th>회원 유형<font color="#CC0000">*</font></th>
					<td>${member.member_type}</td>
					<th>현 소속학급<font color="#CC0000">*</font></th>
					<td>${member.currentClass}</td>
				</tr>
				<tr>
					<th>등록일<font color="#CC0000">*</font></th>
					<td>${member.member_regdate}</td>
					<th>수정일</th>
					<td>${member.member_moddate}</td>
				</tr>
			</table>
			<div class="btnSet_center" style="max-width:830px;">
			<button id="unregister" type="button" class="wBtn03" onclick="unregister()">회원탈퇴</button>
			<button id="myclass" type="button" class="bBtn06" onclick="location.href='${contextPath}/member/myClass'">내 학급</button>
			</div>
		</div>
</body>
</html>