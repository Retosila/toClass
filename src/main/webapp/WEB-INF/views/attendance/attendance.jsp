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
			if(status == '출석') {
				$(this).parent().prev().css('background', '#5e72e4');
			}
			else if (status == '조퇴') {
				$(this).parent().prev().css('background', '#2dce89');
			}
			else if (status == '지각') {
				$(this).parent().prev().css('background', '#ffd600');
			}
			else if (status == '결석') {
				$(this).parent().prev().css('background', '#EC431F');
			}
			else {}
			
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
				<th align='center'>출석율</th>
				<th align='center'>미정</th>
				<th align='center'>출석</th>
				<th align='center'>조퇴</th>
				<th align='center'>지각</th>
				<th align='center'>결석</th>
				<th align='center'>합계</th>
			</tr>
			<tr>
				<th><%-- <c:set var="today" value="<%=new java.util.Date()%>" /> <!-- 현재날짜 -->
					<c:set var="date">
						<fmt:formatDate value="${today}" pattern="MM.dd" />
					</c:set> <!-- 데이터 뿌릴때 --> <c:out value="${date}" /> <script>
						function getTodayLabel() {
							var week = new Array('(일)', '(월)', '(화)', '(수)',
									'(목)', '(금)', '(토)');
							var today = new Date().getDay();
							var todayLabel = week[today];
							return todayLabel;
						}
						document.write(getTodayLabel())
					</script> --%> ${t_day}</th>
				<td width="20%"><div class="progress-wrapper"
						style="padding-top: 0px;">
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
			<table class="table table-bordered" id="list_table">

				<tr>
					<th>주간 출결 기록</th>
					<th><div class="custom-control custom-checkbox mb-3">
							<input class="custom-control-input" id="customCheck1"
								type="checkbox" name='Attendance' value='selectall'
								onclick='selectAll(this)'> <label
								class="custom-control-label" for="customCheck1"> <span>일괄출석</span>
							</label>
						</div></th>
					<th><div class="custom-control custom-checkbox mb-3">
							<input class="custom-control-input" id="customCheck2"
								type="checkbox" name='Attendance2' value='selectall2'
								onclick='selectAll(this)'> <label
								class="custom-control-label" for="customCheck2"> <span>일괄출석</span>
							</label>
						</div></th>
					<th><div class="custom-control custom-checkbox mb-3">
							<input class="custom-control-input" id="customCheck3"
								type="checkbox" name='Attendance3' value='selectall3'
								onclick='selectAll(this)'> <label
								class="custom-control-label" for="customCheck3"> <span>일괄출석</span>
							</label>
						</div></th>
					<th><div class="custom-control custom-checkbox mb-3">
							<input class="custom-control-input" id="customCheck4"
								type="checkbox" name='Attendance4' value='selectall4'
								onclick='selectAll(this)'> <label
								class="custom-control-label" for="customCheck4"> <span>일괄출석</span>
							</label>
						</div></th>
					<th><div class="custom-control custom-checkbox mb-3">
							<input class="custom-control-input" id="customCheck5"
								type="checkbox" name='Attendance5' value='selectall5'
								onclick='selectAll(this)'> <label
								class="custom-control-label" for="customCheck5"> <span>일괄출석</span>
							</label>
						</div></th>
					<!-- <th><div class="custom-control custom-checkbox mb-3">
							<input class="custom-control-input" id="customCheck5"
								type="checkbox" name='Attendance5' value='selectall5'
								onclick='selectAll(this)'> <label
								class="custom-control-label" for="customCheck5"> <span>일괄출석</span>
							</label>
						</div></th> -->
				</tr>
				<tr>
					<th>이름</th>
					<th>월 <fmt:parseDate value="${week}" var="dateValue" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
					<th>화 <fmt:parseDate value="${week1}" var="dateValue" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
					<th>수 <fmt:parseDate value="${week2}" var="dateValue" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
					<th>목 <fmt:parseDate value="${week3}" var="dateValue" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
					<th>금 <fmt:parseDate value="${week4}" var="dateValue" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
					<!-- <th>행 삭제</th> -->
				</tr>
			<c:forEach var="showAttendVO" items="${ShowAttendVOList}">
	
				<tr >
					<td>${showAttendVO.member_name} </td>
					<c:forEach var="attendVOStat" items="${showAttendVO.attend_status}">
						
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> 
								<a class="dropdown-item">조퇴</a> 
								<a class="dropdown-item">지각</a> 
								<a class="dropdown-item">결석</a>
							</div>
						</div>${attendVOStat}</td>
						
					</c:forEach>
					
			
			
					 <td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> 
								<a class="dropdown-item">조퇴</a> 
								<a class="dropdown-item">지각</a> 
								<a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> 
								<a class="dropdown-item">조퇴</a> 
								<a class="dropdown-item">지각</a> 
								<a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> 
								<a class="dropdown-item">조퇴</a> 
								<a class="dropdown-item">지각</a> 
								<a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> 
								<a class="dropdown-item">조퇴</a> 
								<a class="dropdown-item">지각</a> 
								<a class="dropdown-item">결석</a>
							</div>
						</div></td> 
					
					<!-- <td><a href="#" class="delete-link">삭제</a> -->
				</tr>
				</c:forEach>
			</table>
			<button type="button" id="append_row"
				class="btn btn-outline-primary btn-lg" onclick=addRow()>추가</button>
				<script type="text/javascript">
		//버튼 클릭하면 추가
		function fn_addFile() {
        $("#d_file").append(
            "<br>" + "<input type='file' name='file"+cnt+"' />");
        cnt++;
    }
		
            function addRow() {
                var el=document.getElementById('attendanceBtn');
            }
		$("#append_row").on("click",function(){
    		$("#list_table").append(
        		$("<tr>").append(
            		$("<td>").append( $("#name").val() ),
           		 	$("<td>").append( $("#dropdownMenuButton").val() ),
            		$("<td>").append( $("#dropdownMenuButton2").val() ),
            		$("<td>").append( $("#dropdownMenuButton3").val() ),
            		$("<td>").append( $("#dropdownMenuButton4").val() ),
            		$("<td>").append( $("#dropdownMenuButton5").val() ),
            		//<td><a href="#" class="delete-link">삭제</a></td>
           		 	$("<td>").append( $("<a>").prop("href","#").addClass("delete-link").append("삭제")
            				)
        				)
    				);
				});
			//삭제
			$("#list_table").on("click",".delete-link", function(){
    		//a태그의 부모의 부모태그 (a-td-tr)
    		$(this).parent().parent().remove();
		});
	</script>
			<input type="submit" value="저장하기"
				class="btn btn-outline-primary btn-lg"/>

		</form>
		<hr>
	</div>

	
	
</body>
</html>