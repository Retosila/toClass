<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"
%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
            rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
          rel="stylesheet">
    <!-- Nucleo Icons -->
    <link href="${contextPath}/assets/css/nucleo-icons.css" rel="stylesheet"/>
    <link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <link href="${contextPath}/assets/css/font-awesome.css" rel="stylesheet"/>
    <link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet"/>

    <!-- CSS Files -->
    <link href="${contextPath}/assets/css/argon-design-system.css?v=1.2.2"
          rel="stylesheet"/>

    <style>


        #content {
            min-height: calc(100vh - 100px);

        }


    </style>
    <title><tiles:insertAttribute name="title"/></title>
</head>
<body>
<div id="container">
    <div id="header">
        <tiles:insertAttribute name="header"/>
    </div>
    <div id="content" class="pt-5 pb-5">
        <tiles:insertAttribute name="body"/>
    </div>
    <div id="footer">
        <tiles:insertAttribute name="footer"/>
    </div>
</div>


<script src="${contextPath}/assets/js/core/jquery.min.js"
        type="text/javascript"></script>
<script src="${contextPath}/assets/js/core/popper.min.js"
        type="text/javascript"></script>

<script src="${contextPath}/assets/js/core/bootstrap.min.js"
        type="text/javascript"></script>

<script
        src="${contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>

<script src="${contextPath}/assets/js/plugins/bootstrap-switch.js"></script>


<script src="${contextPath}/assets/js/plugins/nouislider.min.js"
        type="text/javascript"></script>
<script src="${contextPath}/assets/js/plugins/moment.min.js"></script>
<script src="${contextPath}/assets/js/plugins/datetimepicker.js"
        type="text/javascript"></script>
<script
        src="${contextPath}/assets/js/plugins/bootstrap-datepicker.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>
