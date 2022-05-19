<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title></title>
</head>
<body>

<div class="container col-md-6">
    <h1>시간표</h1>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th class="col-md-1"></th>
            <th class="col-md-1">월</th>
            <th class="col-md-1">화</th>
            <th class="col-md-1">수</th>
            <th class="col-md-1">목</th>
            <th class="col-md-1">금</th>
        </tr>
        </thead>
<tbody >
        <tr class="text-center">
            <td>1교시</td>
            <td>체육</td>
            <td>사상</td>
            <td>세계지리</td>

            <td>물리</td>
            <td>지구과학</td>



        </tr>
        <tr class="text-center">
            <td>2교시</td>
            <td>수학</td>
            <td>체육</td>
            <td>지구과학</td>
            <td>한국사</td>
            <td>한문</td>


        </tr>
        <tr class="text-center">
            <td>3교시</td>
            <td>음악</td>
            <td>지구과학</td>

            <td>생명과학</td>
            <td>미술</td>
            <td>화학</td>
        </tr>
        <tr class="text-center">
            <td>4교시</td>

            <td>생명과학</td>
            <td>국어</td>
            <td>사회문화</td>
            <td>화학</td>
            <td>영어</td>
        </tr>
        <tr class="text-center">
            <td>5교시</td>
            <td>한국사</td>
            <td>화학</td>
            <td>영어</td>
            <td>수학</td>
            <td>사회문화</td>

        </tr>
        <tr class="text-center">
            <td>6교시</td>

            <td>화학</td>
            <td>윤리</td>
            <td>체육</td>
            <td>기술가정</td>
            <td>중국어</td>
        </tr>
        <tr class="text-center">
            <td>7교시</td>

            <td>사회문화</td>
            <td>수학</td>
            <td>미적분</td>
            <td>한국사</td>
            <td>스페인어</td>
        </tr>
        </tbody>
    </table>


</div>
</body>
</html>
