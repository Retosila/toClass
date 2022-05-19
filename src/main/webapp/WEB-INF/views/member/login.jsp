<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"
		 isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">


<script>

	//이메일 정규식
	var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	var email;

	// 쿠키 저장
	function setCookie(cookieName, value, exdays) {
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + expireDate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}

	// 쿠키 불러오기
	function getCookie(cookieName) {
	    cookieName = cookieName + "=";
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = "";
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(";", start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
    	return unescape(cookieValue);
	}

	// 쿠키 삭제
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}

	// 아이디 저장 로직
	$(function(){
		// 쿠키에 저장된 member_email값을 input에 할당
	    var member_email = getCookie("Cookie_member_email");
	    $("#member_email").val(member_email);
    	// 값이 입력되어 있을 시 아이디 저장란 체크 표시
   		if($("#member_email").val() != "") {
	        $("#customCheckLogin").attr("checked", true);
   		}
	});

	function login(){
	    var member_email = $("#member_email");
	    email = $("#member_email").val();
	    var member_pw = $("#member_pw");
	    var frmLogin = $("#frmLogin");

	    // 유효성 검증
	    if(member_email.val() == ""){
	        //alert("이메일을 입력해주세요.");
			swal('이메일',"이메일 입력해주세요" , 'warning')
	        member_email.focus();
	        return;
	    }
	    else if(emailRegex.test(email) == false) {
			swal('이메일',"유효하지 않은 이메일 주소입니다." , 'warning')

	        member_email.focus();
	        return;
	    }
	    else if(member_pw.val() == ""){

			swal('비밀번호',"비밀번호를 입력해주세요." , 'warning')
	        member_pw.focus();
	        return;
	    }
	    // 이메일 저장이 check 상태일 시, 이메일 정보를 쿠키에 30일 간 저장
	    else if($("#customCheckLogin").is(":checked")){
	        var member_email = $("#member_email").val();
	        setCookie("Cookie_member_email", member_email, 30);
	        frmLogin.submit();
	    }
	    // 체크를 풀고 로그인할 시 쿠키 삭제
	    else{
	        deleteCookie("Cookie_member_email");
	        frmLogin.submit();
	    }
	}

</script>

<!-- login 페이지에서 enter 입력 시 submit 처리  -->
<body onKeyDown="if(event.keyCode == 13) login()">
	<div class="container pt-lg-7">
		<div class="row justify-content-center">
			<div class="col-lg-5">
				<div class="card bg-secondary shadow border-0">


					<div class="card-body px-lg-5 py-lg-5">
						<div class="text-center text-muted mb-4">
							<small>이메일로 로그인</small>
						</div>

						<form id="frmLogin" name="frmLogin" role="form" method="post" action="${contextPath}/member/login.do">
							<div class="form-group mb-3">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="ni ni-email-83"></i></span>
									</div>

									<input id="member_email" name="member_email" class="form-control" placeholder="이메일" type="text"/>
								</div>
							</div>
							<div class="form-group focused">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
									</div>
									<!-- pw입력 창에서 enter시 login함수 실행  -->
									<input id="member_pw" name="member_pw" class="form-control" placeholder="비밀번호" type="password"/>
								</div>
							</div>

							<div class="custom-control custom-control-alternative custom-checkbox">
								<input class="custom-control-input" id="customCheckLogin" name="customCheckLogin" type="checkbox">
								<label class="custom-control-label" for="customCheckLogin">
									<span>이메일 저장</span>
								</label>
							</div>
							<div class="text-center">
								<button type="button" class="btn btn-primary my-4" onclick="login()">로그인</button>
							</div>
						</form>

					</div>
				</div>

				<div class="row mt-3">
					<div class="col-4 text-left">
						<a href="${contextPath}/member/findAccount" class="text-primary"><small>계정찾기</small></a>
					</div>
					<div class="col-4">
					</div>
					<div class="col-4 text-right">
						<a href="${contextPath}/member/findPw" class="text-primary"><small>비밀번호 찾기</small></a>
					</div>
				</div>

			</div>

			<c:choose>
				<c:when test="${result eq 'loginFailed'}">
					<script>
						console.log("${result}");
					</script>
					<h4>로그인 실패 : 이메일주소 및 비밀번호가 일치하지 않습니다.</h4>
				</c:when>
				<c:when test="${result eq 'unregistered'}">
					<script>
						console.log("${result}");
						alert("회원탈퇴가 완료되었습니다.");
					</script>
				</c:when>
				<c:when test="${msg != null}">
					<script>
						console.log("${msg}");
						alert("${msg}");
					</script>
				</c:when>
			</c:choose>

		</div>
	</div>

</body>
</html>






