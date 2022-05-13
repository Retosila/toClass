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
<title>회원가입 페이지_3단계(/member/register_3.jsp)</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

	var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;	// 이메일 정규식
	var phoneRegex = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;	// 핸드폰 번호 정규식
	
	var emailDuplicateCheck = false;	// 이메일 중복 확인 여부 체크
	var validatedEmail = "undefined";	// 이메일 중복 확인 체크 완료된 이메일
	var pwValidCheck = false;	// 패스워드 유효성 체크
	var pwConfirmCheck = false;	// 패스워드 확인 체크
	var phoneValidCheck = false;	// 핸드폰 번호 유효성 체크
	
	// 이메일 중복 확인 버튼 클릭 시 실행
	function checkEmailDuplicate() {
		var member_email = $("#member_email").val();
		console.log(member_email);
		// 이메일 정규식 체크
		if (emailRegex.test(member_email)) {
			// 입력된 이메일의 중복 여부로 확인하는 ajax 요청
			$.ajax({ 
				url :'${contextPath}/member/checkEmailDuplicate.do', 
				type : 'post', 
				dataType : 'json',
				data : { "member_email" : member_email }, 
				success: function(isDuplicate){
					// 사용할 수 있는 있는 이메일일 경우(중복된 이메일이 DB에 없는 경우) 
					if (isDuplicate.check == "false" ) {
						$("#msgEmailValid").text("사용가능한 이메일입니다.");
						emailDuplicateCheck = true;
						validatedEmail = member_email;
						console.log(isDuplicate.success);
					}
					// 해당 이메일값을 가진 회원이 존재하는 경우
					else {
						$("#msgEmailValid").text("이미 존재하는 이메일입니다. 다른 이메일을 입력해주세요.");
						console.log(isDuplicate.success);
					}
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

	// 회원가입 버튼 클릭 시 실행
	function register() {
		// 각 항목의 유효성 확인
		if (emailDuplicateCheck == false) {
			alert("이메일 중복확인을 해주시기 바랍니다.");			
			return;
		}
		else if (pwValidCheck == false) {
			alert("사용할 수 없는 비밀번호입니다.");			
			return;
		}
		else if (pwConfirmCheck == false) {
			alert("비밀번호가 일치하지 않습니다.");			
			return;
		}
		else if (phoneValidCheck == false) {
			alert("잘못된 전화번호 형식입니다.");			
			return;
		}
		// 전 항목이 true일 시 submit
		else if (emailDuplicateCheck && pwValidCheck && pwConfirmCheck && phoneValidCheck) {
			document.frmRegister.submit();
		}
		else {
			alert("입력된 정보가 유효하지 않습니다.");
		}
	}
	
	$(document).ready(function(){
		// 이메일 중복확인 후 키입력 발생 시, 인증된 이메일과 입력되어있는 값이 같은지 2차 검증
		$("#member_email").on("keyup", function() {
			console.log("이메일 변경 감지");
			var inputEmail = $(this).val();
			if(inputEmail != validatedEmail) {
				console.log("인증된 이메일과 불일치 : " + validatedEmail);
				emailDuplicateCheck = false;
			}
			else {
				console.log("인증된 이메일과 일치");
				emailDuplicateCheck = true;
			}
		});
	
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
		   		pwValidCheck = false;
		   	}
			console.log(pwValidCheck);
	   	});
		
		// 비밀번호 확인 검증
		$("#member_pw_check, #member_pw").on("keyup", function() {
			if ($("#member_pw_check").val() != "" ) {
				var member_pw = $("#member_pw").val();
				var member_pw_check = $("#member_pw_check").val();
				if (member_pw == member_pw_check) {
					$("#msgPwConfirm").text("비밀번호 확인이 완료되었습니다.");
					pwConfirmCheck = true;
				}
				else {
					$("#msgPwConfirm").text("비밀번호가 일치하지 않습니다.");
					pwConfirmCheck = false;
				}
				console.log(pwConfirmCheck);
			}
		});
		
		// 전화번호 검증
		$("#member_phone").on("keyup", function() {
			var phone = $("#member_phone").val();
			if (phoneRegex.test(phone)) {
				phoneValidCheck = true;
			}
			else {
				phoneValidCheck = false;
			}
			console.log(phoneValidCheck);
		});
		
	});
	
</script>

</head>
<body>
<h4>확인용 : ${member_email}</h4>

<form name="frmRegister" method="post" action="${contextPath}/member/register.do">
	이메일 : <input id="member_email" name="member_email" type="email" value="${member_email}" required/><button type="button" onclick="checkEmailDuplicate()">이메일 중복확인</button>
	<b><span id="msgEmailValid" style="font-size:0.6em"></span><br></b>
	
	비밀번호 : <input id="member_pw" name="member_pw" type="password" required/><b><span id="msgPwValid" style="font-size:0.6em"></span></b><br>
	<span style="font-size:0.6em"><b>비밀번호는 영문+숫자+특수문자를 혼합하여 8자~20자 이용이 가능합니다.</b></span><br>

	비밀번호 확인 : <input id="member_pw_check" name="member_pw_check" type="password"/><b>
	<span id="msgPwConfirm" style="font-size:0.6em"></span></b><br>

	이름 : <input name="member_name" type="text" required/><br>

	연락처 : <input id="member_phone" name="member_phone" type="tel" required/><br>

	회원유형 : <b><span style="font-size:1em">${member_type}</span></b><br>
	<input name="member_type" type="hidden" value="${member_type}"/>
	
	<button type="button" onclick="register()">회원가입</button>
</form>

</body>
</html>