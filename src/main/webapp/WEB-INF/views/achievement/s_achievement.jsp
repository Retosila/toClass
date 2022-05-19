<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.sql.*" %> <!-- jdbc를 활용하기 위해 선언 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

table {
	border: 1px solid black;
	width: 110%;
}

th, td {
	text-align: center;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
}

input {
	width: 100px;
	height: 30px;
}

select {
	width: 100px;
	height: 30px;
}
</style>


<body>
	<div class="container">
		<form action="achievement" align="left">
			<label for="studyYear">학년</label> <select id="studyYear">
				<option value="" selected>전체</option>
				<option value="3학년">3학년</option>
				<option value="2학년">2학년</option>
				<option value="1학년">1학년</option>
			</select> <label for="semester">수강학기</label> <select id="semester">
				<option value="" selected>전체</option>
				<option value="1학기">1학기</option>
				<option value="2학기">2학기</option>
			</select> <label for="SubjectName">과목명</label> <select id="SubjectName">
				<option value="" selected>전체</option>
				<option value="국어">국어</option>
				<option value="영어">영어</option>
				<option value="수학">수학</option>
				<option value="사회">사회</option>
				<option value="과학">과학</option>
			</select>
		</form>
		<br>
		<table class="table table-bordered">
			<colgroup>
				<col style="width: 2%; height: 10%;">
				<col style="width: 2%; height: 10%;">
				<col style="width: 2%; height: 10%;">
				<col style="width: 2%; height: 10%;">
				<col style="width: 2%; height: 10%;">
				<col style="width: 2%; height: 10%;">
				<col style="width: 2%; height: 10%;">
				<col style="width: 2%; height: 10%;">
				<col style="width: 2%; height: 10%;">
			</colgroup>

			<thead>
				<tr>
					<th>이름</th>
					<th>학년</th>
					<th>학기</th>
					<th>교과명</th>
					<th>중간고사</th>
					<th>기말고사</th>
					<th>평균</th>
					<th>석차</th>
					<th>등급</th>
				</tr>
			</thead>
			<tbody class='scoreInfo'>
			<tr>
				<td>레토</td>
				<td>1</td>
				<td>2</td>
				<td>과학</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
			</tr>
				<c:forEach var="achievement" items="${achievement}">
					<tr>
					<!-- 틀에 맞춰서 값이 나오게... -->
						<td>${member.member_name}</td>
						<td>${achievement.achievement_year}</td>
						<td>${achievement.achievement_semester}</td>
						<td>${achievement.subject_name}</td>
						<td>${achievement.achievement_mid}</td>
						<td>${achievement.achievement_final}</td>
						<td>${achievement.achievement_avg}</td>
						<td>${achievement.achievement_rank}</td>
						<td>${achievement.achievement_grade}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>



