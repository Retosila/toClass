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
<form name="frmLogin" method="post"  action="${contextPath}/member/login.do">

	<div class="container pt-lg-7">
		<div class="row justify-content-center">
			<div class="col-lg-5">
				<div class="card bg-secondary shadow border-0">
					<div class="card-header bg-white pb-5">
						<div class="text-muted text-center mb-3"><small>Sign in with</small></div>
						<div class="btn-wrapper text-center">
							<a href="#" class="btn btn-neutral btn-icon">
								<span class="btn-inner--icon"><img src="../assets/img/icons/common/github.svg"></span>
								<span class="btn-inner--text">Github</span>
							</a>
							<a href="#" class="btn btn-neutral btn-icon g-signin2" data-onsuccess="onSignIn">
								<span class="btn-inner--icon"><img src="../assets/img/icons/common/google.svg"></span>
								<span class="btn-inner--text">Google</span>
								<%--구글로그인--%>
								<%--<div class="g-signin2" data-onsuccess="onSignIn"></div>--%>
							</a>
						</div>
					</div>



					<div class="card-body px-lg-5 py-lg-5">
						<div class="text-center text-muted mb-4">
							<small>Or sign in with credentials</small>
						</div>
						<form role="form">
							<div class="form-group mb-3">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="ni ni-email-83"></i></span>
									</div>
									<input class="form-control" placeholder="Email" type="text" name="member_email" value="">
								</div>
							</div>
							<div class="form-group focused">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
									</div>
									<input class="form-control" placeholder="Password" type="password" name="member_pw" value="">
								</div>
							</div>

							<div class="custom-control custom-control-alternative custom-checkbox">
								<input class="custom-control-input" id=" customCheckLogin" type="checkbox">
								<label class="custom-control-label" for=" customCheckLogin"><span>아이디 저장</span></label>
							</div>
							<div class="text-center">

								<button type="submit" class="btn btn-primary my-4" value="로그인" >로그인${LogOn=true}</button>
							</div>
						</form>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-4 text-left">
						<a href="${contextPath}/member/findAccount" class="text-light"><small>계정찾기</small></a>
					</div>
					<div class="col-4">
						<a href="${contextPath}/member/findPw" class="text-light"><small>비밀번호 찾기</small></a>
					</div>
					<div class="col-4 text-right">
						<a href="${contextPath}/member/register_0" class="text-light"><small>회원가입</small></a>
					</div>
				</div>
			</div>
			<c:choose>
				<c:when test="${result eq 'loginFailed'}">
					<script>
						console.log("${result}");
					</script>
					<h4>로그인 실패 : 이메일주소 및 비밀번호가 일치하지 않습니다.</h4>
				</c:when>
				<c:when test="${result eq 'unregistered'}">
					<script>
						console.log("${result}");
						alert("회원탈퇴가 완료되었습니다.");
					</script>
				</c:when>
			</c:choose>
		</div>
	</div>
	<%--구글 로그인--%>
	<%--<script>
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		}
	</script>--%>

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






