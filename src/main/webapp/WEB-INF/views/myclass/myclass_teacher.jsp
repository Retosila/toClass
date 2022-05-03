<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bbt.toclass.member.vo.MemberVO" %>
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

.table {
	border-collapse: collapse;
	border-top: 3px solid #168;
}

.table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

.table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

.table th:first-child, .table td:first-child {
	border-left: 0;
}

.table th:last-child, .table td:last-child {
	border-right: 0;
}

.table tr td:first-child {
	text-align: center;
}

.table caption {
	caption-side: bottom;
	display: none;
}

.btnSet_center {
	width: 100%;
	padding: 20px 0;
	text-align: center;
}
</style>
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

	<script>
		var studentCnt=0;
		var email;
		var name;
		$(function() {
			
			$.ajax({ 
				url :'${contextPath}/myclass/getStuCnt.do', 
				type : 'get', 
				dataType : 'json',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(data){
					email = String(data.email);
					name = String(data.name);
					studentCnt = data.stuCnt;
					console.log(data.email);
				}, 
				error : function(error) {
					alert("학급 정보 조회 중 오류가 발생하였습니다.");
	            },
	            complete: function(data) {
	            	if(studentCnt == 0) {
	            		$('#allTable').css('display','none');
	            	}
	            	$('#stuCnt').val(studentCnt);
	    			$('#teacherInfo').val(name + "/" + email);
	            }
			});
// 			console.log(email);
// 			console.log(name + "/" + email);
// 			$('#stuCnt').val(studentCnt);
// 			$('#teacherInfo').val(name + "/" + email);
		});
		
		//학급 생성 버튼 클릭 이벤트
		function saveMyClass(e){
			$('#infoMyClass').css('display','none');
			
			var classNm = $('#className').val();
			var classGrade = $('#classGrade').val();
			//만들어준거
			$.ajax({ 
				url :'${contextPath}/myclass/saveMyClass.do', 
				type : 'post', 
				dataType : 'json',
				contentType: "application/x-www-form-urlencoded; charset=euc-kr",
				data : {
					"class_name" : classNm,
					"class_year" : classGrade // code값 jsp 로 만들 시 콤마
// 					"class_code" : //위에서 만든 변수 콤마
				},  
				success: function(data){
					alert("학급이 생성되었습니다.\n학생을 추가해주세요.")
				}, 
				error : function(error) {
					alert("학급 생성 중 오류가 발생하였습니다.");
	            },
	            complete : function(data) {
	            	//하단 영역 보이도록 + 상단 영역, 버튼 안보이도록
	    			$('#allTable').css('display','block');
	            }
			});
		}
		console.log("${member.member_myclass}");
		console.log("${member.member_type}");
		
	</script>
	
	
	
	<div class="container pt-lg-4">
		<c:choose>
			<c:when test="${member.member_type == '교사' && member.member_myclass == 0}">
				<form name="f" method="post" action="class_exec.asp"
					target="hiddenIFrame">
				<input type="hidden" name="classNo" value="8225">
				<h2>학급기본정보</h2>
				<hr>
	
				<table cellpadding="0" cellspacing="0" width="100%"
					class="table table-bordered" id="infoMyClass" style="max-width: 830px;">
					<tr>
						<th>학급명 <font color="#CC0000">*</font></th>
						<td><input type="text" style="width: 100%;" id="className" name="className"
							value="투클래스" maxlength="30"></td>
						<th>대상학년 <font color="#CC0000">*</font></th>
						<td><select id="classGrade" name="classGrade" style="width: 100%;">
								<option value="">----학년선택----</option>
	
								<option value="m1">중등1</option>
	
								<option value="m2">중등2</option>
	
								<option value="m3">중등3</option>
	
								<option value="h1">고등1</option>
	
								<option value="h2">고등2</option>
	
								<option value="h3" selected="">고등3</option>
	
						</select></td>
					</tr>
					<tr>
						<th>담임선생님 <font color="#CC0000">*</font></th>
						<td>
<!-- 							<select name="teacherId" style="width: 100%;"> -->
<!-- 									<option value="">----담임선택----</option> -->
		
<!-- 									<option value="sdh3090" selected="">홍성동/sdh3090</option> -->
		
<!-- 							</select> -->
							<input type="text" style="width: 237px; text-align: left"
							name="nowCnt" id="teacherInfo" />
						</td>
						<th>학생수</th>
						<td><input type="text" style="width: 90px; text-align: right"
							name="nowCnt" id="stuCnt" value="4" maxlength="3" onkeyup="chkNumeric(this);"
							readonly="" class="readon"> 명</td>
					</tr>
					</tbody>
				</table>
				<div class="btnSet_center" style="max-width: 830px;">
	<!-- 				<button type="button" class="btn btn-outline-primary btn-lg" -->
	<!-- 					style="padding-left: 40px; padding-right: 40px;" -->
	<!-- 					onclick="fSubmit(document.f); return false; alert('학급이 생성됐습니다..'); $('#allTable').css('display','block');">학급생성</button> -->
						
					<button type="button" class="btn btn-outline-primary btn-lg"
						style="padding-left: 40px; padding-right: 40px;"
						onclick="saveMyClass(this);">학급생성</button>
				</div>
			</form>		
			</c:when>
			
			<c:when test="${member.member_type =='교사' && member.member_myclass >= 1}">

			
		<table cellpadding="0" id="allTable" cellspacing="0" width="100%" class="table table-bordered">
			<tbody>
				<tr>
					<td valign="top" width="40%" class="leftList">
						<form name="fSch" onsubmit="return false;">
							<h4 class="h4Title">
								검색 <select name="nowState">
									<option value="2">전체학생</option>
									<option value="1">전체대기생</option>
									<option value="0">전체퇴원생</option>
								</select> <select name="keytype">
									<option value="name">이름</option>
								</select> <input type="text" style="width: 85px;" name="keyword"
									maxlength="10">
								<button type="button" class="wBtn04"
									onclick="getStudentsNotInClass(document.fSch);return false;">검색</button>
							</h4>
						</form>
						<form name="fList">
							<table cellpadding="0" cellspacing="0" width="100%" class="whTable03">
								<colgroup>
									<col width="30">
									<col width="40">
									<col width="80">
									<col>
									<col width="100">
								</colgroup>
								<tbody>
									<tr>
										<th><input type="checkbox" id="studentAllChk"></th>
										<th>번호</th>
										<th>학생</th>
										<th>아이디</th>
										<th>전화번호</th>
									</tr>
								</tbody>
							</table>
							<div class="scrollArea mCustomScrollbar _mCS_1 mCS_no_scrollbar"
								style="height: 351px; border-right: 1px solid #ccc;">
								<div id="mCSB_1"
									class="mCustomScrollBox mCS-dark-thin mCSB_vertical mCSB_inside"
									tabindex="0">
									<div id="mCSB_1_container"
										class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
										style="position: relative; top: 0; left: 0;" dir="ltr">
										<table cellpadding="0" cellspacing="0" width="100%"
											class="whTable03">
											<colgroup>
												<col width="30">
												<col width="40">
												<col width="80">
												<col>
												<col width="99">
											</colgroup>
											<tbody id="notin_students">
												<tr id="notinTr_ewq123">
													<td align="center"><input type="hidden" name="name"
														value="김민주"> <input type="hidden" name="sex"
														value="girl"> <input type="hidden" name="pcs"
														value="01000000000"> <input type="hidden"
														name="state" value="2"> <input type="checkbox"
														name="studentId" id="studentId_1" value="ewq123"
														onclick="oneStudentCheck(this);"></td>
													<td align="center" class="notinCntNo">4</td>
													<td><div class="sex_girl" style="padding-left: 5px;">
															<a href="javascript:;"
																onclick="javascript:window.open('/LMS/?goParam=member,1,V,student.asp,left_student.asp,,keytype:id|keyword:ewq123');"
																style="color: #333333; text-decoration: none">${member.name}</a>
														</div></td>
													<td><span class="text overtextcut"
														style="width: 60px;">ewq123</span></td>
													<td><div style="padding-left: 5px;">01000000000</div></td>
												</tr>
												<tr id="notinTr_asd321">
													<td align="center"><input type="hidden" name="name"
														value="김세정"> <input type="hidden" name="sex"
														value="girl"> <input type="hidden" name="pcs"
														value=""> <input type="hidden" name="state"
														value="2"> <input type="checkbox" name="studentId"
														id="studentId_2" value="asd321"
														onclick="oneStudentCheck(this);"></td>
													<td align="center" class="notinCntNo">3</td>
													<td><div class="sex_girl" style="padding-left: 5px;">
															<a href="javascript:;"
																onclick="javascript:window.open('/LMS/?goParam=member,1,V,student.asp,left_student.asp,,keytype:id|keyword:asd321');"
																style="color: #333333; text-decoration: none">김세정</a>
														</div></td>
													<td><span class="text overtextcut"
														style="width: 60px;">asd321</span></td>
													<td><div style="padding-left: 5px;"></div></td>
												</tr>
												<tr id="notinTr_ewq1234">
													<td align="center"><input type="hidden" name="name"
														value="이순신"> <input type="hidden" name="sex"
														value="man"> <input type="hidden" name="pcs"
														value="01000000000"> <input type="hidden"
														name="state" value="2"> <input type="checkbox"
														name="studentId" id="studentId_3" value="ewq1234"
														onclick="oneStudentCheck(this);"></td>
													<td align="center" class="notinCntNo">2</td>
													<td><div class="sex_man" style="padding-left: 5px;">
															<a href="javascript:;"
																onclick="javascript:window.open('/LMS/?goParam=member,1,V,student.asp,left_student.asp,,keytype:id|keyword:ewq1234');"
																style="color: #333333; text-decoration: none">이순신</a>
														</div></td>
													<td><span class="text overtextcut"
														style="width: 60px;">ewq1234</span></td>
													<td><div style="padding-left: 5px;">01000000000</div></td>
												</tr>
												<tr id="notinTr_qwe321">
													<td align="center"><input type="hidden" name="name"
														value="홍길동"> <input type="hidden" name="sex"
														value="man"> <input type="hidden" name="pcs"
														value="01000000000"> <input type="hidden"
														name="state" value="2"> <input type="checkbox"
														name="studentId" id="studentId_4" value="qwe321"
														onclick="oneStudentCheck(this);"></td>
													<td align="center" class="notinCntNo">1</td>
													<td><div class="sex_man" style="padding-left: 5px;">
															<a href="javascript:;"
																onclick="javascript:window.open('/LMS/?goParam=member,1,V,student.asp,left_student.asp,,keytype:id|keyword:qwe321');"
																style="color: #333333; text-decoration: none">홍길동</a>
														</div></td>
													<td><span class="text overtextcut"
														style="width: 60px;">qwe321</span></td>
													<td><div style="padding-left: 5px;">01000000000</div></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div id="mCSB_1_scrollbar_vertical"
										class="mCSB_scrollTools mCSB_1_scrollbar mCS-dark-thin mCSB_scrollTools_vertical"
										style="display: none;">
										<a href="#" class="mCSB_buttonUp"
											oncontextmenu="return false;"></a>
										<div class="mCSB_draggerContainer">
											<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
												style="position: absolute; min-height: 30px; height: 0px; top: 0px;"
												oncontextmenu="return false;">
												<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
											</div>
											<div class="mCSB_draggerRail"></div>
										</div>
										<a href="#" class="mCSB_buttonDown"
											oncontextmenu="return false;"></a>
									</div>
								</div>
							</div>
							<div class="btnSet_center"
								style="clear: both; padding: 15px 0px 0px 0px; padding-bottom: 0; border-top: 1px solid #ccc;">
								<h4 class="h4Title">
									수강시작일 <input type="text" style="width: 80px;"
										class="datepicker hasDatepicker" name="startDate"
										value="2022-04-29" readonly="" id="dp1651215656624"><img
										class="ui-datepicker-trigger"
										src="/LMS/images/icon_calendar.png" alt="날짜 선택" title="날짜 선택">
									<button type="button" class="bBtn05"
										style="padding-left: 10px; padding-right: 10px;"
										onclick="fListSubmit(document.fList);">선택 등록</button>
								</h4>
							</div>
						</form>
					</td>
					<td valign="middle" align="center" width="10%">
						<button type="button" title="선택학생 등록"
							style="cursor: pointer; background: none; border: 0;"
							onclick="fListSubmit(document.fList);">
							<img src="/LMS/images/btn_arrowRightAdd.png">
						</button>
					</td>
					<td valign="top" width="50%" class="rightContents">
						<form name="fList2">
							<h4 class="h4Title">
								현재 <select>
									<option>소속중인</option>
								</select> 학생
								<!--<button type="button" class="wBtn04">검색</button>-->
							</h4>
							<table cellpadding="0" cellspacing="0" width="100%"
								class="whTable03">
								<colgroup>
									<col width="30">
									<col width="40">
									<col>
									<col width="90">
									<col width="85">
									<col width="80">
								</colgroup>
								<tbody>
									<tr>
										<th><input type="checkbox" id="studentAllChk2"></th>
										<th>번호</th>
										<th>이름</th>
										<th>아이디</th>
										<th>전화번호</th>
										<th>수강시작일</th>
									</tr>
								</tbody>
							</table>
							<div class="scrollArea mCustomScrollbar _mCS_2 mCS_no_scrollbar"
								style="height: 351px; border-left: 1px solid #ccc;">
								<div id="mCSB_2"
									class="mCustomScrollBox mCS-dark-thin mCSB_vertical mCSB_inside"
									tabindex="0">
									<div id="mCSB_2_container"
										class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
										style="position: relative; top: 0; left: 0;" dir="ltr">
										<table cellpadding="0" cellspacing="0" width="100%"
											class="whTable03">
											<colgroup>
												<col width="29">
												<col width="40">
												<col>
												<col width="90">
												<col width="85">
												<col width="80">
											</colgroup>
											<tbody id="in_students">

											</tbody>
										</table>
									</div>
									<div id="mCSB_2_scrollbar_vertical"
										class="mCSB_scrollTools mCSB_2_scrollbar mCS-dark-thin mCSB_scrollTools_vertical"
										style="display: none;">
										<a href="#" class="mCSB_buttonUp"
											oncontextmenu="return false;"></a>
										<div class="mCSB_draggerContainer">
											<div id="mCSB_2_dragger_vertical" class="mCSB_dragger"
												style="position: absolute; min-height: 30px; top: 0px;"
												oncontextmenu="return false;">
												<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
											</div>
											<div class="mCSB_draggerRail"></div>
										</div>
										<a href="#" class="mCSB_buttonDown"
											oncontextmenu="return false;"></a>
									</div>
								</div>
							</div>
							<div class="btnSet_center"
								style="clear: both; padding: 15px 0; padding-bottom: 0; border-top: 1px solid #ccc;">
								<h4 class="h4Title">
									수강종료일 <input type="text" style="width: 80px;"
										class="datepicker hasDatepicker" name="endDate"
										value="2022-04-29" readonly="" id="dp1651215656625"><img
										class="ui-datepicker-trigger"
										src="/LMS/images/icon_calendar.png" alt="날짜 선택" title="날짜 선택">
									<select name="endReason">
										<option value="">-종료이유 선택-</option>
										<option value="1" selected="">학업이수</option>
										<option value="2">선생님</option>
										<option value="3">수강료</option>
										<option value="4">성적</option>
										<option value="5">이사</option>
										<option value="6">교우관계</option>
										<option value="7">학급이동</option>
										<option value="8">휴강(쉼)</option>
										<option value="9">퇴원</option>
										<option value="10">기타</option>
									</select>
									<button type="button" class="bBtn05"
										style="padding-left: 10px; padding-right: 10px;"
										onclick="fList2Submit(document.fList2);">선택 수강종료</button>
								</h4>
								<!--<button type="button" class="wBtn03" style="padding-left:25px; padding-right:25px;">선택 수강삭제</button>-->
							</div>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
		</c:when>
		
			<c:when test="${member.member_type == '학생'}">
				<h2>학급기본정보</h2>
				<hr>
				<h1>해당 화면은 교사만 확인 및 수정이 가능합니다.</h1>
			</c:when>
			
		</c:choose>
		
		

	</div>
</body>
</html>

