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

	var emailDuplicateCheck = false; // 이메일 중복 확인 여부 체크
	var validatedEmail = "undefined"; // 이메일 중복 확인 체크 완료된 이메일

	// 인증번호 전송 버튼 클릭 시 실행
	function sendAuthCode() {
		email = $("#member_email").val();

		// 이메일값이 이메일 정규식을 만족하는 경우
		if (emailRegex.test(email)) {
			// 6자리의 난수 생성 후 전역변수 authCode에 할당
			authCode = String(Math.floor(Math.random() * 1000000)).padStart(6,"0");
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
			swal('이메일!', "유효하지 않은 이메일 주소입니다.", 'warning');

		}
	}

	// 인증 버튼 클릭 시 실행
	function checkAuthCode() {
		// 생성된 난수와 일치하는 번호 입력 시 "다음" 버튼 활성화
		if ($("#authCodeInput").val() == authCode) {
			$('#msg').text("인증이 완료되었습니다.");
			$('#next').prop("disabled", false);
		} else {
			$('#msg').text("유효하지 않은 인증번호입니다.");
		}
	}

	function checkEmailDuplicate() {
		var member_email = $("#member_email").val();
		console.log(member_email);
		// 이메일 정규식 체크
		if (emailRegex.test(member_email)) {
			// 입력된 이메일의 중복 여부로 확인하는 ajax 요청
			$.ajax({
				url : '${contextPath}/member/checkEmailDuplicate.do',
				type : 'post',
				dataType : 'json',
				data : {
					"member_email" : member_email
				},
				success : function(isDuplicate) {
					// 사용할 수 있는 있는 이메일일 경우(중복된 이메일이 DB에 없는 경우)
					if (isDuplicate.check == "false") {
						$("#msgEmailValid").text("사용가능한 이메일입니다.");
						emailDuplicateCheck = true;
						validatedEmail = member_email;
						$('#sendAuthButton').prop("disabled", false).css("wBtn03");
						console.log(isDuplicate.success);
					}
					// 해당 이메일값을 가진 회원이 존재하는 경우
					else {
						$("#msgEmailValid").text(
								"이미 존재하는 이메일입니다. 다른 이메일을 입력해주세요.");
						console.log(isDuplicate.success);
					}
				},
				error : function(error) {
					console.log(JSON.stringify(error));
				}
			});
		} else {
			swal('이메일!', "유효하지 않은 이메일 주소입니다.", 'warning');

		}
	}

	function next() {
		if (emailDuplicateCheck == false) {
			frmValidate.submit();
		}
		else {
			swal('이메일!', "중복체크 해주세요", 'warning');


		}
	}

	$(document).ready(function() {
		// 이메일 중복확인 후 키입력 발생 시, 인증된 이메일과 입력되어있는 값이 같은지 2차 검증
		$("#member_email").on("keyup", function() {
			console.log("이메일 변경 감지");
			var inputEmail = $(this).val();
			if (inputEmail != validatedEmail) {
				console.log("인증된 이메일과 불일치 : " + validatedEmail);
				emailDuplicateCheck = false;
				$('#next').prop("disabled", true);
				$('#sendAuthButton').prop("disabled", true);
			} else {
				console.log("인증된 이메일과 일치");
				emailDuplicateCheck = true;
			}
		});


	});


</script>

<style>
.btnSet_center {
	width: 100%;
	padding: 20px 0px;
	text-align: center;
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
		<div class="memberJoinRoll col-md-12">
			<h4>회원타입 : ${member_type}</h4>
			<br>
			<form id="frmValidate" method="post" action="${contextPath}/member/register_3">

				<div class="row">
					<div class="col-md-6">
						<input id="member_email" name="member_email" class="form-control" type="email"
							   placeholder="이메일 주소를 입력하세요." />
					</div>
					<div class="col-md-6">
						<button type="button" class="btn btn-primary" onclick="checkEmailDuplicate()">이메일 중복확인</button>
						<button id="sendAuthButton" type="button" class="btn btn-primary" onclick="sendAuthCode()" disabled>인증번호 발송</button><br>
						<span id="msgEmailValid" style="font-size: 0.6em"></span>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-6">
						<input id="authCodeInput" type="text" placeholder="인증번호를 입력하세요." class="form-control"/>
					</div>
					<div class="col-md-6">
						<button type="button" class="btn btn-primary" onclick="checkAuthCode()">인증</button>
					</div>
				</div>

				<br>
				<br>
				<p id="msg"></p>
				<br>
				<div class="row">
					<div class="col-md-12"><button id="next" type="submit" class="btn btn-primary" disabled>다음</button></div>

				</div>

			</form>
		</div>
		</div>
</body>
</html>
