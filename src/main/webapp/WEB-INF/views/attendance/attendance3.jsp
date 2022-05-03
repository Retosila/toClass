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
	border-bottom: 1px solid black;
	border-right: 1px solid black;
}

table {
	border: 1px solid black;
	width: 110%;
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

		<table>
			<thead>
				<tr>
					<th>이름</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody class='scoreInfo' class="table table-bordered">
				<tr>
					<td align="left"><a href="javascript:;"
						onclick="javascript:window.open('/LMS/?goParam=member,1,V,student.asp,left_student.asp,,nowState:9|keytype:id|keyword:ewq123');"
						style="color: #333333; text-decoration: none">이순신 ((기타)고등학교)</a></td>
					<td><input type='text' class='input-data tableInEdit'
						id="name" value='' class='form-control'></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> <a class="dropdown-item">조퇴</a>
								<a class="dropdown-item">지각</a> <a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> <a class="dropdown-item">조퇴</a>
								<a class="dropdown-item">지각</a> <a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> <a class="dropdown-item">조퇴</a>
								<a class="dropdown-item">지각</a> <a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> <a class="dropdown-item">조퇴</a>
								<a class="dropdown-item">지각</a> <a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> <a class="dropdown-item">조퇴</a>
								<a class="dropdown-item">지각</a> <a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td>
						<button type="button" onclick="scoreAdd();"
							class="btn btn-outline-primary me-2">추가</button>
					</td>
				</tr>
			</tbody>
		</table>

		<script>
		var rowCnt = 0
		$(function() {
		    $(document).on("dblclick", ".editable", function() {
		        var value=$(this).text();
		        var input="<input type='text' class='input-data tableInEdit' value='"+value+"' class='form-control'>";
		        $(this).html(input);
		        $(this).removeClass("editable");
		    });
		})
		
		function scoreDel(tar){
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
		
		        var resultStr = "<tr id=row" + rowCnt + ">";
		        rowCnt++;
		        resultStr += "<td>";
		        resultStr += name;
		        resultStr += "</td>";
		
		        resultStr += "<td>";
		        resultStr += studyYearlist;
		        resultStr+= "</td>";
		
		        resultStr+= "<td>";
		        resultStr += semesterlist;
		        resultStr+= "</td>";
		
		        resultStr+= "<td>";
		        resultStr += subjectNamelist;
		        resultStr+= "</td>";
		
		        resultStr+= "<td>";
		        resultStr += midtest;
		        resultStr+= "</td>";
		
		        resultStr+= "<td>";
		        resultStr += lasttest;
		        resultStr+= "</td>";
		
		        resultStr+= "<td>";
		        resultStr += '<button type="button" onClick=scoreDel(this) class="btn btn-outline-primary me-2">삭제</button>';
		        resultStr+= "</td>";
		        resultStr+= "</tr>";
		        $(".scoreInfo").before(resultStr);
		        
		        $("#name").val('');
		        $("#studyYearlist").val('');
		        $("#semesterlist").val('');
		        $("#subjectNamelist").val('');
		        $("#midtest").val('');
		        $("#lasttest").val('');
		    }
		
		</script>

		<br>
		<button class="btn btn-outline-primary btn-lg" type="submit">성적입력</button>
		<button class="btn btn-outline-primary btn-lg" type="submit">성적조회</button>

		<form>
			<table class="table table-bordered" id="list_table">

				<tr>
					<td><input type='text' id="name" /></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> <a class="dropdown-item">조퇴</a>
								<a class="dropdown-item">지각</a> <a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> <a class="dropdown-item">조퇴</a>
								<a class="dropdown-item">지각</a> <a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> <a class="dropdown-item">조퇴</a>
								<a class="dropdown-item">지각</a> <a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> <a class="dropdown-item">조퇴</a>
								<a class="dropdown-item">지각</a> <a class="dropdown-item">결석</a>
							</div>
						</div></td>
					<td><div class="dropdown">
							<button class="btn btn-primary dropdownMenuButton" type="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								style="border-color: rgb(255 255 255/ 50%) !important;">출석
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item">출석</a> <a class="dropdown-item">조퇴</a>
								<a class="dropdown-item">지각</a> <a class="dropdown-item">결석</a>
							</div>
						</div></td>

					<td><a href="#" class="delete-link">삭제</a>
				</tr>

			</table>
			<button type="button" id="append_row"
				class="btn btn-outline-primary btn-lg" onclick=addRow()>추가</button>

			<input type="submit" value="저장하기"
				class="btn btn-outline-primary btn-lg">

		</form>
		<hr>
	</div>
	<script type="text/javascript">
	
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


</body>
</html>
