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
</head>
<nav id="navbar-main"
	class="navbar navbar-main navbar-expand-lg bg-white navbar-light position-sticky top-0 shadow py-2">
	<div class="container" stlye="text-align: left;">
	
	
	<div class="navbar-brand " href="${contextPath}/main.do" style="color:#0065FF; font-family:'Product sans bold';">
	
	<i class="ni ni-chat-round"></i>
	<a>to</a><a style="font-size:1px">Cla</a><a>ss</a>
	
	</div>
	
	
				<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar_global" aria-controls="navbar_global"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse" id="navbar_global" >
			<div class="navbar-collapse-header">
				<div class="row">
					<div class="col-6 collapse-brand">
						<a class="navbar-brand" href="${contextPath}/main.do"><img src="${contextPath}/assets/img/brand/logo3.png" style="height: 60px;"></a>
					</div>
					<div class="col-6 collapse-close">
						<button type="button" class="navbar-toggler"
							data-toggle="collapse" data-target="#navbar_global"
							aria-controls="navbar_global" aria-expanded="false"
							aria-label="Toggle navigation">
							<span></span> <span></span>
						</button>
					</div>
				</div>
			</div>
			

				<ul class="navbar-nav navbar-nav-hover align-items-lg-center">

					<li class="nav-item dropdown">
					<a href="#" class="nav-link"
						data-toggle="dropdown" href="#" role="button"> 
						<i class="ni ni-collection d-lg-none"></i> 
							<span class="nav-link-inner--text">출결</span>
					</a>
						<div class="dropdown-menu">
							<a href="${contextPath}/attendance/attendance"
								class="dropdown-item">출결입력</a>
						</div></li>
				</ul>
				<ul class="navbar-nav navbar-nav-hover align-items-lg-center">

					<li class="nav-item dropdown"><a href="#" class="nav-link"
						data-toggle="dropdown" href="#" role="button"> <i
							class="ni ni-collection d-lg-none"></i> <span
							class="nav-link-inner--text">성적</span>
					</a>
						<div class="dropdown-menu">
							<a href="${contextPath}/achievement/achievement"
								class="dropdown-item">성적분석</a> <a href="./examples/profile.html"
								class="dropdown-item">성적분석</a>
						</div></li>
				</ul>
				<ul class="navbar-nav navbar-nav-hover align-items-lg-center">

					<li class="nav-item dropdown"><a href="#" class="nav-link"
						data-toggle="dropdown" href="#" role="button"> <i
							class="ni ni-collection d-lg-none"></i> <span
							class="nav-link-inner--text">과제</span>
					</a>
						<div class="dropdown-menu">

							<a href="#" class="dropdown-item">과제현황</a>
						</div></li>
				</ul>
				<ul class="navbar-nav navbar-nav-hover align-items-lg-center">

					<li class="nav-item dropdown"><a href="#" class="nav-link"
						data-toggle="dropdown" href="#" role="button"> <i
							class="ni ni-collection d-lg-none"></i> <span
							class="nav-link-inner--text">일정</span>
					</a>
						<div class="dropdown-menu">
							<a href="./examples/landing.html" class="dropdown-item">학사캘린더</a>
							<a href="./examples/profile.html" class="dropdown-item">수업시간표</a>
							<a href="./examples/login.html" class="dropdown-item">알림장</a> <a
								href="./examples/register.html" class="dropdown-item">식단표</a>
						</div></li>
				</ul>

				<ul class="navbar-nav navbar-nav-hover align-items-lg-center">

					<li class="nav-item dropdown"><a href="#" class="nav-link"
						data-toggle="dropdown" href="#" role="button"> <i
							class="ni ni-collection d-lg-none"></i> <span
							class="nav-link-inner--text">커뮤니티</span>
					</a>
						<div class="dropdown-menu">
							<a href="${contextPath}/board/listArticles.do" class="dropdown-item">자유게시판</a>
							<a href="./examples/profile.html" class="dropdown-item">질의문의</a>
							<a href="${contextPath}/member/listMembers.do"
							class="dropdown-item">회원관리</a>
							<a href="./examples/login.html" class="dropdown-item">정보</a> <a
								href="./examples/register.html" class="dropdown-item">유머</a>
						</div></li>
				</ul>

				
			

<hr>
			<ul class="navbar-nav ml-lg-auto">
				<c:choose>
					<c:when test="${isLogOn == true  && member!= null}">
						<li class="nav-item"><a class="nav-link"
							href="${contextPath}/member/logout.do">로그아웃 <span
								class="sr-only">(current)</span>
						</a></li>

					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							href="${contextPath}/member/memberForm.do">회원가입</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${contextPath}/member/loginForm.do">로그인</a>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</div>
</nav>







<script src="${contextPath}/assets/js/core/jquery.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/assets/js/core/popper.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/assets/js/core/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="${contextPath}/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="${contextPath}/assets/js/plugins/jquery.sticky.js"
	type="text/javascript"></script>
<script src="${contextPath}/assets/js/plugins/nouislider.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/assets/js/plugins/moment.min.js"></script>
<script src="${contextPath}/assets/js/plugins/datetimepicker.js"
	type="text/javascript"></script>
<script
	src="${contextPath}/assets/js/plugins/bootstrap-datepicker.min.js"></script>
<!-- Control Center for Argon UI Kit: parallax effects, scripts for the example pages etc -->
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<script
	src="${contextPath}/assets/js/argon-design-system.min.js?v=1.2.2"
	type="text/javascript"></script>
<script>
	function scrollToDownload() {

		if ($('.section-download').length != 0) {
			$("html, body").animate({
				scrollTop : $('.section-download').offset().top
			}, 1000);
		}
	}
	/*
	var siteSticky = function() {
		$(".js-sticky-header").sticky({topSpacing:0});
	};
	siteSticky();

	var siteMenuClone = function() {

		$('.js-clone-nav').each(function() {
			var $this = $(this);
			$this.clone().attr('class', 'site-nav-wrap').appendTo('.site-mobile-menu-body');
		});


		setTimeout(function() {
			
			var counter = 0;
	  $('.site-mobile-menu .has-children').each(function(){
	    var $this = $(this);
	    
	    $this.prepend('<span class="arrow-collapse collapsed">');

	    $this.find('.arrow-collapse').attr({
	      'data-toggle' : 'collapse',
	      'data-target' : '#collapseItem' + counter,
	    });

	    $this.find('> ul').attr({
	      'class' : 'collapse',
	      'id' : 'collapseItem' + counter,
	    });

	    counter++;

	  });

	}, 1000);

		$('body').on('click', '.arrow-collapse', function(e) {
	  var $this = $(this);
	  if ( $this.closest('li').find('.collapse').hasClass('show') ) {
	    $this.removeClass('active');
	  } else {
	    $this.addClass('active');
	  }
	  e.preventDefault();  
	  
	});

		$(window).resize(function() {
			var $this = $(this),
				w = $this.width();

			if ( w > 768 ) {
				if ( $('body').hasClass('offcanvas-menu') ) {
					$('body').removeClass('offcanvas-menu');
				}
			}
		})

		$('body').on('click', '.js-menu-toggle', function(e) {
			var $this = $(this);
			e.preventDefault();

			if ( $('body').hasClass('offcanvas-menu') ) {
				$('body').removeClass('offcanvas-menu');
				$this.removeClass('active');
			} else {
				$('body').addClass('offcanvas-menu');
				$this.addClass('active');
			}
		}) 

		// click outisde offcanvas
		$(document).mouseup(function(e) {
	    var container = $(".site-mobile-menu");
	    if (!container.is(e.target) && container.has(e.target).length === 0) {
	      if ( $('body').hasClass('offcanvas-menu') ) {
					$('body').removeClass('offcanvas-menu');
				}
	    }
		});
	}; 
	siteMenuClone();*/
</script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
<script>
	window.TrackJS && TrackJS.install({
		token : "ee6fab19c5a04ac1a32a645abde4613a",
		application : "argon-design-system-pro"
	});
</script>
</body>
</html>