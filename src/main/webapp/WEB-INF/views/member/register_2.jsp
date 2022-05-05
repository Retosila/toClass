<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
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

	var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/; 	// 이메일 정규식

	var authCode;	// 인증번호
	var email;	// 사용자가 입력한 이메일
	
	// 인증번호 전송 버튼 클릭 시 실행
	function sendAuthCode() {
		email = $("#email").val();
		
		// 이메일값이 이메일 정규식을 만족하는 경우
		if (emailRegex.test(email)) {
			// 6자리의 난수 생성 후 전역변수 authCode에 할당
			authCode = String(Math.floor(Math.random()*1000000)).padStart(6,"0");
			// 입력받은 이메일 주소로 authCode를 보내는 ajax 요청 
			$('#msg').text("인증번호 전송 중...");
			$.ajax({ 
				url :'${contextPath}/member/sendAuthCode.do', 
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
		}
		else {
			alert("유효하지 않은 이메일 주소입니다.");
		}
	}
	
	// 인증 버튼 클릭 시 실행
	function checkAuthCode() {
		// 생성된 난수와 일치하는 번호 입력 시 "다음" 버튼 활성화
		if($("#authCodeInput").val() == authCode) {
			$('#msg').text("인증이 완료되었습니다.");
			$('#next').prop("disabled", false);
		}
		else {
			$('#msg').text("유효하지 않은 인증번호입니다.");
		}
	}
	
</script>

</head>

<body>
<h4>확인용 | 회원타입 : ${member_type}</h4>
<br>
<form method="post" action="${contextPath}/member/register_3">
<input id="email" name="member_email" type="email" placeholder="이메일 주소를 입력하세요"/><button type="button" onclick="sendAuthCode()">인증번호 발송</button><br>
<input id="authCodeInput" type="text" placeholder="인증번호(6자리 숫자)"/><button type="button" onclick="checkAuthCode()">인증</button><br>
<p id="msg"></p><br>
<button id="next" type="submit" disabled>다음</button>
</form>

</body>
</html>