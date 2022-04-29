<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />

<!-- 외부 css -->
<link href="${contextPath}/fullcalendar/main.css" rel="stylesheet" />

<!-- 외부 js -->
<script src="${contextPath}/fullcalendar/jquery-3.6.0.js"></script>
<script src="${contextPath}/fullcalendar/main.js"></script>
<script src="${contextPath}/fullcalendar/locales-all.js"></script>

<!-- 메인 스크립트 -->
<script>

	$(document).ready(function() {
		

		
		
		// 캘린더 생성
	    var calendarEl = $("#calendar")[0];
    	var calendar = new FullCalendar.Calendar(calendarEl, {
			// 달력의 초기 디스플레이 옵션 : 일반적인 테이블 달력
      		initialView : 'dayGridMonth',
      		// 초기 로딩 날짜 : 현재 날짜
      		initialDate : new Date(),
      		// 언어 설정 : 영어(일 표시로 인해 한글 사용 X)
      		locale : 'en',
      		// 상단부 툴바 설정 : 이전해/이전월 타이틀/현재일자로 다음월/다음해
      		headerToolbar : {
      			left : 'prevYear prev today',
      			center : 'title',
      			right : 'next nextYear'
      		},
      		// 타이틀 포맷 : 월 정보만 짧게
			titleFormat : {
				month : 'numeric'
			},
			// 버튼 출력 : today버튼의 텍스트를 '오늘의 일정'으로 설정
      		buttonText : {
      			today : '오늘의 일정'
      		},
      		// 일자 목록 표시(월화수목금)
      		dayHeaders : true,
      		// 캘린더 세로 길이 : 650 고정
      		height : 650,
      		// 일정 블록 수정 가능 여부 : 불가
      		editable : false,
      		// 일자 블록 선택 가능 여부 : 가능
      		selectable : true,
      		// 일자 블록 상의 날짜 클릭 가능 여부 : 불가
      		navLinks : false,
      		// 일자 블록의 크기보다 많은 일정이 등록되는 경우 more로 표시
      		dayMaxEventRows : true,
      		// 클릭 시 클릭한 일자 블록의 날짜 정보를 받아옴
      		dateClick: function(info) {
      			alert('Clicked on: ' + info.dateStr);
      		},
      		// 일정 정보 : json 데이터 ajax 요청
			eventSources: [{
				events: function(info, successCallback, failureCallback) {
					$.ajax({
						url :'${contextPath}/schedule/getSchedule.do', 
						type: 'POST',
						dataType: 'json',
						data: {
							"member_email" : "${member.member_email}"
						},
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success: function(data) {
							successCallback(data);
							console.log(data);					
							console.log("스케쥴 로딩 완료 : ${member.member_email}");
						},
						error : function(error) {
			            	console.log(JSON.stringify(error));
			        	}			
					});
				}
			}]
      		
    	});
    	
		// 풀캘린더 렌더
    	calendar.render();
		// en-numeric타입 월 표시에 "월" 추가
		$(".fc-toolbar-title").append("월");
		// dayHeaders 영->한 변환
		$(".fc-col-header-cell-cushion[aria-label='Sunday']").text("일").css("color", "red");
		$(".fc-col-header-cell-cushion[aria-label='Monday']").text("월");
		$(".fc-col-header-cell-cushion[aria-label='Tuesday']").text("화");
		$(".fc-col-header-cell-cushion[aria-label='Wednesday']").text("수");
		$(".fc-col-header-cell-cushion[aria-label='Thursday']").text("목");
		$(".fc-col-header-cell-cushion[aria-label='Friday']").text("금");
		$(".fc-col-header-cell-cushion[aria-label='Saturday']").text("토").css("color", "blue");
		
  	});

</script>
</head>
<body>

<!-- 학사 캘린더 -->
<div id="calendar"></div>

</body>
</html>