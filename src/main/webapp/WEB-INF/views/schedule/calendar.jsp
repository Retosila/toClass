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

<!-- 내부 스타일시트 -->
<style>
	.box {
		width:400px; 
		background-color:#E2E2E2; 
		border:2px #868e96 solid;  
		margin:20px auto;
		text-align:center;
	}
	
	.details_box {
		width:360px; 
		background-color:#F8F9FA; 
		border:2px #868e96 solid;  
		margin:20px auto;
		text-align:center;
	}
	
	#details {
		width:500px; 
		height:800px; 
		float:left; 
		background-color:#f9fafb;
	}
	
	#calendar {
		width:800px; 
		height:800px; 
		float:left;" 
	}
	
	#addEventModal{
    	display: none;
		width: 400px;
		height: 600px;
		position: absolute;
		top: 50%;
		left: 50%;
		margin: -250px 0 0 -250px;
		background-color: #f9fafb;
		z-index: 2;
		text-align:center;
	}
	
	#eventContent {
	    width: 80%;
	    height: 8em;
	    border: 1px black solid;
	    resize: none;
	}
	
	.modalBackground{
	    content: "";
	    width: 100%;
	    height: 100%;
	    background: #00000054;
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 1;
	    opacity: 0.5;
	}
	
	.modalClose{
	  position:absolute;
	  top:0px;
	  right: 15px;
	  cursor:pointer;
	  font-size:2em;
	}
	
	.fc-day-sun{
		color:red;
	}
	
	.fc-day-sat{
		color:blue;
	}
	
</style>

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
			// 버튼 출력 : today버튼의 텍스트를 '오늘의 일정'으로 설정
      		buttonText : {
      			today : '오늘의 일정'
      		},
      		// 일자 목록 표시(월화수목금)
      		dayHeaders : true,
      		height : 800,
      		// 일정 블록 수정 가능 여부 : 불가
      		editable : false,
      		// 일자 블록 선택 가능 여부 : 가능
      		selectable : true,
      		// 일자 블록 상의 날짜 클릭 가능 여부 : 가능
      		navLinks : false,
      		// 날짜 클릭 시 액션
      		// 일자 블록의 크기보다 많은 일정이 등록되는 경우 more로 표시
      		dayMaxEventRows : true,
      		// 일자 블록 클릭 시 클릭한 일자 블록의 날짜 정보를 받아옴
      		dateClick: function(info) {
      			// 모달창 띄우기 
    	        $("#addEventModal").show();
    	        // 모달창 뒷배경
    	        $("body").append('<div class="modalBackground"></div>');
      			$("#eventStartDate").val(info.dateStr);
      			$("#eventStartTime").val("09:00");
      			$("#eventEndDate").val(info.dateStr);
      			$("#eventEndTime").val("09:00");
      		},
      		// 일정 블록 클릭 시...
      		eventClick : function(info) {
      			//$(this).closest(".fc-day").data("date");
      			var id = info.event.id;
      			console.log(id);
      			var cmd = confirm("일정을 삭제하시겠습니까?");
      			if (cmd == true) {
    				$.ajax({
    					url :'${contextPath}/schedule/delSchedule.do', 
    					type: 'POST',
    					dataType: 'text',
    					data: {
    						"id" : id
    					},
    					success: function(msg) {
    						console.log(msg);					
    					},
    					error : function(error) {
    		            	console.log(JSON.stringify(error));
    		        	}			
    				});
      			}
      		},
      		lazyFetching : true,
      		// 일정 정보 할당
			events: function(info, successCallback, failureCallback) {
				$.ajax({
					url :'${contextPath}/schedule/getSchedule.do', 
					type: 'POST',
					dataType: 'json',
					data: {
						"member_email" : "${member.member_email}"
					},
					success: function(data) {
						successCallback(data)
						console.log("서버 응답 성공");
						console.log(data);					
					},
					error : function(error) {
		            	console.log(JSON.stringify(error));
		        	}			
				});
			},
			// 일정 시간 표시 : HH24:MI 포맷, am/pm 표시 안함 (default를 allDay로 해서 큰 의미는 없음)
			eventTimeFormat : {
				hour : '2-digit',
				minute : '2-digit',
				hour12 : false,
				meridiem : false
			},
			// 일정 블록을 블럭모양으로 출력
			eventDisplay : 'block',
			// 일정 블록에 시간 표시 안함
			displayEventTime : 'false'
			
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
		
		// 일정 추가 모달창 종료 로직
        $("body").on("click", function(event) {
        	// X버튼 및 뒷배경 클릭 시 모달 창 종료 
            if(event.target.className == 'modalClose' || event.target.className == 'modalBackground') {
                $("#addEventModal").hide(); 
                $(".modalBackground").hide();
            }
	   });
    	
  	});
	
</script>
<script>
    	
	// 일정 추가 버튼 클릭 시 실행
	function addEvent() {
		console.log("addEvent 메소드 실행");
		
		// 입력 데이터 변수에 할당
		var title = $("#eventTitle").val();
		var start = $("#eventStartDate").val() + " " + $("#eventStartTime").val();
		var end = $("#eventEndDate").val() + " " + $("#eventEndTime").val();
		var schedule_content = $("#eventContent").val();
		var schedule_writer = "${member.member_name}";
		var member_email = "${member.member_email}";
		var isForAll = $("#isForAll").val();
		
		// json 데이터
		var newSchedule = {
			"title" : title,
			"start" : start,
			"end" : end,
			"schedule_content" : schedule_content,
			"schedule_writer" : schedule_writer,
			"member_email" : member_email,
			"isForAll" : isForAll
		};
		
		$.ajax({
			url :'${contextPath}/schedule/addSchedule.do', 
			type: 'POST',
			// 서버단에서 RequestBody로 받기 위해서는 json데이터를 string타입으로 변환해줘야함
			data: newSchedule,
			// 서버 요청 데이터 타입
			//contentType : "application/json",
			// 서버 응답 데이터 타입
			dataType: 'text',
			success: function(msg) {
				console.log(msg);
			},
			error : function(error) {
	           	console.log(JSON.stringify(error));
	       	}			
		});
		
	}

</script>
</head>
<body>

<!-- 상세 일정 -->
<div id="details">
	<section class="box" style="height:100px;">
		<span id="details_yyyy_mm">2022-05</span><br>
		<span id="details_dd" >19일</span><br>
		<span id="details_day" >목요일</span><br>
	</section>
	<section class="box" style=" height:630px;">
		<article class="details_box" style="height:auto;">
			<span id="details_title">수학쪽지시험</span><br>
			<span id="details_time">11:00 - 12:00</span><br>
			<span id="details_write">레토</span><br>
			<span id="details_content">
			3교시에 시청각실에서 독서토론 대회있으니 필기구 챙겨서 늦지 않게 갈 것
			</span><br>
		</article>
	
	</section>

</div>

<!-- 학사 캘린더 -->
<div id="calendar"></div>

<!-- 일정 추가 모달창 -->
<div id="addEventModal">
    <div class="modalClose">X</div>
    <br><br><br>
    <input id="eventTitle" type="text" placeholder="일정 제목"/><br><br>
    시작시간 : <input id="eventStartDate" type="date"/><input id="eventStartTime" type="time"/><br><br>
    종료시간 : <input id="eventEndDate" type="date"/><input id="eventEndTime" type="time"/><br><br>
    일정 내용<br>
    <textarea id="eventContent" placeholder="일정 내용"/></textarea><br><br>
    <button id="addEventButton" type="button" onclick="addEvent()">일정 추가</button><br>
    <!-- 교사 회원일 경우 일괄 추가 기능을 지원 -->
    <c:if test="${member.member_type eq '교사'}">
	    일괄 추가<input id="isForAll" name="isForAll" value="true" type="checkbox" checked/>
    </c:if>
</div>

</body>
</html>