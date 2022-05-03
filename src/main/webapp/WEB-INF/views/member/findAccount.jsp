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
<title>계정 찾기 페이지(/member/findAccount.jsp)</title>

<script>

	var phoneRegex = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;	// 핸드폰 번호 정규식

	function findAccount() {
		var member_name = $("#member_name").val();
		var member_phone = $("#member_phone").val();
		// 이름 검증
		if (member_name.length < 2 || member_name == null) {
			alert("적절하지 않은 사용자 이름입니다.");
			console.log(member_name);
			return;
		}
		
		// 이메일 정규식 검증
		if (phoneRegex.test(member_phone) == false) {
			alert("유효하지 않은 핸드폰 번호입니다.");
			console.log(member_phone);
			return;
		}
		
		// 백단에 ajax 요청
		if (phoneRegex.test(member_phone) && member_name != null && member_name.length >= 2) {
			$.ajax({ 
				url :'${contextPath}/member/findAccount.do', 
				type : 'post', 
				dataType : 'json',
				data : {
					"member_name" : member_name,
					"member_phone" : member_phone 
				}, 
				success: function(data){
					// 해당 연락처&이름으로 등록된 계정이 존재하는 경우
					if (data.isExist == "true") {
						var member_email = data.member_email;
						$("#msg").text("조회된 계정명 : " + member_email);
						console.log("ajax request success");
					}
					// 등록된 계정이 존재하지 않는 경우
					else {
						$("#msg").text("존재하지 않는 계정입니다.");
						console.log("ajax request success");
					}
				}, 
				error : function(error) {
					console.log("ajax request failed");
	                console.log(JSON.stringify(error));
	            }
			});
		}
		else {
			alert("회원 정보를 다시 확인하여주십시오.");
		}
	}
	
</script>
</head>
<body>
가입 시 사용한 이름과 휴대폰 번호를 입력해주세요.<br>
이름 : <input id="member_name" type="text" placeholder="ex) 김레토"/><br>
휴대폰 번호 : <input id="member_phone" type="tel" placeholder="ex) 010-1234-5678"/><br>
<button type="button" onclick="findAccount()">계정찾기</button><br>
<h5 id="msg"></h5>
<a href="${contextPath}/login">로그인 화면으로</a>
</body>
</html>