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
</head>
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

	<div class="container pt-lg-5 pb-lg-5" align="center">
		<table class="table table-bordered">
			<tr>
				<th align='center'>오늘의 출석현황</th>
				<th align='center'>출석율</th>
				<th align='center'>미정</th>
				<th align='center'>출석</th>
				<th align='center'>조퇴</th>
				<th align='center'>지각</th>
				<th align='center'>결석</th>
				<th align='center'>합계</th>
			</tr>
			<tr>
				<td>4월 19일 (화)</td>
				<td width="20%"><div class="progress-wrapper" style="padding-top: 0px;">
						<div class="progress-info">

							<div class="progress-percentage">
								<span>80%</span>
							</div>
						</div>
						<div class="progress">
							<div class="progress-bar bg-toss" role="progressbar"
								aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
								style="width: 80%;"></div>
						</div>
					</div></td>
				<td>0명</td>
				<td>28명</td>
				<td>2명</td>
				<td>0명</td>
				<td>0명</td>
				<td>30명</td>
			</tr>
		</table>

		<form>
			<table class="table table-bordered">

				<tr>
					<th>주간 출결 기록</th>



					<th><div class="custom-control custom-checkbox mb-3">
						<input class="custom-control-input" id="customCheck1"
							type="checkbox" name='Attendance' value='selectall'
						onclick='selectAll(this)'> <label class="custom-control-label"
							for="customCheck1"> <span>일괄출석</span>
						</label>
					</div> </th>
					<th><div class="custom-control custom-checkbox mb-3">
						<input class="custom-control-input" id="customCheck2"
							type="checkbox" name='Attendance2' value='selectall2'
						onclick='selectAll(this)'> <label class="custom-control-label"
							for="customCheck2"> <span>일괄출석</span>
						</label>
					</div> </th>
					<th><div class="custom-control custom-checkbox mb-3">
						<input class="custom-control-input" id="customCheck3"
							type="checkbox" name='Attendance3' value='selectall3'
						onclick='selectAll(this)'> <label class="custom-control-label"
							for="customCheck3"> <span>일괄출석</span>
						</label>
					</div> </th>
					<th><div class="custom-control custom-checkbox mb-3">
						<input class="custom-control-input" id="customCheck4"
							type="checkbox" name='Attendance4' value='selectall4'
						onclick='selectAll(this)'> <label class="custom-control-label"
							for="customCheck4"> <span>일괄출석</span>
						</label>
					</div> </th>
					<th><div class="custom-control custom-checkbox mb-3">
						<input class="custom-control-input" id="customCheck5"
							type="checkbox" name='Attendance5' value='selectall5'
						onclick='selectAll(this)'> <label class="custom-control-label"
							for="customCheck5"> <span>일괄출석</span>
						</label>
					</div> </th>
				</tr>
				<tr>
					<th>이름</th>
					<th>월 04.11</th>
					<th>화 04.12</th>
					<th>수 04.13</th>
					<th>목 04.14</th>
					<th>금 04.15</th>
				</tr>
				<tr>

					<td><input type='text' id="name" /></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="m" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="t1" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="w" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="t2" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="f" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
				<tr>
					<td><input type='text' id="name" /></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="m" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="t1" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="w" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="t2" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="f" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
				<tr>
					<td><input type='text' id="name" /></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="m" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="t1" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="w" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="t2" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="f" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
				<tr>
					<td><input type='text' id="name" /></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="m" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="t1" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="w" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="t2" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="f" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
				<tr>
					<td><input type='text' id="name" /></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="m" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="t1" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="w" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="t2" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
					<td><input type='checkbox' name='Attendance'
						value='Attendance' id="f" /><select>
							<option value selected="출석">출석</option>
							<option value="결석">결석</option>
							<option value="지각">지각</option>
							<option value="조퇴">조퇴</option>
					</select></td>
				</tr>
			</table>
			<button type="button" onclick="scoreAdd();"
				class="btn btn-outline-primary btn-lg">추가</button>
			<input type="submit" value="저장하기"
				class="btn btn-outline-primary btn-lg">
		</form>
		<hr>
	</div>

<!-- 
	ShowAttendVOList 구조 설명
 	- ShowAttendVOList는 여러 개의 ShowAttendVO 객체로 구성된 List<ShowAttendVO> 배열 객체이다.
 	- ShowAttendVO객체는 String member_name(학생명), List<String> attend_status(출결상태), List<String> attend_time(출결시간)로 구성되어있다.
 -->
<table border="1">
	<!-- ShowAttendVOList 안에 들어있는 ShowAttendVO 객체를 하나씩 대입 -->
	<c:forEach var="showAttendVO" items="${ShowAttendVOList}">
		<tr>
			<th rowspan="2">${showAttendVO.member_name}</th>
			<!-- 중첩 for문. ShowAttendVO 객체의 프로퍼티중 member_name은 String이지만, attend_status와 attend_time은 배열 객체기에 for문으로 탐색 가능. -->
			<c:forEach var="attendVOStat" items="${showAttendVO.attend_status}">
				<td>${attendVOStat}</td>	
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="attendVOTime" items="${showAttendVO.attend_time}">
				<td>${attendVOTime}</td>	
			</c:forEach>
		</tr>
	</c:forEach>