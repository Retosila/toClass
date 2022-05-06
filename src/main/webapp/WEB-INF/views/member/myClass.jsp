<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
<%
	request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 학급 관리(/member/myClass.jsp)</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

	// 학급 폐쇄 버튼 클릭 시 실행
	function delMyClass() {
		var cmd = confirm("정말 학급을 폐쇄하시겠습니까?");
		if (cmd) {
			document.frmDelMyClass.submit();
		}
	}
	
</script>
</head>
<body>
<!-- 
JSTL 내부에 주석을 달 시 발생하는 오류로 인해 설명은 이곳에만 간략하게 해둠
1. member는 세션에 바인딩된 회원 객체(MemberVO)를 말함
2. member.currentClass는 현재 접속한 회원이 현 시점 기준 속해있는 클래스를 말함
3. myClass는 내가 속한(담당한) 클래스의 세부 정보를 담은 클래스객체(ClassVO)를 말함
4. member.member_type(회원유형)과 member.currentClass(소속된 학급 유무)에 따라 조건을 분기시킴
-->
<c:choose>
	<c:when test="${member.member_type eq '교사'}">
		<c:choose>
			<c:when test="${member.currentClass != null}">
				<h4>담당 학급ID : ${myClass.class_id}</h4>
				<h4>담당 학급명 : ${myClass.class_name}</h4>
				<h4>담당 학급접속코드 : ${myClass.class_code}</h4>
				<h4>담당 학급생성일 : ${myClass.class_regdate}</h4>
				<h4>담당 학급수정일 : ${myClass.class_moddate}</h4>
				
				<figcaption><h5>나의 학급원</h5></figcaption>
				<table border="1">
					<tr>
						<th>학생명</th>
						<th>이메일주소</th>
						<th>연락처</th>
						<th>가입일</th>
						<th></th>
					</tr>
					<c:forEach var="student" items="${studentList}">
						<tr>
							<td>${student.member_name}</td>
							<td>${student.member_email}</td>
							<td>${student.member_phone}</td>
							<td>${student.member_regdate}</td>
							<td><a href="${contextPath}/member/delMyStudent.do?member_email=${student.member_email}&class_id=${myClass.class_id}">내보내기</a></td>
						</tr>
					</c:forEach>
				</table>
				
				<figcaption><h5>학급 가입 신청자</h5></figcaption>
				<table border="1">
					<tr>
						<th>신청자명</th>						
						<th>신청자 이메일</th>						
						<th>신청자 연락처</th>						
						<th>신청일시</th>
						<th></th>						
						<th></th>						
					</tr>
					<c:forEach var="applicant" items="${applicantList}">
						<tr>
							<td>${applicant.name}</td>
							<td>${applicant.email}</td>
							<td>${applicant.phone}</td>
							<td>${applicant.regdate}</td>
							<td><a href="${contextPath}/member/acceptApplicant.do?email=${applicant.email}&accept=yes&class_id=${myClass.class_id}">승인</a></td>
							<td><a href="${contextPath}/member/acceptApplicant.do?email=${applicant.email}&accept=no&class_id=${myClass.class_id}">거절</a></td>
						</tr>
					</c:forEach>
				</table>
				
				<br><br>
				
				<form name="frmDelMyClass" method="POST" action="${contextPath}/member/delMyClass.do">
					<input type="hidden" name="class_id" value="${myClass.class_id}"/>
					<button type="button" onclick="delMyClass()">학급 폐쇄</button>
				</form>
			</c:when>
			
			<c:when test="${member.currentClass == null}">
				<p>***담당 학급이 존재하지 않습니다.***</p>
				<p>새 학급을 생성해주세요!</p>
				<form method="post" action="${contextPath}/member/createClass.do">
					<input type="text" name="class_name" placeholder="1학년 1반"/>
					<button type="submit">새 학급 생성</button>
				</form>
			</c:when>
		</c:choose>
		
		<c:choose>
			<c:when test="${result eq 'delSuccess'}">
				<script>
					console.log("${result}");
					alert("학급 폐쇄가 완료되었습니다.");	
				</script>
			</c:when>
			<c:when test="${result eq 'delFailed'}">
				<script>
					console.log("${result}");
					alert("오류 : 학급 폐쇄 실패");
				</script>		
			</c:when>
			<c:when test="${result eq 'acceptSuccess'}">
				<script>
					console.log("${result}");
					alert("승인 처리되었습니다.");
				</script>		
			</c:when>
			<c:when test="${result eq 'rejectSuccess'}">
				<script>
					console.log("${result}");
					alert("거부 처리되었습니다.");
				</script>		
			</c:when>
			<c:when test="${result eq 'studentDeleteSuccess'}">
				<script>
					console.log("${result}");
					alert("학급원을 내보냈습니다.");
				</script>		
			</c:when>
			<c:when test="${result eq 'requestFailed'}">
				<script>
					console.log("${result}");
					alert("오류 : 요청 처리 실패");
				</script>		
			</c:when>
		</c:choose>
		
	</c:when>
	
	<c:when test="${member.member_type eq '학생'}">
		<c:choose>
			<c:when test="${member.currentClass != null}">
				<h3>여기는 ${myClass.class_name}입니다!</h3>
				<h4>소속 학급ID : ${myClass.class_id}</h4>
				<h4>소속 학급명 : ${myClass.class_name}</h4>
				<h4>소속 학급접속코드 : ${myClass.class_code}</h4>
				<h4>소속 학급생성일 : ${myClass.class_regdate}</h4>
				<h4>소속 학급수정일 : ${myClass.class_moddate}</h4>
				<h4>소속 학급생성자(교사이메일) : ${myClass.class_maker}</h4>
			</c:when>
			
			<c:when test="${member.currentClass == null}">
				<h4>***소속 학급이 존재하지 않습니다.***</h4>
				<h4>생성된 학급에 가입해주세요!</h4>
				<form method="post" action="${contextPath}/member/applyClass.do">
					<input type="text" name="class_code" placeholder="학급 가입코드를 입력해주세요."/>
					<button type="submit">학급 가입 신청</button>
				</form>
				<c:if test="${isPending == true}">
					<h3>현재 선생님의 가입 승인을 기다리고 있는 중입니다!</h3>
				</c:if>
				
				<c:choose>
					<c:when test="${result eq 'applySuccess'}">
						<script>
							console.log("${result}");
							alert("학급 가입 요청 완료! 승인을 기다려주세요.");	
						</script>
					</c:when>
					<c:when test="${result eq 'applyFailed'}">
						<script>
							console.log("${result}");
							alert("유효하지 않은 가입 코드입니다.");
						</script>		
					</c:when>
				</c:choose>
				
			</c:when>
		</c:choose>
	</c:when>
	
</c:choose>

</body>
</html>