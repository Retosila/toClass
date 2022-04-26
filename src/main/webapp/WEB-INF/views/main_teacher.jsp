<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교사 메인페이지(main_teacher.jsp)</title>
</head>
<body>
<h3>${member.member_name} 선생님 환영합니다!</h3>

<p> 식별번호 : ${member.member_id}</p>
<p> 이메일 : ${member.member_email}</p>
<p> 비밀번호 : ${member.member_pw}</p>
<p> 이름 : ${member.member_name}</p>
<p> 핸드폰 : ${member.member_phone}</p>
<p> 회원유형 : ${member.member_type}</p>
<p> 등록일 : ${member.member_regdate}</p>
<p> 수정일 : ${member.member_moddate}</p>
</body>
</html>