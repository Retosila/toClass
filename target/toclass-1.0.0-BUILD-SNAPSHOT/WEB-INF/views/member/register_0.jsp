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
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <!-- Nucleo Icons -->
    <link href="${contextPath}/assets/css/nucleo-icons.css" rel="stylesheet"/>
    <link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <link href="${contextPath}/assets/css/font-awesome.css" rel="stylesheet"/>
    <link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- CSS Files -->
    <link href="${contextPath}/assets/css/argon-design-system.css?v=1.2.2" rel="stylesheet"/>
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

<script href="${contextPath}/assets/js/core/jquery.min.js" type="text/javascript"></script>
<script href="${contextPath}/assets/js/core/popper.min.js" type="text/javascript"></script>
<script href="${contextPath}/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<script href="${contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script href="${contextPath}/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script href="${contextPath}/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<script href="${contextPath}/assets/js/plugins/moment.min.js"></script>
<script href="${contextPath}/assets/js/plugins/datetimepicker.js" type="text/javascript"></script>
<script href="${contextPath}/assets/js/plugins/bootstrap-datepicker.min.js"></script>
<!-- Control Center for Argon UI Kit: parallax effects, scripts for the example pages etc -->
<script href="${contextPath}/assets/js/argon-design-system.min.js?v=1.2.2" type="text/javascript"></script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
</body>
</html>





