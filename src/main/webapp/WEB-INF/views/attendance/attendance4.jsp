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

<style>
	html,body{height:100%; overflow-x:auto; overflow-y:hidden;}
	
	.overwrap { width:100%; height:100%; position:absolute; top:0px; left:0px; background-color:rgba(80,80,80,0.6); z-index:20; box-sizing:border-box; padding:100px 20px 20px 80px;}
	.overwrap .overwrap_txt { width:91%; padding:15px; color:#fff; text-align:center; line-height:20px; background-color:rgba(80,80,80,0.7); position:relative; box-sizing:border-box; border-radius:10px;}
	.overwrap .overwrap_txt span { color:#3F9;}
	.overwrap .overwrap_txt .lsc_link { width:103px; background-color:#FFF; border-radius:4px; text-align:center; margin:15px auto 0px auto;}
	.overwrap .overwrap_txt .lsc_link a { display:block; padding:5px 0px 5px 0px; color:#090; text-decoration:none; font-weight:bold;}
	.overwrap .overwrap_txt .lsc_link a:hover	{ color:#69F;}
</style>

<script>
var gNowDir = "";

function locationGo(dir, goSrc, act, src, left, srcQuery, leftQuery){
	gNowDir = dir;

	var leftIsInQuMark = left.indexOf('?');
	if (leftIsInQuMark == -1)	//없다.
		$("#leftMenuFrame").attr("src","/LMS/"+dir+"/"+left+"?act="+act+"&"+leftQuery);
	else						//있다.
		$("#leftMenuFrame").attr("src","/LMS/"+dir+"/"+left+"&act="+act+"&"+leftQuery);
	
	if (goSrc == '1') {
		var srcIsInQuMark = src.indexOf('?');

		if (srcIsInQuMark == -1)	//없다.
			$("#contentsFrame").attr("src","/LMS/"+dir+"/"+src+"?act="+act+"&"+srcQuery);
		else
			$("#contentsFrame").attr("src","/LMS/"+dir+"/"+src+"&act="+act+"&"+srcQuery);
	}

	hideLeftQuickMenu();
}

function hideLeftQuickMenu()
{
	$(".left_quick_menu").hide();
}



function moveLeftWidth(opt1){
		
	//$("#leftMenu").css("width",opt1+"px");
	//$("#contents").css("padding-left",opt1+"px");
	
	$("#leftMenu").animate({width:opt1+"px"},500,'swing');
	$("#contents").animate({paddingLeft:opt1+"px"},500,'swing');
	
	$("#contentsFrame").contents().find(".contents").css("min-width",(900+220)-opt1+"px");
	$("#contentsFrame").contents().find("#fWidthTable").css("max-width",(950+220)-opt1+"px");		
}

function isNumber(s) {
  s += ''; // 문자열로 변환
  s = s.replace(/^\s*|\s*$/g, ''); // 좌우 공백 제거
  if (s == '' || isNaN(s)) return false;
  return true;
}



$(function() {

	$(".m_black_right").click(function(){
		$(".left_quick_menu").hide();
	});

});

</script>

<script>
function documentWidthControl()
{
	
	//학생
	var openStdCookie = getCookie("left_student_moreOpenCookie");
	var conUrl = document.getElementById('contentsFrame').contentWindow.location.href;
	
	if (conUrl.indexOf("/member/student.asp") > -1 || conUrl.indexOf("/member/student_write.asp") > -1 || conUrl.indexOf("/franchise/academy.asp") > -1)
	{
		if (openStdCookie == "YES")
		{
			if ($(document).width() < 1550)
			{
				document.getElementById('header').style.width = "1580px"; //1360
				document.getElementById('contentsFrame').style.width = "1000px";
			}
		}
	} 
	else 
	{
		document.getElementById('header').style.width = $(window).width()+'px';
		//document.getElementById('header').style.width = "100%"; //1360
		document.getElementById('contentsFrame').style.width = "100%";

	}


	//가맹점관리
	openStdCookie = getCookie("left_franAca_moreOpenCookie");
	conUrl = document.getElementById('contentsFrame').contentWindow.location.href;
	
	if (conUrl.indexOf("/member/student.asp") > -1 || conUrl.indexOf("/member/student_write.asp") > -1 || conUrl.indexOf("/franchise/academy.asp") > -1)
	{
		if (openStdCookie == "YES")
		{
			if ($(document).width() < 1550)
			{
				document.getElementById('header').style.width = "1580px"; //1360
				document.getElementById('contentsFrame').style.width = "1000px";
			}
		}
	} 
	else 
	{
		document.getElementById('header').style.width = $(window).width()+'px';
		//document.getElementById('header').style.width = "100%"; //1360
		document.getElementById('contentsFrame').style.width = "100%";

	}

	// free 사용제한 레이어 창 띄움
	
}

$(document).ready(function(){	
	setInterval("documentWidthControl()", 300); 
});
</script>

</head>

<body style="zoom: 1;">
<div style="width:100%;">
	<!-- 무료 제한기능 오버랩 -->
	<div class="overwrap" id="freeLimitLayer" style="display:none">
		<div class="overwrap_txt">
			무료로 이용하는 학원에는 제한된 기능입니다.<br>
			<span>유료이용</span>으로 전환하시면 원활하게 사용할 수 있습니다.
			
			<div class="lsc_link">
				<a href="/LMS/?goParam=academy,1,V,systemPay.asp,leftMenu.asp">유료 전환하기</a>
			</div>
		</div>
	</div>
	<!-- // 무료 제한기능 오버랩 -->
	<div>
		
	<style>
	@import url(https://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	.bodyLock{height:100%; overflow:hidden;}

	/*#easyStart{width:100%; height:100%; background:url(/images/easy/bg_easy.jpg) no-repeat 50% 50%; }*/
	#easyStart{width:100%; height:100%; position:fixed; z-index:10000; left:0; top:0; background:rgba(0,0,0,0.7);}

	#easyStart .softboxLogo{position:absolute; left:30px; top:30px;}

	#easyStart .ipadair{background:url(/images/easy/img_ipadair.png) no-repeat; position:absolute; left:50%; top:50%; width:889px; height:635px; margin-left:-444px; margin-top:-317px;}
	#easyStart .ipadair h1{font-family: 'Nanum Gothic', sans-serif; font-weight:100; margin:0; width:100%; display:block; text-align:center; font-size:40px; padding-top:120px;}

	#easyStart .ipadair .login{position:relative; width:100%; margin-top:70px;}
	#easyStart .ipadair .login table{margin:0 auto;}
	#easyStart .ipadair .login table td{padding:5px; position:relative;}
	#easyStart .ipadair .login table input.id{width:260px; height:44px; border:0; border-bottom:1px solid #000; background:transparent; outline:none; box-sizing:border-box; padding:10px 20px; font-family: 'Nanum Gothic', sans-serif; font-size:18px; color:#000; position:relative; z-index:2;}
	#easyStart .ipadair .login table div.id{position:absolute; z-index:1; left:5px; top:5px; padding:15px 20px;}
	#easyStart .ipadair .login table input.pass{width:260px; height:44px; border:0; border-bottom:1px solid #000; background:transparent; outline:none; box-sizing:border-box; padding:10px 20px; font-size:18px; color:#000; position:relative; z-index:2;}
	#easyStart .ipadair .login table div.pass{position:absolute; z-index:1; left:5px; top:5px; padding:15px 20px;}
	#easyStart .ipadair .login table .loginsubmit{width:260px; height:49px; border:1px solid #000; border-radius:5px; background:#fff; outline:none; box-sizing:border-box; margin-top:20px;

	transition-delay: 0s;
	transition-duration: 0.3s;
	transition-property: all;
	transition-timing-function: ease;
		
	-moz-transition-delay: 0s;
	-moz-transition-duration: 0.3s;
	-moz-transition-property: all;
	-moz-transition-timing-function: ease;
		
	-webkit-transition-delay: 0s;
	-webkit-transition-duration: 0.3s;
	-webkit-transition-property: all;
	-webkit-transition-timing-function: ease;

	}
	#easyStart .ipadair .login table .loginsubmit:hover{background:#eaeaea;}

	#easyStart .ipadair .lostIdPass{position:absolute; bottom:60px; width:100%;}
	#easyStart .ipadair .lostIdPass .join{position:absolute; bottom:0; left:100px; border:0; background:transparent; outline:none;}
	#easyStart .ipadair .lostIdPass .idpass{position:absolute; bottom:0; right:100px; border:0; background:transparent; outline:none;}

	#easyStart .gotoSite{position:absolute; right:30px; bottom:30px;}
	#easyStart .gotoSite button{border:0; background:transparent; outline:none;}


	/*
	#SBbgcolor{width:100%; height:100%; position:fixed; z-index:100000; left:0; top:0; background:rgba(0,0,0,0.7);}

	#startBox{background:#fff; border:2px solid #000; box-shadow:rgba(0,0,0,0.5) 0 0 20px; width:1100px; height:680px; position:fixed; left:50%; top:50%; margin-left:-550px; margin-top:-340px;  z-index:100001;}
	*/

	#SBbgcolor{width:100%; height:100%; position:fixed; z-index:10001; left:0; top:0; background:rgba(0,0,0,0.7); display:none; }
	#startBox{background:#fff; border:2px solid #000; /*box-shadow:rgba(0,0,0,0.5) 0 0 20px;*/ width:1100px; height:680px; position:fixed; left:50%; bottom:-680px; margin-left:-550px; margin-bottom:0;  z-index:10002; box-sizing:border-box;}

	#startBox *{box-sizing:border-box;}

	#startBox .callMenu{position:absolute; right:50px; top:-32px; background:url(/images/easy/btn_callmenuW.png) no-repeat; width:91px; height:32px; cursor:pointer;}

	#startBox .topArea{width:100%; height:100px; position:relative;}
	#startBox .topArea .logo{height:100px; line-height:100px; vertical-align:middle; padding-left:30px; box-sizing:border-box;}
	#startBox .topArea .logo img{max-height:50px;}
	#startBox .topArea .logo .textLogo{font-family:"맑은 고딕"; font-size:18px; letter-spacing:-1px; color:#000; font-weight:bold; background: url(/images/logo_icon.png) no-repeat 0 50%; padding-left:40px; width:340px; height:31px; line-height:31px; vertical-align:middle; cursor:pointer; overflow:hidden; box-sizing:border-box; position:absolute; top:35px;}
	
	#startBox .topArea .btns{position:absolute; right:30px; top:50%; margin-top:-27px;}
	#startBox .topArea .btns button.type01{background:#fad050; border:1px solid #e5e5e5; height:55px; padding:0 20px; outline:none;}
	#startBox .topArea .btns button.type02{background:#f3f3f3; border:0; height:55px; padding:0 20px; outline:none;}

	#startBox .contentArea{background:#fad050; width:100%; height:576px; position:relative;}

	#startBox .contentArea .loginBox h1{font-family: 'Nanum Gothic', sans-serif; font-weight:100; margin:0; width:100%; display:block; text-align:center; font-size:40px; padding-top:90px;}

	#startBox .contentArea .loginBox .login{position:relative; width:100%; margin-top:70px;}
	#startBox .contentArea .loginBox .login table{margin:0 auto;}
	#startBox .contentArea .loginBox .login table td{padding:5px; position:relative;}
	#startBox .contentArea .loginBox .login table input.id{width:260px; height:44px; border:0; border-bottom:1px solid #000; background:transparent; outline:none; box-sizing:border-box; padding:10px 20px; font-family: 'Nanum Gothic', sans-serif; font-size:18px; color:#000; position:relative; z-index:2;}
	#startBox .contentArea .loginBox .login table div.id{position:absolute; z-index:1; left:5px; top:5px; padding:15px 20px;}
	#startBox .contentArea .loginBox .login table input.pass{width:260px; height:44px; border:0; border-bottom:1px solid #000; background:transparent; outline:none; box-sizing:border-box; padding:10px 20px; font-size:18px; color:#000; position:relative; z-index:2;}
	#startBox .contentArea .loginBox .login table div.pass{position:absolute; z-index:1; left:5px; top:5px; padding:15px 20px;}
	#startBox .contentArea .loginBox .login table .loginsubmit{width:260px; height:49px; border:1px solid #000; border-radius:5px; background:#fff; outline:none; box-sizing:border-box; margin-top:20px;

	transition-delay: 0s;
	transition-duration: 0.3s;
	transition-property: all;
	transition-timing-function: ease;
		
	-moz-transition-delay: 0s;
	-moz-transition-duration: 0.3s;
	-moz-transition-property: all;
	-moz-transition-timing-function: ease;
		
	-webkit-transition-delay: 0s;
	-webkit-transition-duration: 0.3s;
	-webkit-transition-property: all;
	-webkit-transition-timing-function: ease;

	}
	#startBox .contentArea .loginBox .login table .loginsubmit:hover{background:#eaeaea;}

	#startBox .contentArea .loginBox .lostIdPass{position:relative; width:260px; margin:0 auto; margin-top:30px;}
	#startBox .contentArea .loginBox .lostIdPass .join{position:absolute; bottom:0; left:0; border:0; background:transparent; outline:none;}
	#startBox .contentArea .loginBox .lostIdPass .idpass{position:absolute; bottom:0; right:0; border:0; background:transparent; outline:none;}

	#startBox .contentArea table.topTable{width:100%;}
	#startBox .contentArea table.topTable td{width:33%; position:relative; padding:25px; padding-bottom:20px;}
	#startBox .contentArea table.topTable td h2{margin:0; padding-top:10px; padding-bottom:30px;}
	#startBox .contentArea table.topTable td div{position:relative; overflow:hidden;

	transition-delay: 0s;
	transition-duration: 0.3s;
	transition-property: all;
	transition-timing-function: ease;
		
	-moz-transition-delay: 0s;
	-moz-transition-duration: 0.3s;
	-moz-transition-property: all;
	-moz-transition-timing-function: ease;
		
	-webkit-transition-delay: 0s;
	-webkit-transition-duration: 0.3s;
	-webkit-transition-property: all;
	-webkit-transition-timing-function: ease;

	}
	#startBox .contentArea table.topTable td div button.search{background:transparent; border:0; position:absolute; right:20px; top:50%; margin-top:-24px; outline:none;}
	#startBox .contentArea table.topTable td div.addStaff{width:310px; height:100px; background:#fff; cursor:pointer;}
	#startBox .contentArea table.topTable td div.addStaff span{display:block; font-family: 'Nanum Gothic', sans-serif; font-size:14px; color:#3c3c3c; position:absolute; bottom:20px; left:20px;}
	#startBox .contentArea table.topTable td div.addStaff:hover{background:#37404d;}
	#startBox .contentArea table.topTable td div.addStaff:hover span{color:#fff;}

	#startBox .contentArea table.topTable td div.addStudent{width:310px; height:160px; background:#10acdd; margin-top:12px; cursor:pointer;}
	#startBox .contentArea table.topTable td div.addStudent span{display:block; font-family: 'Nanum Gothic', sans-serif; font-size:14px; color:#fff; position:absolute; bottom:20px; left:20px;}
	#startBox .contentArea table.topTable td div.addStudent .stdicon{background:url(/images/easy/icon_student.png) no-repeat; background-size:cover; width:143px; height:227px; top:20px; left:50%; margin-left:-71px;}
	#startBox .contentArea table.topTable td div.addStudent:hover .stdicon{transform:scale(1.1,1.1);}

	#startBox .contentArea table.topTable td div.iconBox{}
	#startBox .contentArea table.topTable td div.iconBox table{width:100%; height:272px;}
	#startBox .contentArea table.topTable td div.iconBox table td{width:50%; height:50%; box-sizing:border-box; background:#fff; position:relative; cursor:pointer;

	transition-delay: 0s;
	transition-duration: 0.3s;
	transition-property: all;
	transition-timing-function: ease;
		
	-moz-transition-delay: 0s;
	-moz-transition-duration: 0.3s;
	-moz-transition-property: all;
	-moz-transition-timing-function: ease;
		
	-webkit-transition-delay: 0s;
	-webkit-transition-duration: 0.3s;
	-webkit-transition-property: all;
	-webkit-transition-timing-function: ease;

	}

	#startBox .contentArea table.topTable td div.iconBox table td:hover{background:#f1f1f1;}
	#startBox .contentArea table.topTable td div.iconBox table td:hover .icons{transform:scale(1.1,1.1);}

	#startBox .contentArea table.topTable td div.iconBox table td span{font-family: 'Nanum Gothic', sans-serif; font-size:14px; display:block; position:absolute; bottom:25px; left:0; width:100%; text-align:center;}

	#startBox .contentArea table.topTable td div.iconBox table td.mkclass{border-bottom:1px solid #e5e5e5; border-right:1px solid #e5e5e5;}
	#startBox .contentArea table.topTable td div.iconBox table td.mkclass .icons{width:80px; height:56px; position:absolute; top:25px; left:50%; margin-left:-40px; background:url(/images/easy/icon_addclass.png) no-repeat; background-size:cover;}

	#startBox .contentArea table.topTable td div.iconBox table td.viewclass{border-bottom:1px solid #e5e5e5;}
	#startBox .contentArea table.topTable td div.iconBox table td.viewclass .icons{width:82px; height:55px; position:absolute; top:25px; left:50%; margin-left:-41px; background:url(/images/easy/icon_viewclass.png) no-repeat; background-size:cover;}

	#startBox .contentArea table.topTable td div.iconBox table td.hwadd{border-right:1px solid #e5e5e5;}
	#startBox .contentArea table.topTable td div.iconBox table td.hwadd .icons{width:69px; height:53px; position:absolute; top:25px; left:50%; margin-left:-34px; background:url(/images/easy/icon_exporthw.png) no-repeat; background-size:cover;}

	#startBox .contentArea table.topTable td div.iconBox table td.hwview .icons{width:74px; height:54px; position:absolute; top:25px; left:50%; margin-left:-37px; background:url(/images/easy/icon_chkhw.png) no-repeat; background-size:cover;}

	#startBox .contentArea table.topTable td div.elearning{width:100%; height:100px; background:url(/images/easy/icon_elearning.png) no-repeat 20px 50%, #fff url(/images/easy/tit_elearning.png) no-repeat 100px 20px;}
	#startBox .contentArea table.topTable td div.elearning .btns{position:absolute; left:100px; top:60px;}
	#startBox .contentArea table.topTable td div.elearning .btns .preview{border:0; background:#939393; font-family: 'Nanum Gothic', sans-serif; color:#fff; font-size:12px; padding:5px 7px; outline:none;}
	#startBox .contentArea table.topTable td div.elearning .btns .allview{border:0; background:#f4801f; font-family: 'Nanum Gothic', sans-serif; color:#fff; font-size:12px; padding:5px 7px; outline:none;}
	#startBox .contentArea table.topTable td div.elearning .makecon{position:absolute; right:10px; top:50%; margin-top:-34px; border:0; background:transparent; outline:none;

	transition-delay: 0s;
	transition-duration: 0.3s;
	transition-property: all;
	transition-timing-function: ease;
		
	-moz-transition-delay: 0s;
	-moz-transition-duration: 0.3s;
	-moz-transition-property: all;
	-moz-transition-timing-function: ease;
		
	-webkit-transition-delay: 0s;
	-webkit-transition-duration: 0.3s;
	-webkit-transition-property: all;
	-webkit-transition-timing-function: ease;

	}

	#startBox .contentArea table.topTable td div.elearning .makecon:hover{transform:rotate(10deg);}


	#startBox .contentArea table.topTable td div.omc{width:100%; height:160px; background:#fff; margin-top:12px; box-sizing:border-box; padding:25px; cursor:pointer; position:relative;}
	#startBox .contentArea table.topTable td div.omc .icons{position:absolute; right:10px; bottom:10px;} 
	#startBox .contentArea table.topTable td div.omc .moreview{border:0; background:#fff; outline:none; margin-top:30px;}

	#startBox .contentArea table.quickmenu{width:100%;}
	#startBox .contentArea table.quickmenu .title{height:30px; padding-left:25px;}
	#startBox .contentArea table.quickmenu .menu{padding-left:25px; padding-top:10px;}
	#startBox .contentArea table.quickmenu .menu div{width:168px; height:100px; background:#fff; float:left; margin-right:2px; cursor:pointer;

	transition-delay: 0s;
	transition-duration: 0.3s;
	transition-property: all;
	transition-timing-function: ease;
		
	-moz-transition-delay: 0s;
	-moz-transition-duration: 0.3s;
	-moz-transition-property: all;
	-moz-transition-timing-function: ease;
		
	-webkit-transition-delay: 0s;
	-webkit-transition-duration: 0.3s;
	-webkit-transition-property: all;
	-webkit-transition-timing-function: ease;

	}

	#startBox .contentArea table.quickmenu .menu div.sandSms{background:#fff url(/images/easy/btn_sendsms.png) no-repeat 50% 50%;}
	#startBox .contentArea table.quickmenu .menu div.sandSms:hover{background:#f1f1f1 url(/images/easy/btn_sendsms.png) no-repeat 50% 50%;}
	#startBox .contentArea table.quickmenu .menu div.homeDg{background:#fff url(/images/easy/btn_homeint.png) no-repeat 50% 50%;}
	#startBox .contentArea table.quickmenu .menu div.homeDg:hover{background:#f1f1f1 url(/images/easy/btn_homeint.png) no-repeat 50% 50%;}
	#startBox .contentArea table.quickmenu .menu div.exmem{width:169px; background:#fff url(/images/easy/btn_extmen.png) no-repeat 50% 50%;}
	#startBox .contentArea table.quickmenu .menu div.exmem:hover{width:169px; background:#f1f1f1 url(/images/easy/btn_extmen.png) no-repeat 50% 50%;}
	#startBox .contentArea table.quickmenu .menu div.usmen{width:169px; background:#fff url(/images/easy/btn_viewmenual.png) no-repeat 50% 50%;}
	#startBox .contentArea table.quickmenu .menu div.usmen:hover{width:169px; background:#f1f1f1 url(/images/easy/btn_viewmenual.png) no-repeat 50% 50%;}

	#startBox .contentArea table.quickmenu .ad{position:relative;}
	#startBox .contentArea table.quickmenu .ad .downloadApp{width:316px; height:100px; background:#fff url(/images/easy/btn_googleapp.png) no-repeat 50% 50%; cursor:pointer; position:absolute; right:25px; top:10px;

	transition-delay: 0s;
	transition-duration: 0.3s;
	transition-property: all;
	transition-timing-function: ease;
		
	-moz-transition-delay: 0s;
	-moz-transition-duration: 0.3s;
	-moz-transition-property: all;
	-moz-transition-timing-function: ease;
		
	-webkit-transition-delay: 0s;
	-webkit-transition-duration: 0.3s;
	-webkit-transition-property: all;
	-webkit-transition-timing-function: ease;

	}
	#startBox .contentArea table.quickmenu .ad .downloadApp:hover{background:#f1f1f1 url(/images/easy/btn_googleapp.png) no-repeat 50% 50%;}
	#startBox .contentArea table.quickmenu .ad .gohtu{border:0; background:#939393; font-family: 'Nanum Gothic', sans-serif; color:#fff; font-size:12px; padding:5px 7px; outline:none; position:absolute; bottom:20px; right:150px; width:80px;}

	#easyStart .copyright{position:absolute; left:0; bottom:45px; width:100%; text-align:center; font-family: 'Nanum Gothic', sans-serif; color:#464339;}
	</style>

	<script>
	var isquickmenu = "off";
	$(function(){
		$("#startBox input.id").focus(function(e) {
			$("div.id").fadeOut();
		});
		$("#startBox input.pass").focus(function(e) {
			$("div.pass").fadeOut();
		});
		
		$("#startBox input.id").focusout(function(e) {
			checkloginText();
		});
		$("#startBox input.pass").focusout(function(e) {
			checkloginText();
		});
		
		checkloginText();
		
			if (getCookie("jsQuickMenu")== "") {
				callquickmenu("on"); //시작시 보여주게하기
				setCookie('jsQuickMenu', 'true', -1)
				isquickmenu = "on";
			}
		
	});

	function checkloginText(){
		var idval = $("#startBox input.id").val();
		var pwval = $("#startBox input.pass").val();
		if(idval!=""){
			$("#startBox div.id").fadeOut(0);
		}else{
			$("#startBox div.id").fadeIn();
		}
		if(pwval!=""){
			$("#startBox div.pass").fadeOut(0);
		}else{
			$("#startBox div.pass").fadeIn();
		}
	}

	function callquickmenu(opt){
		var thisLeft = $("#startBox").css("margin-bottom");
		//alert(thisLeft);
		/*
		if(opt=="on" && thisLeft=="0px"){
			$("#startBox").animate({
				left:'50%',
				marginLeft:'-550px'
			},800,'easeOutExpo');
			$("#SBbgcolor").fadeIn(800);
			$("html,body").addClass("bodyLock");
		}else if(opt=="off" && thisLeft=="-550px"){
			$("#startBox").animate({
				left:'-1100px',
				marginLeft:'0'
			},800,'easeOutExpo');
			$("#SBbgcolor").fadeOut(800);
			$("html,body").removeClass("bodyLock");
		}
		*/
		if(opt=="on" && thisLeft=="0px"){
			$("#startBox").animate({
				bottom:'50%',
				marginBottom:'-340px'
			},800,'easeOutExpo');
			$("#SBbgcolor").fadeIn(800);
			$("html,body").addClass("bodyLock");
		}else if(opt=="off" && thisLeft=="-340px"){
			$("#startBox").animate({
				bottom:'-680px',
				marginBottom:'0'
			},800,'easeOutExpo');
			$("#SBbgcolor").fadeOut(800);
			$("html,body").removeClass("bodyLock");
		}

		isquickmenu = opt;
	}
	</script>

	<div id="SBbgcolor"></div>
	


<script>
function callquest(opt){
	var thisLeft = $(".question").css("margin-bottom");
	if(opt=="on" && thisLeft=="0px"){
		$(".question").animate({
			bottom:'50%',
			marginBottom:'-340px'
		},800,'easeOutExpo');
	}else if(opt=="off" && thisLeft=="-340px"){
		$(".question").animate({
			bottom:'-680px',
			marginBottom:'0'
		},800,'easeOutExpo');
	}
}

function getHelpData(no1, no2, title) {
	$("#helpSubject").empty();
	$("#helpContents").empty();
	$.ajax({
		type: 'POST',
		url: '/LMS/include/_ajax/getHelpData.asp',
		async: false,
		data: { "boardNo": no1, "idx": no2},
		cache: false,
		success: function (result) {
			if (result == 'ERROR') {
				alert("오류입니다. 다시 시도하세요!");
				return;
			} else {
				var arr = result.split('^||^');
				if (arr[0].length > 0)
					title = arr[0];
				$("#helpSubject").html(title);
				if (no2 == "9153,9154" && HTTP_USER_AGENT()['browser'] == "Chrome" && HTTP_USER_AGENT()['os'] == "Windows XP")
					$("#helpContents").html("<a href='https://toclass.smartschool.kr/help/center/view.asp?boardNo=19782&idx=10271' target='_blank'>과제등록</a>");
				else
					$("#helpContents").html(arr[1]);
			}
		},
		error: function (result) {
			alert("오류입니다. 다시 시도 해 주세요.");
			return;
		}
	});
}
</script>
<style>
@import url(https://fonts.googleapis.com/earlyaccess/nanumgothic.css);
.bodyLock{height:100%; overflow:hidden;}
.question{background:#fff; border:2px solid #4d80d3; /*box-shadow:rgba(0,0,0,0.5) 0 0 20px;*/ width:800px; height:680px; position:fixed; left:50%; bottom:-680px; margin-left:-400px; margin-bottom:0; z-index:9999; box-sizing:border-box;}
.question *{box-sizing:border-box;}
.question .openBtn{position:absolute; right:-2px; top:-60px; background:url(/lms/images/btn_question.gif) no-repeat; width:81px; height:60px; cursor:pointer;}
.question .questionBox{width:100%; height:100%;}
.question .questionBox h1{margin:0; padding:20px; font-family: 'Nanum Gothic', sans-serif; background:#6695e1; color:#fff; font-weight:100; font-size:20px; position:relative;}
.question .questionBox h1 .exitBtn{background:url(/images/btn_exitPopup.png) no-repeat; width:27px; height:27px; position:absolute; right:15px; top:15px; cursor:pointer;}
.question .questionBox .questionCon{background:#fff; width:100%; height:613px; padding:10px; overflow-y:scroll;}
</style>

		<div id="popup">
			<div class="header">
				<div class="title"><span class="mtitle">&nbsp;</span><span class="subtitle">&nbsp;</span></div>
				<div class="close" onclick="exitdiv();"></div>    
			</div>
			<div class="focusoutHD" id="focusoutHD"></div>
			<iframe src="" frameborder="0" marginheight="0" marginwidth="0" id="popup_iframe" name="popup_iframe"></iframe>
		</div>
		<div id="focusout"></div>

		<div id="contents" class="pl60" style="padding-left: 0px;">
			<iframe marginheight="0" marginwidth="0" frameborder="0" src="/LMS/education/stdAttendCheck.asp?act=V&amp;undefined" name="contentsFrame" id="contentsFrame" style="width: 100%;"></iframe>
		</div>

	</div>
</div>


<div role="log" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></div></body>
</html>
