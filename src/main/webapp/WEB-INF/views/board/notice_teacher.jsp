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
<title>알림장(교사)</title>

<script>

	var studentEmailList = {};
	var studentNameList = {};

	function sendNotice() {
		frmNotice.submit();
		alert("알림장 전송완료");
	}
	
    $(document).ready(function(){
    	$("#student_name_list").on("change", function() {
    		console.log("클릭!");
    		var selectedStudentEmail = $("#student_name_list option:selected").val();
    		var selectedStudentName = $("#student_name_list option:selected").text();
    		console.log(selectedStudentEmail);
    		console.log(selectedStudentName);
    		
    		// 전체, 한 학생 말고 특정 몇 명의 학생에게만 보내는 것 차후에 구현할 예정
    		$("#notice_receiver_name").val(selectedStudentName);
    		$("#notice_receiver").val(selectedStudentEmail);
    		
    	});
    });

</script>

</head>
<body>

<form id="frmNotice" action="${contextPath}/board/sendNotice.do" method="post">
<fieldset>

<input id="notice_sender" name="notice_sender" type="hidden" value="${member.member_email}"/><br>
알림장 제목 : <input id="notice_title" name="notice_title" type="text" placeholder="제목"/><br>

알림장 수신자 : <input id="notice_receiver_name" name="notice_receiver_name" type="text" readonly/><br>

수신자 선택 : <select id="student_name_list" name="student_name_list">
	<option class="student_tag" value="select_all">전체</option>
	<c:forEach var="student" items="${studentList}">
		<option class="student_tag" value="${student.member_email}">${student.member_name}</option>
	</c:forEach>
</select>
<input id="notice_receiver" name="notice_receiver" type="hidden"/><br>

알림장 내용 : <textarea id="notice_content" name="notice_content" placeholder="가정통신문 제목"></textarea><br>

<button id="sendButton" type="button" onClick="sendNotice()">보내기</button>
</fieldset>


</form>


</body>
</html>