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
<title>내 정보수정(/member/infoUpdate.jsp)</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	var phoneRegex = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;	// 핸드폰 번호 정규식
	
	var pwValidCheck = false;	// 패스워드 유효성 체크
	var pwConfirmCheck = false;	// 패스워드 확인 체크
	var phoneValidCheck = false;	// 핸드폰 번호 유효성 체크

	// 회원가입 버튼 클릭 시 실행
	function modInfo() {
		// 우선 핸드폰 번호 유효성 확인
		if ( pwValidCheck && pwConfirmCheck && phoneValidCheck) {
			// 왜 제이쿼리 $("#frmRegister").submit(); 사용할 때는 아무런 일이 일어나지 않는지 모르겠다.			
			document.frmModInfo.submit();
		}
		else {
			alert("입력된 정보가 유효하지 않습니다.");
		}
	}
	
</script>

</head>
<body>
<h4>내 정보 수정</h4>

<form name="frmModInfo" method="post" action="${contextPath}/member/modMember.do">
           
	       
	이메일 : <input id="member_email" name="member_email" type="text" value="${member.member_email }"readonly/>
	<b><span id="msgEmailValid" style="font-size:0.6em"></span><br></b>
	새비밀번호 : <input id="member_pw" name="member_pw" type="password" required/><b><span id="msgPwValid" style="font-size:0.6em"></span></b><br>
	<span style="font-size:0.6em"><b>비밀번호는 영문+숫자+특수문자를 혼합하여 8자~20자 이용이 가능합니다.</b></span><br>
	<script>
	// 비밀번호 정규식 및 검증 스크립트 (개발단계에서는 사용 안 함)
   	// 비밀번호가 8~20자 & 숫자, 문자, 특수문자를 모두 포함하는지 체크
 	$("#member_pw").on("keyup", function() {
		var num = /[0-9]/;	// 숫자 
	   	var eng = /[a-zA-Z]/;	// 문자 
	   	var spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		var pw = $("#member_pw").val();
	   	if (num.test(pw) && eng.test(pw) && spc.test(pw) && pw.length >= 8 && pw.length <= 20) {
	   		$("#msgPwValid").text("사용가능한 비밀번호입니다.");
	   		pwValidCheck = true;
	   	}
	   	else {
	   		$("#msgPwValid").text("유효하지 않은 비밀번호입니다.");
	   	}
		console.log(pwValidCheck);
   	});
	</script>
	새비밀번호 확인 : <input id="member_pw_check" name="member_pw_check" type="password"/><b><span id="msgPwConfirm" style="font-size:0.6em"></span></b><br>
	<script>
	$("#member_pw_check").on("keyup", function() {
		var member_pw = $("#member_pw").val();
		var member_pw_check = $("#member_pw_check").val();
		if (member_pw == member_pw_check) {
			$("#msgPwConfirm").text("비밀번호 확인이 완료되었습니다.");
			pwConfirmCheck = true;
		}
		else {
			$("#msgPwConfirm").text("비밀번호가 일치하지 않습니다.");
		}
		console.log(pwConfirmCheck);
	});
	</script>
	
	새연락처 : <input id="member_phone" name="member_phone" type="tel" required placeholder="010-0000-0000"/><br>
	<script>
	$("#member_phone").on("keyup", function() {
		var phone = $("#member_phone").val();
		if (phoneRegex.test(phone)) {
			phoneValidCheck = true;
		}
		else {}
		console.log(phoneValidCheck);
	});
	</script>
	
	<button type="button" onclick="modInfo()">수정하기</button>
</form>

</body>
</html>