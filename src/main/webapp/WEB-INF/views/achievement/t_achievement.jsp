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
			<label for="studyName">이름</label> <input type="text" id="studyName">
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
		<table>
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
					<th>전체평균</th>
					<th>수정 사유</th>
					<th>추가 / 삭제</th>
				</tr>
			</thead>
			<tbody class='scoreInfo'>
				<tr>
					<td><input type='text' class='input-data tableInEdit'
						id="name" value='' class='form-control'></td>
					<td><select id="studyYearlist">
							<option value="" selected>학년</option>
							<option value="3학년">3학년</option>
							<option value="2학년">2학년</option>
							<option value="1학년">1학년</option>
					</select></td>
					<td><select id="semesterlist">
							<option value="" selected>학기</option>
							<option value="1학기">1학기</option>
							<option value="2학기">2학기</option>
					</select></td>
					<td><select id="subjectNamelist">
							<option value="" selected>과목명</option>
							<option value="국어">국어</option>
							<option value="영어">영어</option>
							<option value="수학">수학</option>
							<option value="사회">사회</option>
							<option value="과학">과학</option>
					</select></td>
					<td><input type='text' class='input-data tableInEdit'
						id="midtest" value='' class='form-control'></td>
					<td><input type='text' class='input-data tableInEdit'
						id="lasttest" value='' class='form-control'></td>
					<td><input type='text' class='input-data tableInEdit' id="avg"
						value='' class='form-control'></td>
					<td><input type='text' class='input-data tableInEdit'
						id="rank" value='' class='form-control'></td>
					<td><input type='text' class='input-data tableInEdit'
						id="score" value='' class='form-control'></td>
					<td><input type='text' class='input-data tableInEdit'
						id="total" value='' class='form-control'></td>
					<td><input type='text' class='input-data tableInEdit' id="re"
						value='' class='form-control'></td>
					<td>
						<button type="button" onclick="scoreAdd();"
							class="btn btn-outline-primary me-2">추가</button>
					</td>
				</tr>
								<c:forEach var="achievement" items="${achievement}">
					<tr>
					<!-- 틀에 맞춰서 값이 나오게... -->
						<td>${achievement.member_name}</td>
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
		<br>
		<button class="btn btn-outline-primary btn-lg" type="submit">성적
			입력</button>
		<button class="btn btn-outline-primary btn-lg" type="submit">성적
			조회</button>

	</div>

	<!-- /.container -->
	<hr class="featurette-divider">
	<!--             <script src="http://code.jquery.com/jquery.js"></script> -->
	<script>
		var rowCnt = 0
		$(function() {
			$(document)
					.on(
							"dblclick",
							".editable",
							function() {
								var value = $(this).text();
								var input = "<input type='text' class='input-data tableInEdit' value='"+value+"' class='form-control'>";
								$(this).html(input);
								$(this).removeClass("editable");
							});
		})

		function scoreDel(tar) {
			var targetId = $($(tar).parent()).parent()[0].id;
			$("#" + targetId).remove();
		}

		function scoreAdd() {
			var name = $("#name").val();
			var studyYearlist = $("#studyYearlist").val();
			var semesterlist = $("#semesterlist").val();
			var subjectNamelist = $("#subjectNamelist").val();
			var midtest = $("#midtest").val();
			var lasttest = $("#lasttest").val();
			var avg = $("#avg").val();
			var rank = $("#rank").val();
			var score = $("#score").val();
			var total = $("#total").val();
			var re = $("#re").val();

			var resultStr = "<tr id=row" + rowCnt + ">";
			rowCnt++;
			resultStr += "<td>";
			resultStr += name;
			resultStr += "</td>";

			resultStr += "<td>";
			resultStr += studyYearlist;
			resultStr += "</td>";

			resultStr += "<td>";
			resultStr += semesterlist;
			resultStr += "</td>";

			resultStr += "<td>";
			resultStr += subjectNamelist;
			resultStr += "</td>";

			resultStr += "<td>";
			resultStr += midtest;
			resultStr += "</td>";

			resultStr += "<td>";
			resultStr += lasttest;
			resultStr += "</td>";

			resultStr += "<td>";
			resultStr += avg;
			resultStr += "</td>";

			resultStr += "<td>";
			resultStr += rank;
			resultStr += "</td>";

			resultStr += "<td>";
			resultStr += score;
			resultStr += "</td>";

			resultStr += "<td>";
			resultStr += total;
			resultStr += "</td>";

			resultStr += "<td>";
			resultStr += re;
			resultStr += "</td>";

			resultStr += "<td>";
			resultStr += '<button type="button" onClick=scoreDel(this) class="btn btn-outline-primary me-2">삭제</button>';
			resultStr += "</td>";
			resultStr += "</tr>";
			$(".scoreInfo").before(resultStr);

			$("#name").val('');
			$("#studyYearlist").val('');
			$("#semesterlist").val('');
			$("#subjectNamelist").val('');
			$("#midtest").val('');
			$("#lasttest").val('');
			$("#avg").val('');
			$("#rank").val('');
			$("#score").val('');
			$("#total").val('');
			$("#re").val('');
		}
	</script>



</body>
</html>



