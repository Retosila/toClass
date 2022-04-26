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
                            
                        </a>
                    </div>
                </div>
                <div class="card-body px-lg-5 py-lg-5">
                    <div class="text-center text-muted mb-4">
                        <small>아이디와 비밀번호를 입력해주세요.</small>
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
                                <input class="form-control" placeholder="Password" type="password" name="pw" value="">
                            </div>
                        </div>
                        <!-- <div class="custom-control custom-control-alternative custom-checkbox">
                            <input class="custom-control-input" id=" customCheckLogin" type="checkbox">
                            <label class="custom-control-label" for=" customCheckLogin"><span>아이디 저장</span></label>
                        </div> -->
                        <div class="text-center">
                        
                           <button type="INPUT" class="btn btn-primary my-4"value="로그인" >로그인</button>
                           <div class="g-signin2" data-onsuccess="onSignIn"></div>
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










































<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!doctype html>
<html lang="ko">
    <head>
      <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="651836858023-dl00vv6h7v8fq5321nr306j3el1jd4gn.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta
            name="author"
            content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.88.1">
        <title>toClass.로그인</title>

        <link
            rel="canonical"
            href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

        <!-- Bootstrap core CSS -->
        <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>

        <!-- Custom styles for this template -->
        <link href="${contextPath}/css/styles.css" rel="stylesheet">
        
    </head>
    <body class="text-center">

        <main class="form-signin">
            <form action="index.html">
                <img class="mb-4" src="/images/logo.png" alt="">


                <div class="form-floating">
                    <input
                        type="text"
                        class="form-control"
                        id="floatingInput"
                        placeholder="ID를 입력하세요."
                        style="margin-top: 0px;margin-bottom: 10px;">

                </div>
                <div class="form-floating">
                    <input
                        type="password"
                        class="form-control"
                        id="floatingPassword"
                        placeholder="Password">

                </div>

                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me">
                        아이디 저장
                    </label>
                </div>
                <button class="w-50 mb-3 btn btn-lg btn-primary" id="loginBtn" type="submit">로그인</button>
            </form>

            <button class="mb-3 btn btn-sm btn-primary" id="findId" href="C:\Users\User\Desktop\toClass--\springEx\src\main\webapp\WEB-INF\views\member\google_login.html" >ID 찾기</button>
            <button class="mb-3 btn btn-sm btn-primary" id="findPw" >PW 찾기</button>
            <button class="mb-3 btn btn-sm btn-primary" onclick="location.href='signup.html';" >회원가입</button>
            <p class="mt-5 mb-3 text-muted">&copy; 2022</p>
            
            
            <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
    </script>
        </main>

      <div class="modal fade" id="findIdModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">ID 찾기</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <label for="userNameById" class="col-3 control-label">이름</label>
                            <div class="col-9">
                                <input type="text" class="form-control onlyHangul userName" id="userNameById" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                            </div>
                        </div>
                        <div class="row">
                            <label for="userPhoneNumById" class="col-3 control-label">휴대폰 번호</label>
                            <div class="col-9">
                                <input type="tel" class="form-control onlyNumber userPhoneNum" id="userPhoneNumById" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="findIdBtn">찾기</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                </div>/.modal-content
            </div>/.modal-dialog
        </div>/.modal -->

        <div class="modal fade" id="findPwModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">PW 찾기</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <label for="userID" class="col-lg-3 control-label">아이디</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control onlyHangul" id="userID" data-rule-required="true" placeholder="아이디를 입력하세요." maxlength="15">
                            </div>
                        </div>
                        <div class="row">
                            <label for="userNameByPw" class="col-lg-3 control-label">이름</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control onlyHangul userName" id="userNameByPw" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                            </div>
                        </div>

                        <div class="row">
                            <label for="userPhoneNumByPw" class="col-lg-3 control-label">휴대폰 번호</label>
                            <div class="col-lg-9">
                                <input type="tel" class="form-control onlyNumber userPhoneNum" id="userPhoneNumByPw" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="findPwBtn">찾기</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery.js"></script>

        <!--<script>
            $(function() {
                $("#findId").click(function() {
                    $("#findIdModal").modal("show");
                    $("#userNameById").val('');
                    $("#userPhoneNumById").val('');
                });

                $("#findPw").click(function() {
                    $("#findPwModal").modal("show");
                    $("#userID").val('');
                    $("#userNameByPw").val('');
                    $("#userPhoneNumByPw").val('');
                });

                $("#findIdBtn").click(function() {
                    var userNm = $("#userNameById").val();
                    var userPhoneNum = $("#userPhoneNumById").val();
                    alert("name:" + userNm + "\nnum:" + userPhoneNum);
                });

                $("#findPwBtn").click(function() {
                    var userId = $("#userID").val();
                    var userNm = $("#userNameByPw").val();
                    var userPhoneNum = $("#userPhoneNumByPw").val();
                    alert("Id: " + userId + "\nname: " + userNm + "\nnum: " + userPhoneNum);
                });

                $("#loginBtn").click(function() {
                    var inputId = $("#floatingInput").val();
                    var inputPw = $("#floatingPassword").val();

                    if(inputId == '' || inputPw == '') {
                        alert('ID / Password 를 확인해주세요.');
                    } else {
                        return;
                    }
                    event.preventDefault();
                });
            });
        </script>-->

    </body>
    
</html> 
  
 --%>