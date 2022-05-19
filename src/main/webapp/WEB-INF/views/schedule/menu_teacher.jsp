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
<head>
<meta charset="UTF-8">
<title>학생 식단표</title>
</head>
<body>

<div class="container pt-lg-5">
    <h3>${member.member_name} 선생님 맛있는 식사하세요!</h3>
    <table class="table table-bordered">
        <tr>

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
					        </tr>
    </table>



<form>
   <table class="table table-bordered" id="list_table">

           <tr >
                <th></th>
                <th width="18%">월 <fmt:parseDate value="${week}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                <th width="18%">화 <fmt:parseDate value="${week1}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                <th width="18%">수 <fmt:parseDate value="${week2}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                <th width="18%">목 <fmt:parseDate value="${week3}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                <th width="18%">금 <fmt:parseDate value="${week4}" var="dateValue" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${dateValue}" pattern="MM.dd"/></th>
                <!-- <th>행 삭제</th> -->
            </tr>
        <c:forEach var="showMenuVO" items="${ShowMenuVOList}">
                <tr>
                    <td>메뉴</td>
                    <c:forEach var="menu_content" items="${showMenuVO.menu_content}">
                        <td>
                            ${menu_content}
                        </td>
                 	</c:forEach>
                  </tr>
        </c:forEach>
      </table>
      </form>




</div>
</body>
</html>
