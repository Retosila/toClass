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
      		// 날짜(숫자) 클릭 가능 여부 : 불가
      		navLinks : false,
      		// 일자 블록의 크기보다 많은 일정이 등록되는 경우 more로 표시
      		dayMaxEventRows : true,
      		// 데이터동기화모드 : lazy
      		lazyFetching : true,
      		// 일정 블록 클릭 시
        	dateClick : function(info) {
      			// 기존 모달창에 있던 데이터 제거
      			$(".eventBlock").remove();
      			// 매개변수로부터 클릭한 일자블록의 날짜정보를 받아옴
      			var thisDate = info.date;
      			console.log(thisDate);
      			// 클릭한 일자의 일정 정보를 담을 배열 
      			var thisEventList = [];
      			// 이벤트 배열에서 해당 일자의 이벤트만 추출한 후, thisEventList 배열에 저장
      			for (var i = 0; i < myEvents.length; i++) {
          			var thisStart = to_date(myEvents[i].start.substr(0,10));
          			var thisEnd = to_date(myEvents[i].end.substr(0,10));
      				if (thisStart <= thisDate && thisEnd >= thisDate) {
      					thisEventList.push(myEvents[i]);
      					console.log("일정 추출 : " + myEvents[i].title);
      				}
      			}
      			console.log((thisDate.getMonth()+1) + "월 " + thisDate.getDate() + "일자 일정 추출 완료");
      			console.log(thisEventList);
      			
      			// 추출할 일정 eventBlock에 출력
      			for (var i = 0; i < thisEventList.length; i++) {
      				// start, end에서 HH24:MI 정보만 추출, HH24:MI - HH24:MI 형식으로 변환
      				var start = thisEventList[i].start.substr(11, 5);
      				var end = thisEventList[i].end.substr(11, 5);
      				var time = start + " - " + end;
      				console.log(time);
      				
      				// eventBlock 객체 생성. eb-i로 채번
          			var eventBlock = $("<article class='eventBlock eb-" + i + "' style='height:auto;'></article>");
          			var details_title = $("<span class='details_title'>" + thisEventList[i].title + "</span><br>");
          			var details_time = $("<span class='details_time'>" + time + "</span><br>");
          			var details_writer = $("<span class='details_writer'>" + thisEventList[i].schedule_writer + "</span><br>");
          			var details_content = $("<span class='details_content'>" + thisEventList[i].schedule_content + "</span><br>");
    				var deleteButton = $("<button class='eventBlockClose'>삭제</button>");
    				var deleteAll = $("<br>일괄삭제<input id='isForAllDelete' name='isForAllDelete' value='true' type='checkbox' checked/>");
    				// 일정 id 저장용
    				var eventId = $("<input class='eventId' value='" + thisEventList[i].id + "' style='display:none';/>");
    				
          			// 일정 세부 정보를 담은 eventBlock 추가
          			$("#eventBlockContainer").append(eventBlock);
          			$(".eb-"+i).append(details_title);
          			$(".eb-"+i).append(details_time);
          			$(".eb-"+i).append(details_writer);
          			// 일정 내용이 존재하는 경우에만 append
          			if (thisEventList[i].schedule_content != "") {
    	      			$(".eb-"+i).append(details_content);
        			}
          			$(".eb-"+i).append(deleteButton);
          			
          			// 교사 회원 & forAll이 true일 시 일괄삭제 옵션 추가
          			var forAll = thisEventList[i].forAll;
          			if (forAll == true && ${member.member_type eq '교사'}) {
    	      			$(".eb-"+i).append(deleteAll);
          			}
          			$(".eb-"+i).append(eventId);
      			}
      			
      			// 선택된 일자 블록에 따라 일정 추가창의 날짜값 할당
      			$("#eventStartDate").val(info.dateStr);
      			$("#eventStartTime").val("09:00");
      			$("#eventEndDate").val(info.dateStr);
      			$("#eventEndTime").val("09:00");
      			
      			// #eventModalDate의 날짜값 할당
      			$("#details_yyyy_mm").text(thisDate.getFullYear() + "년 " + (thisDate.getMonth()+1) + "월");
      			$("#details_dd").text(thisDate.getDate() + "일");
      			
      			// getDay값이 0~6으로 나오기에, switch문을 써서 한글날짜로 변환
      			var day = thisDate.getDay();
      			switch (day)  {
      			case 0 : $("#details_day").text("일요일"); break;
      			case 1 : $("#details_day").text("월요일"); break;
      			case 2 : $("#details_day").text("화요일"); break;
      			case 3 : $("#details_day").text("수요일"); break;
      			case 4 : $("#details_day").text("목요일"); break;
      			case 5 : $("#details_day").text("금요일"); break;
      			case 6 : $("#details_day").text("토요일"); break;
      			default : console.log("알 수 없는 요일입니다");
      			}
      			
      			// 모달창 띄우기 
    	        $("#eventModal").show();
    	        $("body").append('<div class="modalBackground"></div>');
        	},
        	// 일정 블록 클릭 시 : dateClick과 동일한 로직
        	eventClick : function(info) {
      			$(".eventBlock").remove();
      			var thisDate = info.event.start;
      			var thisEventList = [];
      			for (var i = 0; i < myEvents.length; i++) {
          			var thisStart = to_date(myEvents[i].start.substr(0,10));
          			var thisEnd = to_date(myEvents[i].end.substr(0,10));
      				if (thisStart <= thisDate && thisEnd >= thisDate) {
      					thisEventList.push(myEvents[i]);
      					console.log("일정 추출 : " + myEvents[i].title);
      				}
      			}
      			for (var i = 0; i < thisEventList.length; i++) {
      				var start = thisEventList[i].start.substr(11, 5);
      				var end = thisEventList[i].end.substr(11, 5);
      				var time = start + " - " + end;
          			var eventBlock = $("<article class='eventBlock eb-" + i + "' style='height:auto;'></article>");
          			var details_title = $("<span class='details_title'>" + thisEventList[i].title + "</span><br>");
          			var details_time = $("<span class='details_time'>" + time + "</span><br>");
          			var details_writer = $("<span class='details_writer'>" + thisEventList[i].schedule_writer + "</span><br>");
          			var details_content = $("<span class='details_content'>" + thisEventList[i].schedule_content + "</span><br>");
    				var deleteButton = $("<button class='eventBlockClose'>삭제</button>");
    				var deleteAll = $("<br>일괄삭제<input id='isForAllDelete' name='isForAllDelete' value='true' type='checkbox' checked/>");
          			$("#eventBlockContainer").append(eventBlock);
          			$(".eb-"+i).append(details_title);
          			$(".eb-"+i).append(details_time);
          			$(".eb-"+i).append(details_writer);
          			if (thisEventList[i].schedule_content != "") {
    	      			$(".eb-"+i).append(details_content);
        			}
          			$(".eb-"+i).append(deleteButton);
          			var forAll = thisEventList[i].forAll;
          			if (forAll == true && ${member.member_type eq '교사'}) {
    	      			$(".eb-"+i).append(deleteAll);
          			}
      			}
      			$("#eventStartDate").val(thisDate.toString());
      			$("#eventStartTime").val("09:00");
      			$("#eventEndDate").val(thisDate.toString());
      			$("#eventEndTime").val("09:00");
      			$("#details_yyyy_mm").text(thisDate.getFullYear() + "년 " + (thisDate.getMonth()+1) + "월");
      			$("#details_dd").text(thisDate.getDate() + "일");
      			var day = thisDate.getDay();
      			switch (day)  {
      			case 0 : $("#details_day").text("일요일"); break;
      			case 1 : $("#details_day").text("월요일"); break;
      			case 2 : $("#details_day").text("화요일"); break;
      			case 3 : $("#details_day").text("수요일"); break;
      			case 4 : $("#details_day").text("목요일"); break;
      			case 5 : $("#details_day").text("금요일"); break;
      			case 6 : $("#details_day").text("토요일"); break;
      			default : console.log("알 수 없는 요일입니다");
      			}
    	        $("#eventModal").show();
    	        $("body").append('<div class="modalBackground"></div>');
        	},
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
						console.log("event fetch 완료");
						console.log(data);
						myEvents = data;
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
		
        // X버튼 및 배경 클릭 시 모달 창 종료 
        $("body").on("click", function(event) {
        	if (event.target.id == "eventModalClose") {
        		$("#eventModal").hide();
                $(".modalBackground").remove();
        	}
        	else if (event.target.id == "addEventModalClose") {
        		$("#addEventModal").hide();
        	}
        	else if (event.target.className == "modalBackground") {
        		$("#eventModal").hide();
        		$("#addEventModal").hide();
                $(".modalBackground").remove();
        	}
	    });
		
		// 일정 모달창에서 "일정 추가창" 버튼 클릭 시 일정 추가 모달 창으로 전환
		$("#addEvent").on("click", function() {
	        $("#addEventModal").show();
		});
		
    	// "일정 추가하기" 버튼 클릭 시 실행
    	$("#addEventButton").on("click", function() {
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
    				// 캘린더 일정 정보 갱신
    				calendar.refetchEvents();
    				// 모달창 종료
                    $("#addEventModal").hide(); 
                    $("#eventModal").hide(); 
                    $(".modalBackground").hide();
    			},
    			error : function(error) {
    	           	console.log(JSON.stringify(error));
    	       	}			
    		});
    		
    	});
    	
    	// 일정 삭제 버튼은 동적으로 생성된 DOM이기에 아래와 같은 방식으로 써주지않으면 인식 못함
    	$(document).on("click", ".eventBlockClose", function() {
    		// 삭제버튼이 속한 eventBlock의 일정 id값을 추출
    		var id = $(this).parent().children(".eventId").val();
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
    	    			// 캘린더 일정 정보 갱신
    	    			calendar.refetchEvents();
    				},
    				error : function(error) {
    		           	console.log(JSON.stringify(error));
    		       	}			
    			});
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

<!-- 내부 스타일시트 -->
<style>
	#eventModalDate {
		width:360px; 
		background-color:#E2E2E2; 
		border:2px #868e96 solid;  
		margin:20px auto;
		text-align:center;
	}
	
	.eventBlock {
		width:360px; 
		background-color:#F8F9FA; 
		border:2px #868e96 solid;  
		margin:20px auto;
		text-align:center;
	}
	
	#calendar {
		width:800px; 
		height:800px; 
		margin:0 auto;
	}
	
	#eventModal {
    	display: none;
		width: 400px;
		min-height: 600px;
		height: auto;
		position: absolute;
		top: 50%;
		left: 50%;
		margin: -250px 0 0 -250px;
		background-color: #f9fafb;
		z-index: 2;
		text-align:center;
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
	
	#eventModalClose{
	  position:absolute;
	  top:0px;
	  right: 15px;
	  cursor:pointer;
	  font-size:2em;
	}
	
	#addEventModalClose{
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

</head>
<body>

<!-- 학사 캘린더 -->
<div id="calendar"></div>

<!-- 일정 모달창 -->
<div id="eventModal">
	<div id="eventModalClose">X</div>
	<!-- 선택된 일정 블록 날짜 정보 -->
	<section id="eventModalDate" style="height:80px; margin-top:50px;">
		<span id="details_yyyy_mm"></span><br>
		<span id="details_dd"></span><br>
		<span id="details_day"></span><br>
	</section>
	<!-- 일정블록 담는 창 -->
	<section id="eventBlockContainer">
		<!-- 일정 블록 -->
		
	</section>
	<section>
		<button id="addEvent">일정 추가창</button>
	</section>

</div>

<!-- 일정 추가 모달창 -->
<div id="addEventModal">
    <div id="addEventModalClose">X</div>
    <br><br><br>
    <input id="eventTitle" type="text" placeholder="일정 제목"/><br><br>
    시작시간 : <input id="eventStartDate" type="date"/><input id="eventStartTime" type="time"/><br><br>
    종료시간 : <input id="eventEndDate" type="date"/><input id="eventEndTime" type="time"/><br><br>
    일정 내용<br>
    <textarea id="eventContent" placeholder="일정 내용"/></textarea><br><br>
    <button id="addEventButton" type="button">일정 추가하기</button><br>
    <!-- 교사 회원일 경우 일괄 추가 기능을 지원 -->
    <c:if test="${member.member_type eq '교사'}">
	    일괄 추가<input id="isForAll" name="isForAll" value="true" type="checkbox" checked/>
    </c:if>
</div>

<!-- 
	        	$(".fc-daygrid-day").on("click", function() {
	      			// 기존 모달창에 있던 데이터 제거
	      			$(".eventBlock").remove();
	      			// 클릭한 일자 블록의 data-date 값 호출
	      			var thisDate = to_date($(this).data("date"));
	      			console.log(thisDate);
	      			// 클릭한 일자의 일정 정보를 담을 배열 
	      			var thisEventList = [];
	      			// 이벤트 배열에서 해당 일자의 이벤트만 추출한 후, thisEventList 배열에 저장
	      			for (var i = 0; i < myEvents.length; i++) {
	          			var thisStart = to_date(myEvents[i].start.substr(0,10));
	          			var thisEnd = to_date(myEvents[i].end.substr(0,10));
	      				if (thisStart <= thisDate && thisEnd >= thisDate) {
	      					thisEventList.push(myEvents[i]);
	      					console.log("일정 추출 : " + myEvents[i].title);
	      				}
	      			}
	      			console.log((thisDate.getMonth()+1) + "월 " + thisDate.getDate() + "일자 일정 추출 완료");
	      			console.log(thisEventList);
	      			
	      			// 추출할 일정 eventBlock에 출력
	      			for (var i = 0; i < thisEventList.length; i++) {
	      				// start, end에서 HH24:MI 정보만 추출, HH24:MI - HH24:MI 형식으로 변환
	      				var start = thisEventList[i].start.substr(11, 5);
	      				var end = thisEventList[i].end.substr(11, 5);
	      				var time = start + " - " + end;
	      				console.log(time);
	      				
	      				// 제이쿼리로 eventBlock 객체 생성. eb-i로 채번
	          			var eventBlock = $("<article class='eventBlock eb-" + i + "' style='height:auto;'></article>");
	          			var details_title = $("<span class='details_title'>" + thisEventList[i].title + "</span><br>");
	          			var details_time = $("<span class='details_time'>" + time + "</span><br>");
	          			var details_writer = $("<span class='details_writer'>" + thisEventList[i].schedule_writer + "</span>");
	          			var details_content = $("<br><span class='details_content'>" + thisEventList[i].schedule_content + "</span><br>");
	    				var deleteButton = $("<button class='eventBlockClose'>삭제</button>");
	    				var deleteAll = $("<br>일괄삭제<input id='isForAllDelete' name='isForAllDelete' value='true' type='checkbox' checked/>");
	    				
	          			// DOM 동적 추가
	          			$("#eventBlockContainer").append(eventBlock);
	          			$(".eb-"+i).append(details_title);
	          			$(".eb-"+i).append(details_time);
	          			$(".eb-"+i).append(details_writer);
	          			// 일정 내용이 존재하는 경우에만 append
	          			if ($(".details_content").text() != null || $(".details_content").text() != "") {
	    	      			$(".eb-"+i).append(details_content);
	        			}
	          			$(".eb-"+i).append(deleteButton);
	          			
	          			// 교사 회원 & forAll이 true일 시 일괄삭제 옵션 추가
	          			var forAll = thisEventList[i].forAll;
	          			if (forAll == true && ${member.member_type eq '교사'}) {
	    	      			$(".eb-"+i).append(deleteAll);
	          			}
	      			}
	      			
	      			// 선택된 일자 블록에 따라 일정 추가창의 날짜값 할당
	      			$("#eventStartDate").val(thisDate.toString());
	      			$("#eventStartTime").val("09:00");
	      			$("#eventEndDate").val(thisDate.toString());
	      			$("#eventEndTime").val("09:00");
	      			
	      			// #eventModalDate의 날짜값 할당
	      			$("#details_yyyy_mm").text(thisDate.getFullYear() + "년 " + (thisDate.getMonth()+1) + "월");
	      			$("#details_dd").text(thisDate.getDate() + "일");
	      			
	      			// getDay값이 0~6으로 나오기에, switch문을 써서 한글날짜로 변환
	      			var day = thisDate.getDay();
	      			switch (day)  {
	      			case 0 : $("#details_day").text("일요일"); break;
	      			case 1 : $("#details_day").text("월요일"); break;
	      			case 2 : $("#details_day").text("화요일"); break;
	      			case 3 : $("#details_day").text("수요일"); break;
	      			case 4 : $("#details_day").text("목요일"); break;
	      			case 5 : $("#details_day").text("금요일"); break;
	      			case 6 : $("#details_day").text("토요일"); break;
	      			default : console.log("알 수 없는 요일입니다");
	      			}
	      			
	      			// 모달창 띄우기 
	    	        $("#eventModal").show();
	    	        $("body").append('<div class="modalBackground"></div>');
	        		
	        	});

 -->


</body>
</html>