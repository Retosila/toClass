<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <!-- 외부 css -->
    <link href="${contextPath}/fullcalendar/main.css" rel="stylesheet"/>

    <!-- 외부 js -->
    <script src="${contextPath}/fullcalendar/jquery-3.6.0.js"></script>
    <script src="${contextPath}/fullcalendar/main.js"></script>
    <script src="${contextPath}/fullcalendar/locales-all.js"></script>
    <script>

        // DB에 요청한 이벤트 데이터 저장용
        var myEvents;

        $(document).ready(function () {
            // 캘린더 생성
            var calendarEl = $("#calendar")[0];
            var calendar = new FullCalendar.Calendar(calendarEl, {
                // 달력의 초기 디스플레이 옵션 : 일반적인 테이블 달력
                initialView: 'dayGridMonth',
                // 초기 로딩 날짜 : 현재 날짜
                initialDate: new Date(),
                // 언어 설정 : 영어(일 표시로 인해 한글 사용 X)
                locale: 'en',
                // 캘린더의 가로세로 비율 설정
                aspectRatio: 1.2,
                // 상단부 툴바 설정 : 이전해/이전월 타이틀/현재일자로 다음월/다음해
                headerToolbar: {
                    left: 'prevYear prev',
                    center: 'title',
                    right: 'next nextYear'
                },
                // 타이틀 포맷 : 월 정보만 짧게
                titleFormat: {
                    month: 'numeric'
                },
                // 버튼 출력 : today버튼의 텍스트를 '오늘의 일정'으로 설정
                buttonText: {
                    today: '오늘의 일정'
                },
                // 일자 목록 표시(월화수목금)
                dayHeaders: true,

                // 일정 블록 수정 가능 여부 : 불가
                editable: false,
                // 일자 블록 선택 가능 여부 : 가능
                selectable: true,
                // 날짜(숫자) 클릭 가능 여부 : 불가
                navLinks: false,
                // 일자 블록의 크기보다 많은 일정이 등록되는 경우 more로 표시
                dayMaxEventRows: true,
                // 데이터동기화모드 : lazy
                lazyFetching: true,
                // 일정 블록 클릭 시
                dateClick: function (info) {
                    // 기존 모달창에 있던 데이터 제거
                    $(".eventBlock").remove();
                    // 매개변수로부터 클릭한 일자블록의 날짜정보를 받아옴
                    var thisDate = info.date;
                    console.log(thisDate);
                    // 클릭한 일자의 일정 정보를 담을 배열
                    var thisEventList = [];
                    // 이벤트 배열에서 해당 일자의 이벤트만 추출한 후, thisEventList 배열에 저장
                    for (var i = 0; i < myEvents.length; i++) {
                        var thisStart = to_date(myEvents[i].start.substr(0, 10));
                        var thisEnd = to_date(myEvents[i].end.substr(0, 10));
                        if (thisStart <= thisDate && thisEnd >= thisDate) {
                            thisEventList.push(myEvents[i]);
                            console.log("일정 추출 : " + myEvents[i].title);
                        }
                    }
                    console.log((thisDate.getMonth() + 1) + "월 " + thisDate.getDate() + "일자 일정 추출 완료");
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
                        var deleteAll = $("<br>일괄삭제<input class='isForAllDelete' name='isForAllDelete' value='true' type='checkbox' checked/>");
                        // 일정 id 저장용
                        var eventId = $("<input class='eventId' value='" + thisEventList[i].id + "' style='display:none';/>");

                        // 일정 세부 정보를 담은 eventBlock 추가
                        $("#eventBlockContainer").append(eventBlock);
                        $(".eb-" + i).append(details_title);
                        $(".eb-" + i).append(details_time);
                        $(".eb-" + i).append(details_writer);
                        // 일정 내용이 존재하는 경우에만 append
                        if (thisEventList[i].schedule_content != "") {
                            $(".eb-" + i).append(details_content);
                        }
                        $(".eb-" + i).append(deleteButton);

                        // 교사 회원 & forAll이 true일 시 일괄삭제 옵션 추가
                        var forAll = thisEventList[i].forAll;
                        if (forAll == true && ${member.member_type eq '교사'}) {
                            $(".eb-" + i).append(deleteAll);
                        }
                        $(".eb-" + i).append(eventId);
                    }

                    // 선택된 일자 블록에 따라 일정 추가창의 날짜값 할당
                    $("#eventStartDate").val(info.dateStr);
                    $("#eventStartTime").val("09:00");
                    $("#eventEndDate").val(info.dateStr);
                    $("#eventEndTime").val("09:00");

                    // #eventModalDate의 날짜값 할당
                    $("#details_yyyy_mm").text(thisDate.getFullYear() + "년 " + (thisDate.getMonth() + 1) + "월");
                    $("#details_dd").text(thisDate.getDate() + "일");

                    // getDay값이 0~6으로 나오기에, switch문을 써서 한글날짜로 변환
                    var day = thisDate.getDay();
                    switch (day) {
                        case 0 :
                            $("#details_day").text("일요일");
                            break;
                        case 1 :
                            $("#details_day").text("월요일");
                            break;
                        case 2 :
                            $("#details_day").text("화요일");
                            break;
                        case 3 :
                            $("#details_day").text("수요일");
                            break;
                        case 4 :
                            $("#details_day").text("목요일");
                            break;
                        case 5 :
                            $("#details_day").text("금요일");
                            break;
                        case 6 :
                            $("#details_day").text("토요일");
                            break;
                        default :
                            console.log("알 수 없는 요일입니다");
                    }

                    // 모달창 띄우기
                    $("#eventModal").show();
                    $("body").append('<div class="modalBackground"></div>');
                },
                // 일정 블록 클릭 시 : dateClick과 동일한 로직
                eventClick: function (info) {
                    // 기존 모달창에 있던 데이터 제거
                    $(".eventBlock").remove();
                    // 매개변수로부터 클릭한 일자블록의 날짜정보를 받아옴
                    var temp = info.event.start;
                    console.log(temp);
                    var temp2 = temp.getFullYear() + "-" + ('00' + (temp.getMonth() + 1)).slice(-2) + "-" + ('00' + temp.getDate()).slice(-2);
                    console.log(temp2);
                    var thisDate = to_date(temp2);
                    // 클릭한 일자의 일정 정보를 담을 배열
                    var thisEventList = [];
                    // 이벤트 배열에서 해당 일자의 이벤트만 추출한 후, thisEventList 배열에 저장
                    for (var i = 0; i < myEvents.length; i++) {
                        var thisStart = to_date(myEvents[i].start.substr(0, 10));
                        var thisEnd = to_date(myEvents[i].end.substr(0, 10));
                        if (thisStart <= thisDate && thisEnd >= thisDate) {
                            thisEventList.push(myEvents[i]);
                            console.log("일정 추출 : " + myEvents[i].title);
                        }
                    }
                    console.log((thisDate.getMonth() + 1) + "월 " + thisDate.getDate() + "일자 일정 추출 완료");
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
                        var deleteAll = $("<br>일괄삭제<input class='isForAllDelete' name='isForAllDelete' value='true' type='checkbox' checked/>");
                        // 일정 id 저장용
                        var eventId = $("<input class='eventId' value='" + thisEventList[i].id + "' style='display:none';/>");

                        // 일정 세부 정보를 담은 eventBlock 추가
                        $("#eventBlockContainer").append(eventBlock);
                        $(".eb-" + i).append(details_title);
                        $(".eb-" + i).append(details_time);
                        $(".eb-" + i).append(details_writer);
                        // 일정 내용이 존재하는 경우에만 append
                        if (thisEventList[i].schedule_content != "") {
                            $(".eb-" + i).append(details_content);
                        }
                        $(".eb-" + i).append(deleteButton);

                        // 교사 회원 & forAll이 true일 시 일괄삭제 옵션 추가
                        var forAll = thisEventList[i].forAll;
                        if (forAll == true && ${member.member_type eq '교사'}) {
                            $(".eb-" + i).append(deleteAll);
                        }
                        $(".eb-" + i).append(eventId);
                    }

                    // 선택된 일자 블록에 따라 일정 추가창의 날짜값 할당
                    $("#eventStartDate").val(info.dateStr);
                    $("#eventStartTime").val("09:00");
                    $("#eventEndDate").val(info.dateStr);
                    $("#eventEndTime").val("09:00");

                    // #eventModalDate의 날짜값 할당
                    $("#details_yyyy_mm").text(thisDate.getFullYear() + "년 " + (thisDate.getMonth() + 1) + "월");
                    $("#details_dd").text(thisDate.getDate() + "일");

                    // getDay값이 0~6으로 나오기에, switch문을 써서 한글날짜로 변환
                    var day = thisDate.getDay();
                    switch (day) {
                        case 0 :
                            $("#details_day").text("일요일");
                            break;
                        case 1 :
                            $("#details_day").text("월요일");
                            break;
                        case 2 :
                            $("#details_day").text("화요일");
                            break;
                        case 3 :
                            $("#details_day").text("수요일");
                            break;
                        case 4 :
                            $("#details_day").text("목요일");
                            break;
                        case 5 :
                            $("#details_day").text("금요일");
                            break;
                        case 6 :
                            $("#details_day").text("토요일");
                            break;
                        default :
                            console.log("알 수 없는 요일입니다");
                    }

                    // 모달창 띄우기
                    $("#eventModal").show();
                    $("body").append('<div class="modalBackground"></div>');
                },
                // 일정 정보 할당
                events: function (info, successCallback, failureCallback) {
                    $.ajax({
                        url: '${contextPath}/schedule/getSchedule.do',
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            "member_email": "${member.member_email}"
                        },
                        success: function (data) {

                            successCallback(data);
                            console.log("event fetch 완료");
                            console.log(data);
                            myEvents = data;
                        },
                        error: function (error) {
                            console.log(JSON.stringify(error));
                        }
                    });
                },
                // 일정 시간 표시 : HH24:MI 포맷, am/pm 표시 안함 (default를 allDay로 해서 큰 의미는 없음)
                eventTimeFormat: {
                    hour: '2-digit',
                    minute: '2-digit',
                    hour12: false,
                    meridiem: false
                },
                // 일정 블록을 블럭모양으로 출력
                eventDisplay: 'block',
                // allDay시 날짜가 -1되는 이슈 해결을 위해 allDay의 default를 false로 두고, 이벤트 렌더링 후 일정시간 div을 없앰
                eventDidMount: function () {
                    $(".fc-event-time").remove();
                }

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
            $(".fc-prev-button, .fc-next-button, .fc-prevYear-button, .fc-nextYear-button, .fc-today-button").on("click", function () {
                var currentYear = calendar.view.currentStart.getFullYear();
                if (todayYear != currentYear) {
                    $("#currentYear").show();
                    $("#currentYear").text(currentYear + "년 ");
                } else if (todayYear == currentYear) {
                    $("#currentYear").hide();
                }
            });

            // X버튼 및 배경 클릭 시 모달 창 종료
            $("body").on("click", function (event) {
                if (event.target.id == "eventModalClose") {
                    $("#eventModal").hide();
                    $(".modalBackground").remove();
                } else if (event.target.id == "addEventModalClose") {
                    $("#addEventModal").hide();
                } else if (event.target.className == "modalBackground") {
                    $("#eventModal").hide();
                    $("#addEventModal").hide();
                    $(".modalBackground").remove();
                }
            });

            // 일정 모달창에서 "일정 추가창" 버튼 클릭 시 일정 추가 모달 창으로 전환
            $("#addEvent").on("click", function () {
                $("#addEventModal").show();
            });

            // "일정 추가하기" 버튼 클릭 시 실행
            $("#addEventButton").on("click", function () {
                console.log("addEvent 메소드 실행");

                // 입력 데이터 변수에 할당
                var title = $("#eventTitle").val();
                var start = $("#eventStartDate").val() + " " + $("#eventStartTime").val();
                var end = $("#eventEndDate").val() + " " + $("#eventEndTime").val();
                console.log(start);
                console.log(end);
                var schedule_content = $("#eventContent").val();
                var schedule_writer = "${member.member_name}";
                var member_email = "${member.member_email}";
                var isForAll = $("#isForAll").is(":checked");

                // json 데이터
                var newSchedule = {
                    "title": title,
                    "start": start,
                    "end": end,
                    "schedule_content": schedule_content,
                    "schedule_writer": schedule_writer,
                    "member_email": member_email,
                    "isForAll": isForAll
                };
                console.log("isForAll 확인용 : " + isForAll);

                $.ajax({
                    url: '${contextPath}/schedule/addSchedule.do',
                    type: 'POST',
                    // 서버단에서 RequestBody로 받기 위해서는 json데이터를 string타입으로 변환해줘야함
                    data: newSchedule,
                    // 서버 요청 데이터 타입
                    dataType: 'text',
                    success: function (msg) {
                        console.log(msg);
                        // 캘린더 일정 정보 갱신
                        calendar.refetchEvents();
                        // 모달창 종료
                        $("#addEventModal").hide();
                        $("#eventModal").hide();
                        $(".modalBackground").hide();
                    },
                    error: function (error) {
                        console.log(JSON.stringify(error));
                    }
                });

            });

            // 일정 삭제 버튼은 동적으로 생성된 DOM이기에 아래와 같은 방식으로 써주지않으면 인식 못함
            $(document).on("click", ".eventBlockClose", function () {
                var thisEventBlock = $(this).parent();
                // 삭제버튼이 속한 eventBlock의 일정 id값을 추출
                var id = thisEventBlock.children(".eventId").val();
                console.log(id);
                // 일괄추가로 생성된 일정은 교사 계정에서 일괄 삭제 가능
                var isForAllDelete = thisEventBlock.children(".isForAllDelete").is(":checked");
                console.log(isForAllDelete);
                var cmd = confirm("일정을 삭제하시겠습니까?");
                if (cmd == true) {
                    $.ajax({
                        url: '${contextPath}/schedule/delSchedule.do',
                        type: 'POST',
                        dataType: 'text',
                        data: {
                            "id": id,
                            "isForAllDelete": isForAllDelete
                        },
                        success: function (msg) {
                            console.log(msg);
                            // 삭제된 일정의 이벤트 블록 제거
                            thisEventBlock.remove();
                            // 캘린더 일정 정보 갱신
                            calendar.refetchEvents();
                        },
                        error: function (error) {
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
            var sYear = yyyyMMdd.substring(0, 4);
            var sMonth = yyyyMMdd.substring(5, 7);
            var sDate = yyyyMMdd.substring(8, 10);
            return new Date(Number(sYear), Number(sMonth) - 1, Number(sDate));
        }

    </script>
    <script src="<https://unpkg.com/typeit@8.5.4/dist/index.umd.js>"></script>
    <script>
        new TypeIt("#myElement", {
            strings: "This is what will be typed!",
        }).go();
    </script>
    <!-- 내부 스타일시트 -->
    <style>
        #eventModalDate {
            width: 360px;
            background-color: #E2E2E2;
            border: 2px #868e96 solid;
            margin: 20px auto;
            text-align: center;
        }

        .eventBlock {
            width: 360px;
            background-color: #F8F9FA;
            border: 2px #868e96 solid;
            margin: 20px auto;
            text-align: center;
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
            text-align: center;
        }

        #addEventModal {
            display: none;
            width: 400px;
            height: 600px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -250px 0 0 -250px;
            background-color: #f9fafb;
            z-index: 2;
            text-align: center;
        }

        #eventContent {
            width: 80%;
            height: 8em;
            border: 1px black solid;
            resize: none;
        }

        .modalBackground {
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

        #eventModalClose {
            position: absolute;
            top: 0px;
            right: 15px;
            cursor: pointer;
            font-size: 2em;
        }

        #addEventModalClose {

        }

        .fc-day-sun {
            color: red;
        }

        .fc-day-sat {
            color: blue;
        }

    </style>
</head>
<body>
<div class="container col-md-6">


    <div class="row">

        <!-- Simple slider -->
        <div class="col-md-6">
            <h3>${member.member_name} 학우님 환영합니다!</h3>
            <br>
            <div class="row">
                <div class="col-md-8">
                    <div>

                        <i class="ni ni-calendar-grid-58"></i>
                        <span>Today</span>
                        <h3>${t_day}</h3>

                    </div>
                </div>
                <div class="col-md-4">
                    <br>
                    <button type="button" onclick="location.href='${contextPath}/attendance/attendance_student'"
                            style="color:white;background-color: #0065FF;" class="btn btn-secondary">출결
                    </button>
                </div>

            </div>
            <br>
            <div class="col-md-12" >
                <div style="background-color:#204a40; border: .5em solid saddlebrown; min-height: 230px; color: #F4F4F5">
                    <h3 id="title" style="color: #F4F4F5">금주의 주번<br>레토</h3>
                    <script>
                        document.addEventListener('DOMContentLoaded', () => {
                            new TypeIt('#title') //
                                .pause(1000)
                                .delete(2, { delay: 1000 })
                                .type('아야')
                                .go();
                        });
                    </script>

                </div>
            </div>
        </div>
        <div class="col-md-6">
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
                <button id="addEventButton" type="button">일정 추가하기</button>
                <br>
                <!-- 교사 회원일 경우 일괄 추가 기능을 지원 -->
                <c:if test="${member.member_type eq '교사'}">
                    일괄 추가<input id="isForAll" name="isForAll" value="true" type="checkbox" checked/>
                </c:if>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-6">


            <h4>식단표</h4>

            <form>
                <table class="table table-bordered" id="list_table">

                    <tr style="font-size: .6em">
                        <th></th>

                        <th style="width: 20%">월 <fmt:parseDate value="${week}" var="dateValue" pattern="yyyy-MM-dd"/>
                            <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                        <th style="width: 20%">화 <fmt:parseDate value="${week1}" var="dateValue" pattern="yyyy-MM-dd"/>
                            <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                        <th style="width: 20%">수 <fmt:parseDate value="${week2}" var="dateValue" pattern="yyyy-MM-dd"/>
                            <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                        <th style="width: 20%; background-color: #FAF1E6">목 <fmt:parseDate value="${week3}"
                                                                                           var="dateValue"
                                                                                           pattern="yyyy-MM-dd"/>
                            <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                        <th style="width: 20%">금 <fmt:parseDate value="${week4}" var="dateValue" pattern="yyyy-MM-dd"/>
                            <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                        <!-- <th>행 삭제</th> -->
                    </tr>
                    <c:forEach var="showMenuVO" items="${ShowMenuVOList}">
                        <tr>
                            <td>메뉴</td>
                            <c:forEach var="menu_content" items="${showMenuVO.menu_content}">
                                <td style="font-size: .5em">
                                        ${menu_content}
                                </td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
        <div class="col-md-6">
            <div class="bd-example" data-example-id="">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class=""></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2" class="active"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item">
                            <img class="d-block w-100"
                                 data-src="holder.js/800x400?auto=yes&amp;bg=777&amp;fg=555&amp;text=First slide"
                                 alt="First slide [800x400]" src="${contextPath}\assets\img\2.png"
                                 data-holder-rendered="true">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100"
                                 data-src="holder.js/800x400?auto=yes&amp;bg=666&amp;fg=444&amp;text=Second slide"
                                 alt="Second slide [800x400]" src="${contextPath}\assets\img\1.png"
                                 data-holder-rendered="true">
                        </div>
                        <div class="carousel-item active">
                            <img class="d-block w-100"
                                 data-src="holder.js/800x400?auto=yes&amp;bg=555&amp;fg=333&amp;text=Third slide"
                                 alt="Third slide [800x400]" src="${contextPath}\assets\img\3.png"
                                 data-holder-rendered="true">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>


</div>


</body>
</html>
