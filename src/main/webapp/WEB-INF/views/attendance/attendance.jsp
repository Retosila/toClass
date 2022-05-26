<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page import="com.bbt.toclass.attendance.vo.ShowAttendVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%
    request.setCharacterEncoding("UTF-8");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar c1 = Calendar.getInstance();
	String strToday = sdf.format(c1.getTime());
	
	int pendency = 0;
	int attend = 0;
	int absence = 0;
	int leaveEarly = 0;
	int lateness = 0;
	int sum = 0;

	// 카운트용
	List<ShowAttendVO> savoList = (List<ShowAttendVO>) request.getAttribute("ShowAttendVOList");
	pendency = savoList.size();
	sum = savoList.size();
	
	for (int i = 0; i < savoList.size(); i++) {
		List<String> attend_status = savoList.get(i).getAttend_status();
		List<String> attend_time = savoList.get(i).getAttend_time();
		for (int j = 0; j < attend_status.size(); j++) {
			
			String thisTime = attend_time.get(j);
			if (attend_time.get(j) == null) {
				break;
			}
			
			String thisStatus = attend_status.get(j);
			thisTime = thisTime.substring(0,10);
			if (thisTime.equals(strToday)) {
				if (thisStatus.equals("출석")) {
					attend++;
					pendency--;
				}
				else if (thisStatus.equals("조퇴")) {
					leaveEarly++;
					pendency--;
				}
				else if (thisStatus.equals("지각")) {
					lateness++;
					pendency--;
				}
				else if (thisStatus.equals("결석")) {
					absence++;
					pendency--;
				}
				else {}
			}
		}
		
	}
	
%>

<c:set var="pendency" value="<%=pendency%>"/>
<c:set var="attend" value="<%=attend%>"/>
<c:set var="leaveEarly" value="<%=leaveEarly%>"/>
<c:set var="lateness" value="<%=lateness%>"/>
<c:set var="absence" value="<%=absence%>"/>
<c:set var="sum" value="<%=sum%>"/>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="today" value="<%=new java.util.Date()%>"/>

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
    
    .dropdownMenuButton[disabled] {
		  position: relative;
		  z-index: -1;
	}
    
</style>
<script>
    //출석 버튼 클릭 시 실행
    $(document).ready(function(){
    	$(".dropdown-item").on("click", function() {
    		
            var status = $(this).text();
            if (status == '출석') {
                $(this).parent().prev().css('background', '#5e72e4');
            } else if (status == '조퇴') {
                $(this).parent().prev().css('background', '#2dce89');
            } else if (status == '지각') {
                $(this).parent().prev().css('background', '#ffd600');
//                var pendency = ${pendency};
//                var lateness = ${lateness};
//                lateness++;
//                pendency--;
//                $("#pendency").text(pendency+"명");
//                $("#lateness").text(lateness+"명");
            } else if (status == '결석') {
                $(this).parent().prev().css('background', '#EC431F');
            } else {
            }

            $(this).parent().prev().text(status);
    		
    		//attend_status, attend_time, member_name, currentClass 데이터 가져오기 
    		var attend_status = $(this).text();
    		var member_name = $(this).closest("tr").data("name");
    		var currentClass = "${member.currentClass}";
    		console.log(attend_status);
    		console.log(member_name);
    		console.log(currentClass);
    		
    		//버튼 누르면 출석 유형 나오면서 버튼 유지
    		var chosen = $("<p>" + attend_status + "</p>");
    		var temp = $(this).closest(".dropdown");
    		var temp2 = $(this).closest(".dropdown").children("button");
    		
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
				success : function(resp) {
					//버튼 누르면 출석 유형 나오면서 버튼은 유지
		    		temp2.toggleClass(".dropdown-menu").attr("disabled", true);
					var jsonArray = JSON.parse(resp);
					console.log(jsonArray);
					$("#pendency").text(jsonArray[0].pendency+"명");
					$("#attend").text(jsonArray[0].attend+"명");
					$("#absence").text(jsonArray[0].absence+"명");
					$("#leaveEarly").text(jsonArray[0].leaveEarly+"명");
					$("#lateness").text(jsonArray[0].lateness+"명");
					$("#sum").text(jsonArray[0].sum+"명");
				},
				error : function(error) {
					
					console.log(JSON.stringify(error));
				}
				
			});
    	});

        $(".dropdown").on("dblclick", function(event) {
        	$(this).children(".dropdownMenuButton").attr("disabled", false);
	    });
    	
    	
    });
</script>

<body>
<div class="container pt-lg-5">
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
            <th>
            <td id="pendency">${pendency}명</td>
            <td id="attend">${attend}명</td>
            <td id="leaveEarly">${leaveEarly}명</td>
            <td id="lateness">${lateness}명</td>
            <td id="absence">${absence}명</td>
            <td id="sum">${sum}명</td>
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
                <th>목 <fmt:parseDate value="${week3}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                <th>금 <fmt:parseDate value="${week4}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
            </tr>
            
            <c:forEach var="showAttendVO" items="${ShowAttendVOList}">

                <tr data-name="${showAttendVO.member_name}">
                
                    <td>${showAttendVO.member_name} </td>
                    
                    <c:forEach var="attendVOStat" items="${showAttendVO.attend_status}" varStatus="status">

						<c:set var="attendVOTime" value="${showAttendVO.attend_time[status.index]}"/>
						
						<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy.MM.dd"/>
						<fmt:parseDate var="temp" value="${attendVOTime}" pattern="yyyy-MM-dd HH:mm"/>
						<fmt:formatDate var="thisDay" type="date" value="${temp}" pattern="yyyy.MM.dd"/>
						<fmt:formatDate var="dayOfWeek" type="date" value="${today}" pattern="E"/>
						
						<c:choose>
							<c:when test="${fn:length(attendVOStat) != 0}">
								<c:choose>
									<c:when test="${attendVOStat == '조퇴'}">
				                        <td>
				                         	<div class="dropdown">
						                               <button class="btn btn-primary dropdownMenuButton" type="button"
						                                       data-toggle="dropdown"
						                                       aria-haspopup="true" aria-expanded="false" disabled
						                                       style="border-color: rgb(255 255 255/ 50%) !important; 
						                                       		  background:#2dce89;">
						                                       ${attendVOStat}
						                               </button>
						                               <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						                                   <a class="dropdown-item">출석</a>
						                                   <a class="dropdown-item">조퇴</a>
						                                   <a class="dropdown-item">지각</a>
						                                   <a class="dropdown-item">결석</a>
		                             				  </div>
						                      </div>
				                        </td>
									</c:when>
									<c:when test="${attendVOStat == '지각'}">
				                        <td>
				                         	<div class="dropdown">
						                               <button class="btn btn-primary dropdownMenuButton" type="button"
						                                       data-toggle="dropdown"
						                                       aria-haspopup="true" aria-expanded="false" disabled
						                                       style="border-color: rgb(255 255 255/ 50%) !important; 
						                                       		  background:#ffd600;">
						                                       ${attendVOStat}
						                               </button>
						                               <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						                                   <a class="dropdown-item">출석</a>
						                                   <a class="dropdown-item">조퇴</a>
						                                   <a class="dropdown-item">지각</a>
						                                   <a class="dropdown-item">결석</a>
		                             				  </div>
						                      </div>
				                        </td>
									</c:when>
									<c:when test="${attendVOStat == '결석'}">
				                        <td>
				                         	<div class="dropdown">
						                               <button class="btn btn-primary dropdownMenuButton" type="button"
						                                       data-toggle="dropdown"
						                                       aria-haspopup="true" aria-expanded="false" disabled
						                                       style="border-color: rgb(255 255 255/ 50%) !important; 
						                                       		  background:#EC431F;">
						                                       ${attendVOStat}
						                               </button>
						                               <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						                                   <a class="dropdown-item">출석</a>
						                                   <a class="dropdown-item">조퇴</a>
						                                   <a class="dropdown-item">지각</a>
						                                   <a class="dropdown-item">결석</a>
		                             				  </div>
						                      </div>
				                        </td>
									</c:when>
									<c:otherwise>
				                        <td>
				                         	<div class="dropdown">
						                               <button class="btn btn-primary dropdownMenuButton" type="button"
						                                       data-toggle="dropdown"
						                                       aria-haspopup="true" aria-expanded="false" disabled
						                                       style="border-color: rgb(255 255 255/ 50%) !important; ">${attendVOStat}
						                               </button>
						                               <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						                                   <a class="dropdown-item">출석</a>
						                                   <a class="dropdown-item">조퇴</a>
						                                   <a class="dropdown-item">지각</a>
						                                   <a class="dropdown-item">결석</a>
		                             				  </div>
						                      </div>
				                        </td>
									</c:otherwise>
								
								</c:choose>
							
							
							
		                        
								<c:if test="${status.last}">
									<c:if test="${thisDay != now && dayOfWeek != '토' && dayOfWeek != '일'}">
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
									</c:if>
								</c:if>
							</c:when>
							
							<c:when test="${fn:length(attendVOStat) == 0}">
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
							</c:when>
							
						</c:choose>
						
                   </c:forEach>

             </tr>
         </c:forEach>
     </table>
    </form>

</div>


</body>
</html>
