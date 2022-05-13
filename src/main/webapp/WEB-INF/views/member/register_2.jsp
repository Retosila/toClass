<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지_2단계(/member/register_2.jsp)</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/; // 이메일 정규식

	var authCode; // 인증번호
	var email; // 사용자가 입력한 이메일

	// 인증번호 전송 버튼 클릭 시 실행
	function sendAuthCode() {
		email = $("#email").val();

		// 이메일값이 이메일 정규식을 만족하는 경우
		if (emailRegex.test(email)) {
			// 6자리의 난수 생성 후 전역변수 authCode에 할당
			authCode = String(Math.floor(Math.random() * 1000000)).padStart(6,
					"0");
			// 입력받은 이메일 주소로 authCode를 보내는 ajax 요청 
			$('#msg').text("인증번호 전송 중...");
			$.ajax({
				url : '${contextPath}/member/sendAuthCode.do',
				type : 'post',
				dataType : 'json',
				data : {
					"authCode" : authCode,
					"email" : email
				},
				success : function(data) {
					$('#msg').text("인증번호가 전송되었습니다.");
					console.log(data.msg);
				},
				error : function(error) {
					console.log(JSON.stringify(error));
				}
			});
		} else {
			alert("유효하지 않은 이메일 주소입니다.");
		}
	}

	// 인증 버튼 클릭 시 실행
	function checkAuthCode() {
		// 생성된 난수와 일치하는 번호 입력 시 "다음" 버튼 활성화
		if ($("#authCodeInput").val() == authCode) {
			$('#msg').text("인증이 완료되었습니다.");
			$('#next').prop("disabled", false).css("wBtn03");
		} else {
			$('#msg').text("유효하지 않은 인증번호입니다.");
		}
	}
</script>

<style>
.btnSet_center {
	width: 100%;
	padding: 20px 0px;
	text-align: center;
}

button.wBtn03 {
            height: 36px;
            padding: 0px 20px 3px;
            border: none;
            background: url(http://toclass.smartschool.kr/LMS/images/btn_typeW3_1.png) 0px 0px no-repeat,
            url(http://toclass.smartschool.kr/LMS/images/btn_typeW3_3.png) 100% 0px no-repeat,
            url(http://toclass.smartschool.kr/LMS/images/btn_typeW3_2.png) repeat-x;
            color: rgb(135, 135, 137);
            font-size: 12px;
            letter-spacing: -0.5px;
            box-sizing: border-box;
        }

button.bBtn06 {
	height: 31px;
	padding: 0px 20px 0px;
	border: none;
	background:
		url(http://toclass.smartschool.kr/LMS/images/btn_typeB6_1.png) 0px 0px
		no-repeat,
		url(http://toclass.smartschool.kr/LMS/images/btn_typeB6_3.png) 100%
		0px no-repeat,
		url(http://toclass.smartschool.kr/LMS/images/btn_typeB6_2.png)
		repeat-x;
	color: rgb(255, 255, 255);
	font-size: 12px;
	text-shadow: rgb(0, 0, 0) 0px 0px 2px;
	letter-spacing: -0.5px;
	box-sizing: border-box;
}

.joinTab table {
	width: 100%;
	height: 60px;
	border: 1px solid #d9d9d9;
	background: #fff;
}

.joinTab table th span {
	font-weight: normal;
	font-size: 12px;
	display: block;
}

.joinTab table th:first-child.on {
	background: #0065FF;
	color: #fff;
}

.memberJoinRoll {
	padding: 30px;
	margin-top: 30px;
	margin-bottom: 50px;
	border: 1px solid #e4e5e8;
	position: relative;
	background-color: #fff;
	border-top: 2px solid #0065FF;
	border-bottom: 2px solid #dbdcdf;
}
</style>

</head>

<body>
	<div class="container container-lg pt-5 pb-5">
		<div class="joinTab">
			<table cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tbody>
					<tr>
						<th class="on"><span>01</span> 약관동의</th>
						<th><span>02</span> 정보입력</th>
						<th style="border-right: 0px;"><span>03</span> 가입완료</th>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<div class="memberJoinRoll">
			<h4>회원타입 : ${member_type}</h4>
			<br>
			<form method="post" action="${contextPath}/member/register_3">
				<input id="email" name="member_email" type="email"
					placeholder="이메일 주소를 입력하세요" />
				<button type="button" class="bBtn06" onclick="sendAuthCode()">인증번호 발송</button>
				<br> <input id="authCodeInput" type="text"
					placeholder="인증번호(6자리 숫자)" />
				<button type="button" class="bBtn06" onclick="checkAuthCode()">인증</button>
				<br>
				<p id="msg"></p>
				<br>
				<button id="next" type="submit" class="wBtn03" disabled>다음</button>
			</form>
		</div>
		</div>
</body>
</html>