<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>
        메인
    </title>

</head>
<body>
<div class="container container-lg pt-9 pb-9">
    <div class="row">
        <div class="col-md-6 mb-5 mb-md-0">
            <div class="card card-lift--hover shadow border-0">
                <a href="${contextPath}/member/register_1?member_type=교사" title="Landing Page">
                    <img src="/assets/img/ill/teacher.png" class="card-img">
                </a>
                <H3 text-align="center !important">교사 회원가입</H3>
            </div>
        </div>
        <div class="col-md-6 mb-5 mb-lg-0">
            <div class="card card-lift--hover shadow border-0">
                <a href="${contextPath}/member/register_1?member_type=학생" title="Profile Page">
                    <img src="/assets/img/ill/student.png" class="card-img">
                </a>
                <H3 text-align="center !important">학생 회원가입</H3>
            </div>

        </div>
    </div>
    <div class="row">

    </div>
</div>


</body>
</html>





