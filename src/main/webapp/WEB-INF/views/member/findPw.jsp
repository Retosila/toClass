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
<title>비밀번호 찾기 페이지(/member/findPw.jsp)</title>


	var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/; 	// 이메일 정규식
	var member_email;	// 사용자가 입력한 이메일

	// 비밀번호 찾기 버튼 클릭 시 실행
	function findPw() {
		member_email = $("#member_email").val();
		
		// 이메일값이 이메일 정규식을 만족하는 경우
		if (emailRegex.test(member_email)) {
			// 입력받은 이메일 주소로 회원 비밀번호를 보내는 ajax 요청 
			$.ajax({ 
				url :'${contextPath}/member/findPw.do', 
				type : 'post', 
				dataType : 'json', 
				data : { 
					"member_email" : member_email
				},
				success : function(data) {
					// 입력된 이메일 주소로 등록된 회원이 존재할 시
					if (data.isExist == "true") {
						$('#msg').text("등록된 비밀번호가 전송되었습니다.");
						
					}
					else {
						alert("존재하지 않는 회원입니다.")
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

</script>
</head>
<body>
가입된 이메일 계정을 입력해주세요.<br>
<h6>***입력한 이메일 주소로 등록된 비밀번호가 전송됩니다***</h6><br>
이메일 : <input id="member_email" type="email" placeholder="ex) reto@naver.com"/><br>
<button type="button" onclick="findPw()">비밀번호 찾기</button><br>
<h5 id="msg"></h5>
<a href="${contextPath}/login">로그인 화면으로</a>
</body>
</html>