<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<!-- 외부 css -->
<link href="${contextPath}/fullcalendar/main.css" rel="stylesheet" />

<!-- 내부 스타일시트 -->
<style>
	#calendar {
		width:800px;
		height:800px;
		margin: 0 auto;
	}
	.fc-day-sun{
		color:red;
	}
	.fc-day-sat{
		color:blue;
	}
</style>

<!-- 외부 js -->
<script src="${contextPath}/fullcalendar/jquery-3.6.0.js"></script>
<script src="${contextPath}/fullcalendar/main.js"></script>
<script src="${contextPath}/fullcalendar/locales-all.js"></script>

<!-- 메인 스크립트 -->
<script>
	
	// DB에 요청한 이벤트 데이터 저장용
	var myEvents;
	
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
	  		// 캘린더의 가로세로 비율 설정
	  		aspectRatio : 1.2,
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
			// 버튼 출력 : today버튼의 텍스트를 '오늘'로 설정
	  		buttonText : {
	  			today : '오늘'
	  		},
	  		// 일자 목록 표시(월화수목금)
	  		dayHeaders : true,
	  		height : 800,
	  		// 일정 블록 수정 가능 여부 : 불가
	  		editable : false,
	  		// 일자 블록 선택 가능 여부 : 가능
	  		selectable : false,
	  		// 날짜(숫자) 클릭 가능 여부 : 불가
	  		navLinks : false,
	  		// 일자 블록의 크기보다 많은 일정이 등록되는 경우 more로 표시
	  		dayMaxEventRows : false,
	  		// 데이터동기화모드 : lazy
	  		lazyFetching : true,
	    	// 출결 정보 받아오기
			events: function(info, successCallback, failureCallback) {
				$.ajax({
					url :'${contextPath}/schedule/getAttendance.do',
					type: 'POST',
					dataType: 'json',
					data: {
						"member_email" : "${member.member_email}"
					},
					success: function(data) {
						successCallback(data);
						console.log("event fetch 완료");
						console.log(data);
						myEvents = data;
					},
					error : function(error) {
		            	console.log(JSON.stringify(error));
		        	}
				});
			},
			// 출결 확인 시간 표시 : HH24:MI 포맷 
			eventTimeFormat : {
				hour : '2-digit',
				minute : '2-digit',
				hour12 : false,
				meridiem : false
			},
			// 출결 블록을 블럭모양으로 출력
			eventDisplay : 'block'
		});
		
		// 풀캘린더 렌더
		calendar.render();
		
		// en-numeric타입 월 표시에 "월" 추가
		$(".fc-toolbar-title").append("월");
		$(".fc-toolbar-title").prepend("<span id='currentYear'></span>");
	
		// dayHeaders 영->한 변환
		$(".fc-col-header-cell-cushion[aria-label='Sunday']").text("일").css("color", "red");
		$(".fc-col-header-cell-cushion[aria-label='Monday']").text("월");
		$(".fc-col-header-cell-cushion[aria-label='Tuesday']").text("화");
		$(".fc-col-header-cell-cushion[aria-label='Wednesday']").text("수");
		$(".fc-col-header-cell-cushion[aria-label='Thursday']").text("목");
		$(".fc-col-header-cell-cushion[aria-label='Friday']").text("금");
		$(".fc-col-header-cell-cushion[aria-label='Saturday']").text("토").css("color", "blue");
	
		// 현재 년도를 벗어날 때 년도 정보 출력
		var todayDate = new Date();
		var todayYear = todayDate.getFullYear();
		$(".fc-prev-button, .fc-next-button, .fc-prevYear-button, .fc-nextYear-button, .fc-today-button").on("click", function() {
			var currentYear = calendar.view.currentStart.getFullYear();
			if (todayYear != currentYear) {
				$("#currentYear").show();
				$("#currentYear").text(currentYear + "년 ");
			}
			else if (todayYear == currentYear) {
				$("#currentYear").hide();
			}
		});
	});
			
		
	// 사용자 정의 함수
	
	// "YYYY-MM-DD" 형식의 문자열 데이터를 Date 데이터로 변환
	function to_date(dateStr) {
	    var yyyyMMdd = String(dateStr);
	    var sYear = yyyyMMdd.substring(0,4);
	    var sMonth = yyyyMMdd.substring(5,7);
	    var sDate = yyyyMMdd.substring(8,10);
	    return new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
	}

</script>

</head>

<body>

<!-- 출결 열람판 -->
<div id="calendar" class="pt-5 pb-5"></div>


</body>
</html>