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

	// 코드 유효성 검증 (8글자여야만 버튼 활성화)
	$(document).ready(function() {
		$("#code_input").on("keyup", function() {
			var cnt = $("#code_input").val();
			if (cnt.length == 8) {
				$('#apply_button').prop("disabled", false);
			}
			else {
				$('#apply_button').prop("disabled", true);
			}
		})
	});

</script>
<style>
th {
	font-size: 13px;
	font-weight: 300;
	background: rgb(241, 242, 244);
	text-align: left;
}
td {
	font-size: 13px;
	background: #fff;
}
.btnSet_center {
    width: 100%;
    padding: 20px 0px;
    text-align: center;
}
button.wBtn03 {
    height: 36px;
    padding: 0px 20px 3px;
    border: none;
    background: url(http://toclass.smartschool.kr/LMS/images/btn_typeW3_1.png) 0px 0px no-repeat,
    url(http://toclass.smartschool.kr/LMS/images/btn_typeW3_3.png) 100% 0px no-repeat,
    url(http://toclass.smartschool.kr/LMS/images/btn_typeW3_2.png) repeat-x;
    color: rgb(135, 135, 137);
    font-size: 12px;
    letter-spacing: -0.5px;
    box-sizing: border-box;
}
button.bBtn06 {
    height: 36px;
    padding: 0px 20px 3px;
    border: none;
    background: url(http://toclass.smartschool.kr/LMS/images/btn_typeB6_1.png) 0px 0px no-repeat,
    url(http://toclass.smartschool.kr/LMS/images/btn_typeB6_3.png) 100% 0px no-repeat,
    url(http://toclass.smartschool.kr/LMS/images/btn_typeB6_2.png) repeat-x;
    color: rgb(255, 255, 255);
    font-size: 12px;
    text-shadow: rgb(0 0 0) 0px 0px 2px;
    letter-spacing: -0.5px;
    box-sizing: border-box;
}
</style>
</head>
<body>
<!--
JSTL 내부에 주석을 달 시 발생하는 오류로 인해 설명은 이곳에만 간략하게 해둠
1. member는 세션에 바인딩된 회원 객체(MemberVO)를 말함
2. member.currentClass는 현재 접속한 회원이 현 시점 기준 속해있는 클래스를 말함
3. myClass는 내가 속한(담당한) 클래스의 세부 정보를 담은 클래스객체(ClassVO)를 말함
4. member.member_type(회원유형)과 member.currentClass(소속된 학급 유무)에 따라 조건을 분기시킴
-->
<div class="container pt-lg-4">
<c:choose>
	<c:when test="${member.member_type eq '교사'}">
		<c:choose>
			<c:when test="${member.currentClass != null}">
			<h4>나의 학급 정보</h4>
			<hr>
			<table class="table table-bordered" id="infoMyClass" style="max-width: 830px;">
				<tr>
					<th>담당 학급ID<font color="#CC0000">*</font></th>
					<td colspan="3">${myClass.class_id}</td>
				</tr>
				<tr>
					<th>담당 학급명<font color="#CC0000">*</font></th>
					<td colspan="3">${myClass.class_name}</td>
				</tr>
				<tr>
					<th>담당 학급접속 코드<font color="#CC0000">*</font></th>
					<td colspan="3">${myClass.class_code}</td>
				</tr>
				<tr>
					<th>담당 학급생성일<font color="#CC0000">*</font></th>
					<td>${myClass.class_regdate}</td>
					<th>담당 학급수정일</th>
					<td>${myClass.class_moddate}</td>
				</tr>
			</table>
				<br>
				<figcaption><h5>나의 학급원</h5></figcaption>
				<table class="table table-bordered" style="max-width: 830px;">
					<tr>
						<th>학생명</th>
						<th>이메일주소</th>
						<th>연락처</th>
						<th>가입일</th>
						<th>내보내기</th>
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
				<br>
				<figcaption><h5>학급 가입 신청자</h5></figcaption>
				<table class="table table-bordered" style="max-width: 830px;">
					<tr>
						<th>신청자명</th>
						<th>신청자 이메일</th>
						<th>신청자 연락처</th>
						<th>신청일시</th>
						<th>승인</th>
						<th>거절</th>
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
				<div class="btnSet_center" style="max-width:830px;">
				<form name="frmDelMyClass" method="POST" action="${contextPath}/member/delMyClass.do">
					<input type="hidden" name="class_id" value="${myClass.class_id}"/>
					<button type="button" class="bBtn06" onclick="delMyClass()">학급 폐쇄</button>
				</form>
				</div>
			</c:when>

			<c:when test="${member.currentClass == null}">
				<p><b>***담당 학급이 존재하지 않습니다.***</b></p>
				<p>새 학급을 생성해주세요!</p>
				<form method="post" action="${contextPath}/member/createClass.do">
					<input type="text" name="class_name" placeholder="1학년 1반"/>
					<br>
					<br>
					<button type="submit" class="bBtn06">새 학급 생성</button>
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
				<hr>
				<table class="table table-bordered" id="infoMyClass" style="max-width: 830px;">
				<tr>
					<th>소속 학급ID<font color="#CC0000">*</font></th>
					<td colspan="3">${myClass.class_id}</td>
				</tr>
				<tr>
					<th>소속 학급명<font color="#CC0000">*</font></th>
					<td colspan="3">${myClass.class_name}</td>
				</tr>
				<tr>
					<th>소속 학급접속 코드<font color="#CC0000">*</font></th>
					<td colspan="3">${myClass.class_code}</td>
				</tr>
				<tr>
					<th>소속 학급생성자(교사이메일)<font color="#CC0000">*</font></th>
					<td colspan="3">${myClass.class_maker}</td>
				</tr>
				<tr>
					<th>소속 학급생성일<font color="#CC0000">*</font></th>
					<td>${myClass.class_regdate}</td>
					<th>소속 학급수정일</th>
					<td>${myClass.class_moddate}</td>
				</tr>
			</table>
				<br>
			</c:when>

			<c:when test="${member.currentClass == null}">
				<p><b>***소속 학급이 존재하지 않습니다.***</b></p>
				<p id="status_msg">생성된 학급에 가입해주세요!</p>
				<form method="post" action="${contextPath}/member/applyClass.do">
					<input id="code_input" type="text" name="class_code" placeholder="가입코드를 입력해주세요."/>
					<br>
					<br>

					<button id="apply_button" type="submit" class="btn btn-secondary" disabled>학급 가입 신청</button>
				</form>
					<br>
				
				<c:choose>
					<c:when test="${isPending == true}">
						<script>
							$("#status_msg").text("현재 선생님의 가입 승인을 기다리고 있는 중입니다!");
							$("#code_input").hide();
							$("#apply_button").hide();
							console.log("대기 중인 요청 존재");
						</script>
					</c:when>
					<c:when test="${isRejected == true}">
						<script>
							alert("학급 가입 요청이 거부되었습니다.");
						</script>
					</c:when>
				</c:choose>

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

<c:if test="${msg != null}">
	<script>
		console.log("${msg}");
		alert("${msg}");
	</script>
</c:if>

</div>
</body>
</html>
