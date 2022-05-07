<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<title>Argon Design System by Creative Tim</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- Nucleo Icons -->
<link href="${contextPath}/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<link href="${contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
<link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />

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

th, td {
	text-align: center;
}
</style>

<script>
	$(document).ready(function() {
		$(".dropdown-item").on("click", function() {
			var status = $(this).text();
			if (status == '출석') {
				$(this).parent().prev().css('background', '#5e72e4');
			} else if (status == '조퇴') {
				$(this).parent().prev().css('background', '#2dce89');
			} else if (status == '지각') {
				$(this).parent().prev().css('background', '#ffd600');
			} else if (status == '결석') {
				$(this).parent().prev().css('background', '#EC431F');
			} else {
			}

			$(this).parent().prev().text(status);
		});
		
	});
</script>
</head>
<body>
	<script src="${contextPath}/assets/js/core/jquery.min.js"
		type="text/javascript"></script>
	<script src="${contextPath}/assets/js/core/popper.min.js"
		type="text/javascript"></script>
	<script
		src="${contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script src="${contextPath}/assets/js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="${contextPath}/assets/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	<script src="${contextPath}/assets/js/plugins/moment.min.js"></script>
	<script src="${contextPath}/assets/js/plugins/datetimepicker.js"
		type="text/javascript"></script>

	<div class="container pt-lg-7">
		<table class="table table-bordered">
			<tr>
				<th align='center'>오늘의 출석현황</th>
				<th align='center'>미정</th>
				<th align='center'>출석</th>
				<th align='center'>조퇴</th>
				<th align='center'>지각</th>
				<th align='center'>결석</th>
				<th align='center'>합계</th>
			</tr>
			<tr>
				<th><c:set var="today" value="<%=new java.util.Date()%>" /> <!-- 현재날짜 -->
					<c:set var="date">
						<fmt:formatDate value="${today}" pattern="YYYY.MM.dd" />
					</c:set> <!-- 데이터 뿌릴때 --> <c:out value="${date}" /> <script>
						function getTodayLabel() {

							var week = new Array('(일)', '(월)', '(화)', '(수)',
									'(목)', '(금)', '(토)');

							var today = new Date().getDay();
							var todayLabel = week[today];

							return todayLabel;
						}

						document.write(getTodayLabel())
					</script></th>
				<td>${allStudentCnt} 명</td>
				<td>${allStudentCnt} 명</td>
				<td>${allStudentCnt} 명</td>
				<td>${allStudentCnt} 명</td>
				<td>${allStudentCnt} 명</td>
				<td>${allStudentCnt} 명</td>
			</tr>
		</table>

		<form>
			<table class="table table-bordered" id="list_table">

				<tr>
					<th>주간 출결 기록</th>
				<tr>
					<th>이름</th>
					<th>월 05.02</th>
					<th>화 05.03</th>
					<th>수 05.04</th>
					<th>목 05.05</th>
					<th>금 05.06</th>
				</tr>

				<c:forEach var="showAttendVO" items="${ShowAttendVOList}">
					<tr>
						<th>${showAttendVO.member_name}</th>
						<c:forEach var="attendVOStat"
								items="${showAttendVO.attend_status}">
							${attendVOStat}
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
			<br>
			<center>
				<button id="saveButton" type="button"
					class="btn btn-outline-primary btn-lg">저장하기</button>
			</center>
		</form>
		<hr>
		<script>
			$(document).ready(function() {
				$("#saveButton").on("click", function() {
					var text = $(".dropdown-item").text();
					var dropdownItem = $(this).closest('.dropdown-item');
			        var amount = dropdownItem.data('status');
			        var status = $('<p>From $' + amount + '</p>');           
			        dropdownItem.append(status);   
					$(".dropdownMenuButton").remove();
				});

			});
		</script>
		
		<!-- 
	ShowAttendVOList 구조 설명
 	- ShowAttendVOList는 여러 개의 ShowAttendVO 객체로 구성된 List<ShowAttendVO> 배열 객체이다.
 	- ShowAttendVO객체는 String member_name(학생명), List<String> attend_status(출결상태), List<String> attend_time(출결시간)로 구성되어있다.
 -->
	</div>
	
</body>
</html>
