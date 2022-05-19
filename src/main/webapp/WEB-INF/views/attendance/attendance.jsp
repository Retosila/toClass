<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
    request.setCharacterEncoding("UTF-8");
%>
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
    		
    		//버튼 누르면 출석 유형 나오면서 버튼 유지
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
					//버튼 누르면 출석 유형 나오면서 버튼은 유지
		    		var chosen = $("<p>" + attend_status + "</p>");
		    		temp.append(chosen);
		    		temp2.remove();
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
						
						<c:choose>
							<c:when test="${fn:length(attendVOStat) != 0}">
							
		                        <td>
		                         	${attendVOStat}
		                        </td>
		                        
								<c:if test="${status.last}">
									<c:if test="${thisDay != now}">
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
