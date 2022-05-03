<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="en">

    <head>
    	<meta name="google-signin-scope" content="profile email">
	    <meta name="google-signin-client_id" content="651836858023-dl00vv6h7v8fq5321nr306j3el1jd4gn.apps.googleusercontent.com">
	    <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="./assets/img/favicon.png">
        <title>
            Argon Design System by Creative Tim
        </title>
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <!-- Nucleo Icons -->
        <link href="${contextPath}/assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <link href="${contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
        <link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link href="${contextPath}/assets/css/argon-design-system.css?v=1.2.2" rel="stylesheet" />
<script>
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		console.log('Name: ' + profile.getName());
		console.log('Image URL: ' + profile.getImageUrl());
		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
</script>
<c:choose>
	<c:when test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose> 

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
                        <a href="#" class="btn btn-neutral btn-icon" class="g-signin2" data-onsuccess="onSignIn">
                            <span class="btn-inner--icon"><img src="../assets/img/icons/common/google.svg"></span>
                            <span class="btn-inner--text">Google</span>
                            <div class="g-signin2" data-onsuccess="onSignIn"></div>
                        </a>
                    </div>
                </div>
          
                <div class="g-signin2" data-onsuccess="onSignIn"></div>
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
                                <input class="form-control" placeholder="Email" type="text" name="id" value="">
                            </div>
                        </div>
                        <div class="form-group focused">
                            <div class="input-group input-group-alternative">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                </div>
                                <input class="form-control" placeholder="Password" type="password" name="pwd" value="">
                            </div>
                        </div>
                        <div class="custom-control custom-control-alternative custom-checkbox">
                            <input class="custom-control-input" id=" customCheckLogin" type="checkbox">
                            <label class="custom-control-label" for=" customCheckLogin"><span>아이디 저장</span></label>
                        </div>
                        <div class="text-center">
                        
                           <button type="INPUT" class="btn btn-primary my-4"value="로그인" >로그인</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <a href="#" class="text-light"><small>Forgot password?</small></a>
                </div>
                <div class="col-6 text-right">
                    <a href="#" class="text-light"><small>Create new account</small></a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://apis.google.com/js/platform.js" async defer></script>
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
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<script href="${contextPath}/assets/js/argon-design-system.min.js?v=1.2.2" type="text/javascript"></script>
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
