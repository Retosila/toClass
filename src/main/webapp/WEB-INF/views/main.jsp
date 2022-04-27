<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<title>Argon Design System by Creative Tim</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- Nucleo Icons -->
<link href="${contextPath}/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<link href="${contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
<link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="${contextPath}/assets/css/argon-design-system.css?v=1.2.2"
	rel="stylesheet" />
<style>
body {
	background-image:
		url("${contextPath}/assets/img/theme/img-1-1200x1000.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
</head>
<body>





	<script href="${contextPath}/assets/js/core/jquery.min.js"
		type="text/javascript"></script>
	<script href="${contextPath}/assets/js/core/popper.min.js"
		type="text/javascript"></script>
	<script href="${contextPath}/assets/js/core/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		href="${contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script href="${contextPath}/assets/js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script href="${contextPath}/assets/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	<script href="${contextPath}/assets/js/plugins/moment.min.js"></script>
	<script href="${contextPath}/assets/js/plugins/datetimepicker.js"
		type="text/javascript"></script>
	<script
		href="${contextPath}/assets/js/plugins/bootstrap-datepicker.min.js"></script>
	<!-- Control Center for Argon UI Kit: parallax effects, scripts for the example pages etc -->
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<script
		href="${contextPath}/assets/js/argon-design-system.min.js?v=1.2.2"
		type="text/javascript"></script>
	<script>
    function scrollToDownload() {

        if ($('.section-download').length != 0) {
            $("html, body").animate({
                scrollTop: $('.section-download').offset().top
            }, 1000);
        }
    }
</script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
    window.TrackJS &&
    TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-design-system-pro"
    });
</script>
</body>
</html>





