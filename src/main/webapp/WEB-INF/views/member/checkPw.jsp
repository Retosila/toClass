<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">

 <script>
 	var test = "${result}";
 	console.log(test);

 </script>

<title>비밀번호확인창</title>
<c:choose>
	<c:when test="${result=='pwCheckFailed'}">
	  <script>
	    window.onload=function(){
	      alert(" 비밀번호가 틀립니다.다시 입력 하세요!");
	    };
	  </script>
	</c:when>
</c:choose>

<style>
th {
	font-size: 15px;
	font-weight: 300;
	background: rgb(241, 242, 244);
}
td {
	background: #fff;
}
.btnSet_center {
    width: 100%;
    padding: 10px 0px;
    text-align: center;
}

</style>
</head>

<body>
<form name="frmLogin" method="post"  action="${contextPath}/member/checkPw.do">
<div class="container pt-lg-4" style="max-width: 830px; margin:0 auto;">
	<h3>${member.member_name}님의 본인확인</h3>
    <hr>
   <table class="table table-bordered" >
      <tr align="center">
         <th>비밀번호확인</th>
      </tr>
      <tr align="center">
         <td>
	    <input type="password" name="member_pw" value="" size="25">
	 </td>
      </tr>
   </table>
   <div class="btnSet_center">
   <button type="reset"  class="btn btn-outline-primary" value="다시입력" > 다시입력 </button>
   <button type="submit" class="btn btn-primary" value="확인" > 확인 </button>
</div>
</div>
</form>
</body>
</html>
