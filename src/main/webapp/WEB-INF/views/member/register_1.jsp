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
<title>회원가입 페이지_1단계(/member/register_1.jsp)</title>
<style>

.btnSet_center {
	width: 100%;
	padding: 20px 0px;
	text-align: center;
}

.joinTab table {
	width: 100%;
	height: 60px;
	border: 1px solid #d9d9d9;
	background: #fff;
}

.joinTab table th span {
	font-weight: normal;
	font-size: 12px;
	display: block;
}

.joinTab table th:first-child.on {
	background: #0065FF;
	color: #fff;
}

.memberJoinRoll {
    padding: 30px;
    margin-top: 30px;
    margin-bottom: 50px;
    border: 1px solid #e4e5e8;
    position: relative;
    background-color: #fff;
    border-top: 2px solid #0065FF;
    border-bottom: 2px solid #dbdcdf;
}
</style>
</head>
<body>
	<div class="container container-lg pt-5 pb-5">
		<div class="joinTab">
			<table cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tbody>
					<tr>
						<th class="on"><span>01</span> 약관동의</th>
						<th><span>02</span> 정보입력</th>
						<th style="border-right: 0px;"><span>03</span> 가입완료</th>
					</tr>
				</tbody>
			</table>
			</div>
		<br>
		<div class="memberJoinRoll">
		<h4>회원타입 : ${member_type}</h4>

		<form method="post" action="${contextPath}/member/register_2">
			<!-- 만 14세 이상 여부 확인<input name="fourteen" type="checkbox" value="true"/> -->
			약관 동의 여부(필수) | <a href="${contextPath}/member/policy" target="_blank">보기</a>
			&nbsp; <input name="policy" type="checkbox" value="true" required />
			<br> 개인 정보 취급방침 동의 여부(필수) | <a
				href="${contextPath}/member/personal" target="_blank">보기</a> &nbsp;
			<input name="personal" type="checkbox" value="true" required /><br>
			<br> <input type="submit" class="btn btn-primary" /><br>
		</form>
	</div>
	</div>
</body>
</html>
