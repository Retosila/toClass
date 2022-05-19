<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">


<style>
    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }

    @media ( min-width: 768px) {
        .bd-placeholder-img-lg {
            font-size: 3.5rem;
        }
    }

    th, td {
        text-align: center;
    }
</style>
<script>
    $(document).ready(function () {
        $(".dropdown-item").on("click", function () {
            var status = $(this).text();
            if (status == '출석') {
                $(this).parent().prev().css('background', '#5e72e4');
            } else if (status == '조퇴') {
                $(this).parent().prev().css('background', '#2dce89');
            } else if (status == '지각') {
                $(this).parent().prev().css('background', '#ffd600');
            } else if (status == '결석') {
                $(this).parent().prev().css('background', '#EC431F');
            } else {
            }

            $(this).parent().prev().text(status);
        });
    });

    //출석 버튼 클릭 시 실행
    $(document).ready(function(){
    	$(".dropdown-item").on("click", function() {
    		//attend_status, attend_time, member_name, currentClass 데이터 가져오기
    		var attend_status = $(this).text();
    		var member_name = $(this).closest("tr").data("name");
    		var currentClass = "${member.currentClass}";
    		console.log(attend_status);
    		console.log(member_name);
    		console.log(currentClass);

    		//버튼 누르면 출석 유형 나오면서 버튼은 사라짐
    		var chosen = $("<p>" + attend_status + "</p>");
    		var temp = $(this).closest(".dropdown");
    		var temp2 = $(this).closest(".dropdown").children("button, div");

    		// json 데이터
			var newAttend = {
					"attend_status" : attend_status,
					"member_name" : member_name,
					"currentClass" : currentClass,
			};

			$.ajax({
				url : '${contextPath}/attendance/insertAttend.do',
				type : 'POST',
				data : newAttend,
				dataType : 'text',
				success : function(msg) {
					console.log(msg);
					//버튼 누르면 출석 유형 나오면서 버튼은 사라짐
		    		var chosen = $("<p>" + attend_status + "</p>");
		    		temp.append(chosen);
		    		//temp2.remove();
		    		temp2.toggleClass(".dropdown-menu").attr("disabled", true);
		    		console.log("chosen 확인용 : " + chosen);
				},
				error : function(error) {
					console.log(JSON.stringify(error));
				}

			});
    	});
    });
</script>

<body>
<div class="container">
    <h1>출결</h1>
    <table class="table table-bordered">
        <tr>
            <th align='center'>오늘의 출석현황</th>

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
           <!--  <td width="20%">
                <div class="progress-wrapper"
                     style="padding-top: 0px;">
                    <div class="progress-info">
                        <div class="progress-percentage">
                            <span>80%</span>
                        </div>
                    </div>

                </div>
            </td> -->
            <td>0명</td>
            <td>5명</td>
            <td>2명</td>
            <td>0명</td>
            <td>0명</td>
            <td>7명</td>
        </tr>
    </table>

    <form>
        <table class="table table-bordered" id="list_table">


            <tr>
                <th>이름</th>
                <th>월 <fmt:parseDate value="${week}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                <th>화 <fmt:parseDate value="${week1}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                <th>수 <fmt:parseDate value="${week2}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                <th style="background-color: #98a2ac;color: #ffffff">목 <fmt:parseDate value="${week3}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                <th>금 <fmt:parseDate value="${week4}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                <!-- <th>행 삭제</th> -->
            </tr>
            <c:forEach var="showAttendVO" items="${ShowAttendVOList}">

                <tr data-name="${showAttendVO.member_name}">
                    <td>${showAttendVO.member_name} </td>

                    <c:forEach var="attendVOStat" items="${showAttendVO.attend_status}">

                        <td>
                              <div class="dropdown">
                                  <c:choose>
                             <c:when test="${attendVOStat=='조퇴'}"><button class="btn btn-primary dropdownMenuButton" type="button"
                                        data-toggle="dropdown" value="출결입력"
                                        aria-haspopup="true" aria-expanded="false" id="att_btn"
                                        style="background:#2dce89; border-color: rgb(255 255 255/ 50%) !important; ">${attendVOStat}
                                </button></c:when>
                             <c:when test="${attendVOStat=='지각'}"><button class="btn btn-primary dropdownMenuButton" type="button"
                                        data-toggle="dropdown" value="출결입력"
                                        aria-haspopup="true" aria-expanded="false" id="att_btn"
                                        style="background:#ffd600; border-color: rgb(255 255 255/ 50%) !important; ">${attendVOStat}
                                </button></c:when>
                             <c:when test="${attendVOStat=='결석'}"><button class="btn btn-primary dropdownMenuButton" type="button"
                                        data-toggle="dropdown" value="출결입력"
                                        aria-haspopup="true" aria-expanded="false" id="att_btn"
                                        style="background:#EC431F; border-color: rgb(255 255 255/ 50%) !important; ">${attendVOStat}
                                </button></c:when>
                             <c:otherwise><button class="btn btn-primary dropdownMenuButton" type="button"
                                        data-toggle="dropdown" value="출결입력"
                                        aria-haspopup="true" aria-expanded="false" id="att_btn"
                                        style="background:#5e72e4; border-color: rgb(255 255 255/ 50%) !important; ">${attendVOStat}
                                </button></c:otherwise>
                             </c:choose>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" data-text="${attendVOStat}">
                                    <a class="dropdown-item">출석</a>
                                    <a class="dropdown-item">조퇴</a>
                                    <a class="dropdown-item">지각</a>
                                    <a class="dropdown-item">결석</a>
                                </div>
                            </div>
                        </td>
                  </c:forEach>

					  <td>
                           <div class="dropdown">
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
                           </div>
                       </td>


             </tr>
         </c:forEach>
     </table>
        <!-- <button type="button" id="append_row"
                class="btn btn-outline-primary btn-lg" onclick=addRow()>추가
        </button> -->
        <script type="text/javascript">
            //버튼 클릭하면 추가
            function fn_addFile() {
                $("#d_file").append(
                    "<br>" + "<input type='file' name='file" + cnt + "' />");
                cnt++;
            }

            function addRow() {
                var el = document.getElementById('attendanceBtn');
            }

            $("#append_row").on("click", function () {
                $("#list_table").append(
                    $("<tr>").append(
                        $("<td>").append($("#name").val()),
                        $("<td>").append($("#dropdownMenuButton").val()),
                        $("<td>").append($("#dropdownMenuButton2").val()),
                        $("<td>").append($("#dropdownMenuButton3").val()),
                        $("<td>").append($("#dropdownMenuButton4").val()),
                        $("<td>").append($("#dropdownMenuButton5").val()),
                        //<td><a href="#" class="delete-link">삭제</a></td>
                        $("<td>").append($("<a>").prop("href", "#").addClass("delete-link").append("삭제")
                        )
                    )
                );
            });
            //삭제
            $("#list_table").on("click", ".delete-link", function () {
                //a태그의 부모의 부모태그 (a-td-tr)
                $(this).parent().parent().remove();
            });
        </script>
        <!-- <input type="submit" value="저장하기"
               class="btn btn-outline-primary btn-lg"/>
		 -->
    </form>

</div>


</body>
</html>
