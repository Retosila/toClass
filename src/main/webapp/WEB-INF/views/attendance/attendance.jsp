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

table {
	border: 1px solid black;
}

th, td {
	text-align: center;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 200px;
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

	<div class="container">
		<table class="table table-bordered">
			<tr>
				<th colspan="2">오늘의 출석현황</th>
				<th>미정</th>
				<th>출석</th>
				<th>조퇴</th>
				<th>지각</th>
				<th>결석</th>
				<th>합계</th>
			</tr>
			<tr>
				<th>4월 19일 (화)
				<th><input type="range" class="form-range" min="0" max="5"
					step="0.5" id="customRange3"></th>
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
					<th><input type='checkbox' name='Attendance' value='selectall'
						onclick='selectAll(this)' /> 일괄출석처리</th>
					<th><input type='checkbox' name='Attendance2'
						value='selectall2' onclick='selectAll(this)' /> 일괄출석처리</th>
					<th><input type='checkbox' name='Attendance3'
						value='selectall3' onclick='selectAll(this)' /> 일괄출석처리</th>
					<th><input type='checkbox' name='Attendance4'
						value='selectall4' onclick='selectAll(this)' /> 일괄출석처리</th>
					<th><input type='checkbox' name='Attendance5'
						value='selectall5' onclick='selectAll(this)' /> 일괄출석처리</th>
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
				class="btn btn-outline-secondary btn-lg">추가</button>
			<input type="submit" value="저장하기"
				class="btn btn-outline-secondary btn-lg">
		</form>
		<hr>
	</div>


</body>
</html>
</body>
</html>