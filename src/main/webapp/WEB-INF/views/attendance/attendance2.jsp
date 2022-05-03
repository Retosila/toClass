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
img.ui-datepicker-trigger {
	cursor: pointer;
}

html, body {
	height: 100%;
}

.frameInner table td:last-child {
	border-right: none;
}

.frameInner table td:first-child {
	border-left: none;
}

.frameInner table th:last-child {
	border-right: none;
}

.frameInner table th:first-child {
	border-left: none;
}

.studySearch {
	padding-bottom: 10px;
	max-width: 946px;
	text-align: center;
}

.studySearch select {
	border: 1px solid #cccccc;
	background: #fff;
	box-sizing: border-box;
	padding: 3px;
	font-size: 11px;
	font-family: "돋움";
	vertical-align: top;
}

.studySearch input[type=text] {
	margin-left: 20px;
	border: 1px solid #fff;
	background: #fff;
	box-sizing: border-box;
	padding: 4px;
	font-size: 12px;
	font-family: "돋움";
	vertical-align: top;
}

studySearch span {
	display: inline-block;
}

.studySearch .hak1_left {
	float: left;
	padding: 10px 10px 3px 10px;
	border: 1px solid #e6e6e6;
	background: #fbfbfb;
	width: 100%;
	box-sizing: border-box;
}

.studySearch .hak1_right {
	float: left;
	padding: 10px 10px 3px 10px;
	border: 1px solid #e6e6e6;
	background: #fbfbfb;
}

.studySearch .hak1 {
	position: relative;
	float: left;
	line-height: 24px;
	margin-right: 15px;
}

.hak1_input {
	width: 173px !important;
	height: 24px;
	border: 1px solid #ccc !important;
	margin-left: 0px !important;
}

.hak1_button {
	width: 39px;
	height: 24px;
	background: url(http://toclass.smartschool.kr/LMS/images/sc_btn.jpg) no-repeat 0 0;
	border: 0px;
	color: #fff;
}

.std_00 {
	float: left;
	margin-right: 5px;
}

.attendStatus {
	width: 100%;
	height: 48px;
	padding-top: 14px;
	clear: left;
}

.attendStatus .asResult {
	margin-top: 10px;
}

.attendStatus .asResult li {
	float: left;
	margin-right: 20px;
	font-size: 14px;
}

.fcBlue {
	color: #0078ff;
}

.fcOrange {
	color: #ff5a00;
}

.fcRed {
	color: #ff0042;
}

.asMms {
	float: left;
	margin-left: 20px;
}

.theDate_sp {
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	padding: 2px 10px 0px 10px;
	float: left;
}

.btnSet_center select {
	border: 1px solid #cccccc;
	background: #fff;
	box-sizing: border-box;
	padding: 5px;
	font-size: 11px;
	font-family: "돋움";
}

.stdcheck td, th {
	padding: 7px !important;
}

.stdcheck {
	max-width: 1186px;
}

.whTable02 th, .whTable02 td {
	position: relative;
}

.whTable02 th div button {
	border: 1px solid #ccc;
	background: #fff;
	color: #797979;
	font-size: 11px;
	font-family: "돋움";
	padding: 4px 5px;
	margin: 0px;
}

.whTable02 td div button {
	border: 1px solid #ccc;
	background: #fff;
	color: #797979;
	font-size: 11px;
	font-family: "돋움";
	padding: 4px 5px;
}

.whTable02 td div .std01 {
	background: #2190ee;
	color: #fff;
}

.whTable02 td div .std02 {
	background: #ee7321;
	color: #fff;
}

.whTable02 td div .std04 {
	background: #dc1e1e;
	color: #fff;
}

.whTable02 td div .std11 {
	background: #7cb517;
	color: #fff;
}

.whTable02 td div .std03 {
	background: #b517b3;
	color: #fff;
}

.whTable02 td div .std10 {
	background: #b51717;
	color: #fff;
}

.regist_assi {
	padding: 0 20px;
	padding-bottom: 3px;
	border: none;
	background: url(/LMS/images/btn_typeB6_1.png) no-repeat 0 0,
		url(/LMS/images/btn_typeB6_3.png) no-repeat 100% 0,
		url(/LMS/images/btn_typeB6_2.png) repeat-x;
	color: #fff;
	font-size: 12px;
	text-shadow: 0 0 2px #000;
	letter-spacing: -0.5px;
	box-sizing: border-box;
	text-align: center;
	position: absolute;
	right: 0px;
	top: -35px;
	cursor: pointer;
	height: 30px;
}

.btn_group {
	display: table;
	border-radius: 3px;
	overflow: hidden;
	position: absolute;
	bottom: 5px;
	left: 10px;
	border: 1px solid #cdcdcd;
	line-height: normal;
}

.btn_group button:nth-of-type(1) {
	border: none;
}

.btn_group button:nth-of-type(2) {
	border-color: #cdcdcd;
	border-top: none;
	border-bottom: none;
}

.btn_group button:nth-of-type(3) {
	border: none;
}

.btn_group button, .btn_group_1 button {
	float: left;
}

.btn_group_1 {
	display: table;
	border-radius: 3px;
	overflow: hidden;
	margin-bottom: 13px;
	border: 1px solid #cdcdcd;
}

.btn_group_1 button:nth-of-type(1) {
	border: none;
}

.btn_group_1 button:nth-of-type(2) {
	border-color: #cdcdcd;
	border-top: none;
	border-bottom: none;
}

.btn_group_1 button:nth-of-type(3) {
	border: none;
}

.btn_group_bg {
	background-color: #f7f7f7;
	position: absolute;
	height: 37px;
	left: 0px;
	top: 15px;
	width: 100%;
	padding-top: 7px;
	box-sizing: border-box;
}

.btn_group_bg input {
	box-sizing: border-box;
	width: 43px;
	height: 20px;
}

#btn01_all.std01 {
	background: #2190ee;
	color: #fff;
}

#btn02_all.std02 {
	background: #ee7321;
	color: #fff;
}

#btn04_all.std04 {
	background: #dc1e1e;
	color: #fff;
}

#btn11_all.std11 {
	background: #7cb517;
	color: #fff;
}

#btn03_all.std03 {
	background: #b517b3;
	color: #fff;
}

#btn10_all.std10 {
	background: #b51717;
	color: #fff;
}

.whTable02 tr .attendance {
	vertical-align: text-top;
	line-height: 70px;
}

.atten_text textarea {
	font-size: 12px;
}

.cal_01 {
	position: absolute;
	left: 10px;
	bottom: 3px;
}

.cal_01 img {
	cursor: pointer;
}

.cal_01 #calendar_01 {
	width: 77px;
	height: 22px;
}

.memo_btn {
	cursor: pointer;
	font-size: 11px;
	color: #348cee;
	border: 1px solid #91bcf3;
	position: absolute;
	padding: 3px 7px;
	bottom: 19px;
	left: 4px;
	line-height: normal;
	z-index: 10;
}

.memo_btn:hover {
	background-color: #ffffff;
}

.memo_area {
	width: 214px;
	background-color: #fff6c8;
	position: absolute;
	left: -1px;
	top: 61px;
	z-index: 9;
	padding: 25px 6px 3px 6px;
	box-sizing: border-box;
	border: 1px solid #aaa;
	line-height: normal;
	transition: 0.2s;
}

.memo_area textarea {
	height: 100%;
	background-color: transparent;
	border: none;
	overflow: auto;
	font-size: 12px;
}

.memo_cls {
	width: 100%;
	position: absolute;
	bottom: -18px;
	left: 0px;
	text-align: center;
	color: #cebd6f;
	font-size: 12px;
	padding-top: 2px;
	padding-bottom: 2px;
	cursor: pointer;
	border-top: 1px solid #cebd6f;
	line-height: normal;
	box-shadow: 0px 1px 2px #666666;
	background-color: #fff6c8;
}

#pop_calendar {
	padding: 10px;
	padding-top: 5px;
	width: 240px;
	border: 1px solid #ccc;
	background: #fff;
	position: absolute;
	top: 105px;
	left: 412px;
	display: none;
	z-index: 100;
}

.popCalExit {
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 1;
	cursor: pointer;
}

button.white_sm {
	border: 1px solid #b4b4b4;
	height: 18px;
	border-radius: 5px;
	background: #fff;
	font-size: 11px;
	font-family: "돋움";
	padding: 0 5px;
}

.callCal {
	cursor: pointer;
	float: left;
}

.popUpCal {
	width: 240px;
	height: 270px;
}

.overwrap {
	width: 426px;
	height: 100%;
	position: absolute;
	top: 0px;
	right: 0px;
	background-color: rgba(80, 80, 80, 0.5);
	z-index: 20;
	box-sizing: border-box;
	padding: 47px 20px 20px 20px;
}

.overwrap .overwrap_txt {
	width: 100%;
	padding: 15px;
	color: #fff;
	text-align: center;
	line-height: 20px;
	background-color: rgba(80, 80, 80, 0.7);
	position: relative;
	box-sizing: border-box;
	border-radius: 10px;
}

.overwrap .overwrap_txt span {
	color: #3F9;
}

.overwrap .overwrap_txt .lsc_link {
	width: 103px;
	background-color: #FFF;
	border-radius: 4px;
	text-align: center;
	margin: 15px auto 0px auto;
}

.overwrap .overwrap_txt .lsc_link a {
	display: block;
	padding: 5px 0px 5px 0px;
	color: #090;
	text-decoration: none;
	font-weight: bold;
}

.overwrap .overwrap_txt .lsc_link a:hover {
	color: #69F;
}

/* 2012.02.27_출석부 /mypage/staff/attendbookWrite.asp*/
#class_c {
	position: absolute;
	z-index: 9999;
	top: 118px;
	left: 507px;
}

#class_c fieldset {
	width: 350px;
	height: 100px;
	padding: 20px;
	background: #fff;
	border: 2px solid #1068d6;
}

#class_c #month_choice {
	width: 70px;
}

#class_c #sheetClassNo {
	float: left;
	width: 150px;
}

#class_c p {
	clear: both;
	line-height: 20px;
}

#class_c .first {
	padding-bottom: 10px;
}

#class_c .first span {
	padding-right: 10px;
}

#class_c .first span input {
	margin: -3px 5px 0 0;
	vertical-align: middle;
}

#class_c p img {
	float: left;
	padding-right: 10px;
}

#class_c a {
	float: right;
	display: inline-block;
	padding-left: 7px;
}

#class_c .close {
	position: absolute;
	top: 5px;
	right: 0;
}

.btnSet_center{
	width:100%;
	padding:20px 0;
	text-align:center
}

.whTable02 th{
	height:27px;
	padding:10px 10px 10px 10px;border-top:1px solid #bfbfbf;
	border-right:1px solid #dcdcdc;
	border-bottom:1px solid #bfbfbf;
	background:linear-gradient(#fdfdfd, #f3f3f3);
	color:#777777;
	font-size:11px;
	font-weight:normal;
	vertical-align:middle;
}

.whTable02 th:first-child {
    border-left: 1px solid #bfbfbf;
}

.whTable02 td:first-child{
	border-left:1px solid #bfbfbf
}

.whTable02 tr:last-child td {
    border-bottom: 1px solid #bfbfbf;
}

.whTable02 th, .whTable02 td {
    position: relative;
}




<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.whTable02 td {
    padding: 10px 10px 10px 10px;
    border-right: 1px solid #e6e7e9;
    border-bottom: 1px solid #e6e7e9;
    background: #fff;
    color: #333333;
    vertical-align: middle;
    box-sizing: inherit;
}

button.wBtn03 {
    height: 36px;
    padding: 0 20px;
    padding-bottom: 3px;
    border: none;
    background: url(/LMS/images/btn_typeW3_1.png) no-repeat 0 0, url(/LMS/images/btn_typeW3_3.png) no-repeat 100% 0, url(/LMS/images/btn_typeW3_2.png) repeat-x;
    color: #878789;
    font-size: 12px;
    letter-spacing: -0.5px;
    box-sizing: border-box;
}

button.bBtn06 {
    height: 36px;
    padding: 0 20px;
    padding-bottom: 3px;
    border: none;
    background: url(/LMS/images/btn_typeB6_1.png) no-repeat 0 0, url(/LMS/images/btn_typeB6_3.png) no-repeat 100% 0, url(/LMS/images/btn_typeB6_2.png) repeat-x;
    color: #fff;
    font-size: 12px;
    text-shadow: 0 0 2px #000;
    letter-spacing: -0.5px;
    box-sizing: border-box;
}

</style>

<script>
$(function(){
	$(".callCal").click(function(e) {
        $("#pop_calendar").fadeIn();
    });
	$(".popCalExit").click(function(e) {
        $("#pop_calendar").fadeOut();
    });
});

$(function() {
	$("#allChk").click(function() {
		if($("#allChk").prop("checked")) {
			//$("input[name=parSmsSendChk]").prop("checked", true);
			for (var i = 0; i < document.getElementsByName("parSmsSendChk").length; i++) {
				var ele = document.getElementsByName("parSmsSendChk")[i];
				if (ele.checked == false && ele.disabled == false) {
					ele.checked = true;
				}                 
			}
		} else {
			//$("input[name=parSmsSendChk]").prop("checked", false);
			for (var i = 0; i < document.getElementsByName("parSmsSendChk").length; i++) {
				var ele = document.getElementsByName("parSmsSendChk")[i];
				if (ele.checked == true && ele.disabled == false) {
					ele.checked = false;
				}                 
			}
		}
	});
});

function oneCheck(obj) {
    var result = false;
    if (obj.checked == true) {
		var studentCnt = document.getElementsByName("parSmsSendChk").length;
		if (studentCnt > 0) {
			for (var i = 0; i < document.getElementsByName("parSmsSendChk").length; i++) {
				var ele = document.getElementsByName("parSmsSendChk")[i];
				if (ele.checked == false) {
					result = false;
					break;
				} else
					result = true;                 
			}
		}
    }
    document.getElementById("allChk").checked = result;
}


$(function() {
	$("#allChkPUSH").click(function() {
		if($("#allChkPUSH").prop("checked")) {
			//$("input[name=parPushSendChk]").prop("checked", true);
			for (var i = 0; i < document.getElementsByName("parPushSendChk").length; i++) {
				var ele = document.getElementsByName("parPushSendChk")[i];
				if (ele.checked == false && ele.disabled == false) {
					ele.checked = true;
				}                 
			}
		} else {
			//$("input[name=parPushSendChk]").prop("checked", false);
			for (var i = 0; i < document.getElementsByName("parPushSendChk").length; i++) {
				var ele = document.getElementsByName("parPushSendChk")[i];
				if (ele.checked == true && ele.disabled == false) {
					ele.checked = false;
				}                 
			}
		}
	});
});

function oneCheckPUSH(obj) {
    var result = false;
    if (obj.checked == true) {
		var studentCnt = document.getElementsByName("parPushSendChk").length;
		if (studentCnt > 0) {
			for (var i = 0; i < document.getElementsByName("parPushSendChk").length; i++) {
				var ele = document.getElementsByName("parPushSendChk")[i];
				if (ele.checked == false) {
					result = false;
					break;
				} else
					result = true;                 
			}
		}
    }
    document.getElementById("allChkPUSH").checked = result;
}

var selAllInStatus = "";
var selAllOutStatus = "";
function setStatusAll(status) 
{
	//▨▨in out 여부
	var nowAct = "out"; //in
	if (status == "01" || status == "02" || status == "04")
		nowAct = "in";

	//▨▨초기화
	if (nowAct == "in")
	{
		$("[class^=btn01]").attr('class', 'btn01');
		$("[class^=btn02]").attr('class', 'btn02');
		$("[class^=btn04]").attr('class', 'btn04');
		$("[id^=inHour_]").val('');
		$("[id^=inMin_]").val('');
		$("[id^=inStatus_]").val('');
	} else {
		$("[class^=btn11]").attr('class', 'btn11');
		$("[class^=btn03]").attr('class', 'btn03');
		$("[class^=btn10]").attr('class', 'btn10');
		$("[id^=outHour_]").val('');
		$("[id^=outMin_]").val('');
		$("[id^=outStatus_]").val('');

		if ($("[id=btn04_all]").attr('class').indexOf('std') > -1) {
			selAllOutStatus = "";
			return;
		}
	}

	//▨▨이전과 동일시 
	if (nowAct == "in")
	{
		if (selAllInStatus == status) {
			selAllInStatus = "";
			return;
		}
	} else {
		if (selAllOutStatus == status) {
			selAllOutStatus = "";
			return;
		}
	}

	//▨▨색깔변경
	var className = 'btn'+status;
	if ($("[id=btn"+status+"_all]").attr('class').indexOf('std') == -1)
		className = 'btn'+status+' std'+status;
	$("[class^=btn"+status+"]").attr('class', className);

	//▨▨상태값변경/시간입력
	var nowHour = addZero(date.getHours());
	var nowMin = addZero(date.getMinutes());	
	if (className == 'btn'+status)
	{
		nowHour = "";
		nowMin = "";
	}
	if (status == "01" || status == "02" || status == "04") {
		$("[id^=inStatus_]").val(status);
		$("[id^=inHour_]").val(nowHour);
		$("[id^=inMin_]").val(nowMin);
		//▨결석일때
		if (status == "04") {
			$("[id^=inHour_]").val('');
			$("[id^=inMin_]").val('');
			
			//귀가변경
			$("[id^=outStatus_]").val('');
			$("[id^=outHour_]").val('');
			$("[id^=outMin_]").val('');
			$("[class^=btn11]").attr('class', 'btn11');
			$("[class^=btn03]").attr('class', 'btn03');
			$("[class^=btn10]").attr('class', 'btn10');
		}
	} else {
		$("[id^=outStatus_]").val(status);
		$("[id^=outHour_]").val(nowHour);
		$("[id^=outMin_]").val(nowMin);
		//▨결석이있으면
		//전체/개체 색깔 X, 시간 X
		//$("input[name=eachResNo]:eq("+i+")").val();
		//alert($("[class^=btn04]").length);
		for (i=0;i<=$("[class^=btn04]").length-1;i++)
		{
			if ($("[class^=btn04]").eq(i).attr('class').indexOf('std') > -1)
			{
				$("[class^=btn"+status+"]").eq(i).attr('class', 'btn'+status);
				$("[id^=outHour_]").eq(i).val('');
				$("[id^=outMin_]").eq(i).val('');
				$("[id^=outStatus_]").eq(i).val('');
			}
		}
	}
	
	//대입
	if (nowAct == "in")
		selAllInStatus = status;
	else
		selAllOutStatus = status;
		
}

function setStatus(no, status) {
	if (status == "01" || status == "02" || status == "04") 
	{
		selAllInStatus = "";
		$("[id=btn01_all]").attr('class', 'btn01');
		$("[id=btn02_all]").attr('class', 'btn02');
		$("[id=btn04_all]").attr('class', 'btn04');

		if (status == "04")
			selAllOutStatus = "";
	} 
	else 
	{
		selAllOutStatus = "";
		$("[id=btn11_all]").attr('class', 'btn11');
		$("[id=btn03_all]").attr('class', 'btn03');
		$("[id=btn10_all]").attr('class', 'btn10');
	}
		
	var f = document.f;
	if (status == '01') {			//출석
		if (document.getElementsByName("inStatus")[no].value == status) {
			document.getElementById("btn01_" + no).className = "btn01";
			document.getElementsByName("inStatus")[no].value = "";
			document.getElementsByName("inHour")[no].value = "";
			document.getElementsByName("inMin")[no].value = "";
		} else {
			document.getElementById("btn01_" + no).className = "btn01 std01";
			document.getElementsByName("inStatus")[no].value = status;
			if (document.getElementsByName("inHour")[no].value == "" || document.getElementsByName("inMin")[no].value == "") {
				document.getElementsByName("inHour")[no].value = addZero(date.getHours());
				document.getElementsByName("inMin")[no].value = addZero(date.getMinutes());
			}
		}
		document.getElementById("btn02_" + no).className = "btn02";
		document.getElementById("btn04_" + no).className = "btn04";
	} else if (status == '02') {	//지각
		if (document.getElementsByName("inStatus")[no].value == status) {
			document.getElementById("btn02_" + no).className = "btn02";
			document.getElementsByName("inStatus")[no].value = "";
			document.getElementsByName("inHour")[no].value = "";
			document.getElementsByName("inMin")[no].value = "";
		} else {
			document.getElementById("btn02_" + no).className = "btn02 std02";
			document.getElementsByName("inStatus")[no].value = status;
			if (document.getElementsByName("inHour")[no].value == "" || document.getElementsByName("inMin")[no].value == "") {
				document.getElementsByName("inHour")[no].value = addZero(date.getHours());
				document.getElementsByName("inMin")[no].value = addZero(date.getMinutes());
			}
		}
		document.getElementById("btn01_" + no).className = "btn01";
		document.getElementById("btn04_" + no).className = "btn04";
	} else if (status == '04') {	//결석
		if (document.getElementsByName("inStatus")[no].value == status) {
			document.getElementById("btn04_" + no).className = "btn04";
			document.getElementsByName("inStatus")[no].value = "";
		} else {
			document.getElementById("btn04_" + no).className = "btn04 std04";
			document.getElementsByName("inStatus")[no].value = status;
		}
		document.getElementById("btn01_" + no).className = "btn01";
		document.getElementById("btn02_" + no).className = "btn02";
		document.getElementById("btn11_" + no).className = "btn11";
		document.getElementById("btn03_" + no).className = "btn03";
		document.getElementById("btn10_" + no).className = "btn10";
		document.getElementsByName("outStatus")[no].value = "";
		document.getElementsByName("inHour")[no].value = "";
		document.getElementsByName("inMin")[no].value = "";
		document.getElementsByName("outHour")[no].value = "";
		document.getElementsByName("outMin")[no].value = "";
	} else if (status == '11') {	//귀가
		if (document.getElementsByName("inStatus")[no].value == '04') {
			alert("결석을 먼저 '선택해제' 하세요!");
			return;
		} else {
			if (document.getElementsByName("inStatus")[no].value == '' && document.getElementsByName("outStatus")[no].value != status) {
				alert("등원에 관련된 내용부터 선택하세요!");
				return;
			}
			if (document.getElementsByName("outStatus")[no].value == status) {
				document.getElementById("btn11_" + no).className = "btn11";
				document.getElementsByName("outStatus")[no].value = "";
				document.getElementsByName("outHour")[no].value = "";
				document.getElementsByName("outMin")[no].value = "";
			} else {
				document.getElementById("btn11_" + no).className = "btn04 std11";
				document.getElementsByName("outStatus")[no].value = status;
				if (document.getElementsByName("outHour")[no].value == "" || document.getElementsByName("outMin")[no].value == "") {
					document.getElementsByName("outHour")[no].value = addZero(date.getHours());
					document.getElementsByName("outMin")[no].value = addZero(date.getMinutes());
				}
			}
			document.getElementById("btn03_" + no).className = "btn03";
			document.getElementById("btn10_" + no).className = "btn10";
		}
	} else if (status == '03') {	//조퇴
		if (document.getElementsByName("inStatus")[no].value == '04') {
			alert("결석을 먼저 '선택해제' 하세요!");
			return;
		} else {
			if (document.getElementsByName("inStatus")[no].value == '' && document.getElementsByName("outStatus")[no].value != status) {
				alert("등원에 관련된 내용부터 선택하세요!");
				return;
			}
			if (document.getElementsByName("outStatus")[no].value == status) {
				document.getElementById("btn03_" + no).className = "btn03";
				document.getElementsByName("outStatus")[no].value = "";
				document.getElementsByName("outHour")[no].value = "";
				document.getElementsByName("outMin")[no].value = "";
			} else {
				document.getElementById("btn03_" + no).className = "btn03 std03";
				document.getElementsByName("outStatus")[no].value = status;
				if (document.getElementsByName("outHour")[no].value == "" || document.getElementsByName("outMin")[no].value == "") {
					document.getElementsByName("outHour")[no].value = addZero(date.getHours());
					document.getElementsByName("outMin")[no].value = addZero(date.getMinutes());
				}
			}
			document.getElementById("btn11_" + no).className = "btn11";
			document.getElementById("btn10_" + no).className = "btn10";
		}
	} else if (status == '10') {	//도망
		if (document.getElementsByName("inStatus")[no].value == '04') {
			alert("결석을 먼저 '선택해제' 하세요!");
			return;
		} else {
			if (document.getElementsByName("inStatus")[no].value == '' && document.getElementsByName("outStatus")[no].value != status) {
				alert("등원에 관련된 내용부터 선택하세요!");
				return;
			}
			if (document.getElementsByName("outStatus")[no].value == status) {
				document.getElementById("btn10_" + no).className = "btn10";
				document.getElementsByName("outStatus")[no].value = "";
				document.getElementsByName("outHour")[no].value = "";
				document.getElementsByName("outMin")[no].value = "";
			} else {
				document.getElementById("btn10_" + no).className = "btn10 std10";
				document.getElementsByName("outStatus")[no].value = status;
				if (document.getElementsByName("outHour")[no].value == "" || document.getElementsByName("outMin")[no].value == "") {
					document.getElementsByName("outHour")[no].value = addZero(date.getHours());
					document.getElementsByName("outMin")[no].value = addZero(date.getMinutes());
				}
			}
			document.getElementById("btn11_" + no).className = "btn11";
			document.getElementById("btn03_" + no).className = "btn03";
		}
	}
}

function setPointAll(value) {
	$("[name=point]").val(value);
}

function fSubmit(f) {
	var stdCnt = document.getElementsByName("studentId").length;
	if (stdCnt == 0) {
		alert("출결을 등록할 학생이 없습니다.");
		return;
	}
}

$(document).ready(function(){ 
	if (HTTP_USER_AGENT()['os'] != "Android" && HTTP_USER_AGENT()['os'] != "Mac")
		$("#keyword").focus();
	$('#keyword').keypress(function(e){
		if(e.keyCode!=13) return;
		document.f.classNo.value='';
		document.f.target='_self';
		document.f.action='stdAttendCheck.asp';
		document.f.submit();
		return false;
	});
});
</script>

</head>
<script src="${contextPath}/assets/js/core/jquery.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/assets/js/core/popper.min.js"
	type="text/javascript"></script>
<script
	src="${contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="${contextPath}/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="${contextPath}/assets/js/plugins/nouislider.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/assets/js/plugins/moment.min.js"></script>
<script src="${contextPath}/assets/js/plugins/datetimepicker.js"
	type="text/javascript"></script>
<body marginwidth="0" marginheight="0" style="zoom: 1;">
	<div class="container pt-lg-7">

		<div class="infoStyle04" style="padding-bottom: 0;">
			<div style="position: absolute; top: -1000px;">
				<iframe id="hiddenIFrame" name="hiddenIFrame" width="0"
					height="100%"></iframe>
			</div>
			<form name="f" method="get" action="stdAttendCheck.asp">

				<div class="studySearch">

					<div class="hak1_left">

						<div class="hak1" style="margin-right: 0px;">
							<div class="std_00">학생</div>
							<input type="text" id="keyword" name="keyword" class="hak1_input"
								onfocus="javascript:SetCaretAtEnd(document.getElementById('keyword'));"
								value="" placeholder="학생 이름을 입력해주세요">
							<button type="button" class="hak1_button" style=""
								onclick="javascript:document.f.classNo.value='';document.f.target='_self';document.f.action='stdAttendCheck.asp';document.f.submit();"></button>
						</div>
						
						<span class="theDate_sp">
						<c:set var="today" value="<%=new java.util.Date()%>" /> <!-- 현재날짜 -->
					<c:set var="date">
						<fmt:formatDate value="${today}" pattern="YYYY.MM.dd" />
					</c:set> <!-- 데이터 뿌릴때 --> <c:out value="${date}" /> <script>
						function getTodayLabel() {
							var week = new Array('(일)', '(월)', '(화)', '(수)',
									'(목)', '(금)', '(토)');
							var today = new Date().getDay();
							var todayLabel = week[today];
							return todayLabel;
						}
						document.write(getTodayLabel())
					</script>
					</span>
					<img src="http://toclass.smartschool.kr/LMS/images/icon_calendar.png" class="callCal">
						<div
							style="display: inline; margin-left: 10px; float: left; position: relative; top: -2px;">
							<span><a href="javascript:;"
								onclick="javascript:var theDate=addDay2('2022-04-27',-1);location.href='?classNo=8225&amp;keyword=&amp;theDate='+theDate;"
								title="이전 일"><img
									src="http://toclass.smartschool.kr/LMS/images/btn_pre.gif"
									class=""></a></span><span><a href="javascript:;"
								onclick="javascript:var theDate=addDay2('2022-04-27',1);location.href='?classNo=8225&amp;keyword=&amp;theDate='+theDate;"
								title="다음 일"><img
									src="http://toclass.smartschool.kr/LMS/images/btn_next.gif"
									class=""></a></span><span><a href="javascript:;"
								onclick="location.href='?classNo=8225&amp;keyword=&amp;theDate=2022-04-27';"><img
									src="http://toclass.smartschool.kr/LMS/images/btn_today.gif"
									class=""></a></span>
						</div>
					</div>
					<div class="attendStatus">
						<div style="display: inline-block;">
							<ul class="asResult" id="attendStatus">
								<li><strong>전체</strong> : <span id="allCnt">2</span>명</li>
								<li class="fcBlue"><strong>출석</strong> : <span id="attCnt">0</span>명</li>
								<li class="fcOrange"><strong>지각</strong> : <span
									id="rateCnt">0</span>명</li>
								<li class="fcRed"><strong>결석</strong> : <span id="absCnt">0</span>명</li>
							</ul>
						</div>
					</div>
				</div>
			</form>

			<form name="fList" method="post" action="stdAttendCheck_exec.asp"
				target="hiddenIFrame">
				<input type="hidden" name="classNo" value="8225"> 
				<input type="hidden" name="theDate" value="2022-04-27">
				<table cellpadding="0" cellspacing="0" class="whTable02"></table>
				<div class="" style="width: 946px; position: relative;">
					<table cellpadding="0" cellspacing="0" class="whTable02 stdcheck" >
						<colgroup>
							<col width="100px">
							<col width="200px">
							<col width="120px">
							<col width="120px">
							<col width="413px">
						</colgroup>
						<tbody>
							<tr>
								<th class="attendance">번호</th>
								<th class="attendance">학생 (학교)</th>
								<th class="attendance">출석
									<div class="btn_group">
										<button type="button" id="btn01_all"
											onclick="setStatusAll('01');" class="btn01">출석</button>
										<button type="button" id="btn02_all"
											onclick="setStatusAll('02');" class="btn02">지각</button>
										<button type="button" id="btn04_all"
											onclick="setStatusAll('04');" class="btn04">결석</button>
									</div>
								</th>
								<!--<th style="width:46px;">출석문자</th>-->
								<th class="attendance">귀가
									<div class="btn_group">
										<button type="button" id="btn11_all"
											onclick="setStatusAll('11');" class="btn11">귀가</button>
										<button type="button" id="btn03_all"
											onclick="setStatusAll('03');" class="btn03">조퇴</button>
										<button type="button" id="btn10_all"
											onclick="setStatusAll('10');" class="btn10">도망</button>
									</div>
								</th>
								<!--<th style="width:46px;">귀가문자</th>-->
								<!-- <th style="width:139px;">출결현황</th>  -->

								<th class="attendance">출석사유 (메모)</th>

								<script type="text/javascript">
							$(function() {
								$(".windowExit").click(function(e) {
									$(".att_tip").fadeOut(200);	
								});
							});
							
							function setCookieAtt(day) {
								setCookie("att_tip", "no", day);
								$(".att_tip").fadeOut(200);
							}
							if (getCookie("att_tip") == "")
								document.getElementById("att_tip").style.display = "block";
							</script>
<style>
.att_tip {
	border: 1px solid #4b4b4b;
	padding: 15px;
	position: absolute;
	left: 890px;
	top: 30px;
	z-index: 100000;
	width: 180px;
	background: #fff;
}

.att_tip .arrowTip {
	background: url(/images/icon_infoWindowArrowLeft.png) no-repeat;
	width: 9px;
	height: 10px;
	position: absolute;
	top: 5px;
	left: -9px;
}

.att_tip .windowExit {
	position: absolute;
	right: 10px;
	top: 10px;
	width: 9px;
	height: 9px;
	background: url(/images/icon_infoWindowExit.png) no-repeat;
	cursor: pointer;
}

.att_tip .info {
	font-size: 12px;
	color: #333333;
	font-family: "돋움";
	text-align: justify;
	line-height: 18px;
}

.att_tip .info b {
	color: #e2567e;
}

.att_tip .info span {
	display: block;
	color: #9b9b9b;
	margin-top: 5px;
	text-align: right;
}
</style>
							</tr>
							<input type="hidden" name="studentId" id="studentId"
								value="ewq123">
							<input type="hidden" name="studentName" value="이순신">
							<input type="hidden" name="inStatus" id="inStatus_0" value="">
							<input type="hidden" name="outStatus" id="outStatus_0" value="">
							<input type="hidden" name="parSmsSendChk_copy" value="0">
							<input type="hidden" name="parPushSendChk_copy" value="0">
							<tr>
								<td align="center">2</td>
								<td align="left"><a href="javascript:;"
									onclick="javascript:window.open('/LMS/?goParam=member,1,V,student.asp,left_student.asp,,nowState:9|keytype:id|keyword:ewq123');"
									style="color: #333333; text-decoration: none">이순신
										((기타)고등학교)</a></td>
								<td align="center">
									<div class="btn_group_bg">
										<div class="btn_group_1">
											<button type="button" id="btn01_0"
												onclick="setStatus('0','01');" class="btn01 ">출석</button>
											<button type="button" id="btn02_0"
												onclick="setStatus('0','02');" class="btn02 ">지각</button>
											<button type="button" id="btn04_0"
												onclick="setStatus('0','04');" class="btn04 ">결석</button>
										</div>
									</div>
								</td>
								<!--<td><img src="/LMS/images/icon_smsF.png" alt="발송완료" /></td>-->
								<td align="center">
									<div class="btn_group_bg">
										<div class="btn_group_1">
											<button type="button" id="btn11_0"
												onclick="setStatus('0','11');" class="btn11 ">귀가</button>
											<button type="button" id="btn03_0"
												onclick="setStatus('0','03');" class="btn03 ">조퇴</button>
											<button type="button" id="btn10_0"
												onclick="setStatus('0','10');" class="btn10 ">도망</button>
										</div>
									</div>
								</td>
								<!--<td><img src="/LMS/images/icon_smsF.png" alt="발송완료" /></td>-->
								<!-- <td align="center" >
									</td> -->
								<td class="atten_text" align="center"><textarea
										style="width: 100%; height: 50px; border: 1px solid #e4e4e4;"
										name="memo" maxlength="90"></textarea></td>
							</tr>
							<input type="hidden" name="studentId" id="studentId"
								value="qwe321">
							<input type="hidden" name="studentName" value="홍길동">
							<input type="hidden" name="inStatus" id="inStatus_1" value="">
							<input type="hidden" name="outStatus" id="outStatus_1" value="">
							<input type="hidden" name="parSmsSendChk_copy" value="0">
							<input type="hidden" name="parPushSendChk_copy" value="0">
							<tr>
								<td align="center">1</td>
								<td align="left"><a href="javascript:;"
									onclick="javascript:window.open('/LMS/?goParam=member,1,V,student.asp,left_student.asp,,nowState:9|keytype:id|keyword:qwe321');"
									style="color: #333333; text-decoration: none">홍길동
										((기타)고등학교)</a></td>
								<td align="center">
									<div class="btn_group_bg">
										<div class="btn_group_1">
											<button type="button" id="btn01_1"
												onclick="setStatus('1','01');" class="btn01 ">출석</button>
											<button type="button" id="btn02_1"
												onclick="setStatus('1','02');" class="btn02 ">지각</button>
											<button type="button" id="btn04_1"
												onclick="setStatus('1','04');" class="btn04 ">결석</button>
										</div>
									</div>
								</td>
								<!--<td><img src="/LMS/images/icon_smsF.png" alt="발송완료" /></td>-->
								<td align="center">
									<div class="btn_group_bg">
										<div class="btn_group_1">
											<button type="button" id="btn11_1"
												onclick="setStatus('1','11');" class="btn11 ">귀가</button>
											<button type="button" id="btn03_1"
												onclick="setStatus('1','03');" class="btn03 ">조퇴</button>
											<button type="button" id="btn10_1"
												onclick="setStatus('1','10');" class="btn10 ">도망</button>
										</div>
									</div>
								</td>
								<!--<td><img src="/LMS/images/icon_smsF.png" alt="발송완료" /></td>-->
								<!-- <td align="center" >
									</td> -->
								<td class="atten_text" align="center"><textarea
										style="width: 100%; height: 50px; border: 1px solid #e4e4e4;"
										name="memo" maxlength="90"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btnSet_center"
					style="max-width: 950px; padding-bottom: 50px">
					<button type="button" class="wBtn03"
						onclick="location.reload(true);">새로고침</button>
					<button type="button" class="bBtn06"
						onclick="fSubmit(this.form);return false;">저장</button>
				</div>
			</form>
		</div>
	</div>
	<div class="alarm">

		<div style="display: none" id="div_fList">
			<form name="fMemPcsList" method="post"></form>
		</div>
		<script>
if (!document.fMemPcsList) {
	document.getElementById("div_fList").innerHTML = "<form name='fMemPcsList' method='post'></form>";
}
</script>
	</div>

	<script>
var xmlHttp;
function srvTime() {
    if (window.XMLHttpRequest) {//분기하지 않으면 IE에서만 작동된다.
        xmlHttp = new XMLHttpRequest(); // IE 7.0 이상, 크롬, 파이어폭스 등
        xmlHttp.open('HEAD',window.location.href.toString(),false);
        xmlHttp.setRequestHeader("Content-Type", "text/html");
        xmlHttp.send('');
        return xmlHttp.getResponseHeader("Date");
    }else if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
        xmlHttp.open('HEAD',window.location.href.toString(),false);
        xmlHttp.setRequestHeader("Content-Type", "text/html");
        xmlHttp.send('');
        return xmlHttp.getResponseHeader("Date");
    }
}

var st;
var date;
var nowHour;
var nowMin;
window.onload = function() { // 페이지가 로딩되면 실행
	st = srvTime();
	date = new Date(st);
	//alert(date);
	//var today = date.getFullYear() + "-" + addZero(date.getMonth()+1) + "-" + addZero(date.getDate()) + " " + addZero(date.getHours()) + ":" + addZero(date.getMinutes())+ ":" + addZero(date.getSeconds());
	printTime();
	$("#allCnt").text("2");
	$("#attCnt").text("0");
	$("#rateCnt").text("0");
	$("#absCnt").text("0");
	$("#notRecordCnt").text("2");
}

function printTime() {
	//nowHour = addZero(date.getHours());
	//nowMin = addZero(date.getMinutes());
	//date = new Date(date.getSeconds() + 1000)
	date.setSeconds(date.getSeconds() + 1);  
	setTimeout("printTime()",1000);
}


</script>
</body>
</html>
