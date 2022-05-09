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
</head>

<body>
<form name="frmLogin" method="post"  action="${contextPath}/member/checkPw.do">
	
   <table border="1"  width="80%" align="center" >
      <tr align="center">
         <td>비밀번호확인</td>
      </tr>
      <tr align="center">
        
         <td>
	    <input type="password" name="member_pw" value="" size="20">
	 </td>
      </tr>
      <tr align="center">
         <td colspan="2">
            <input type="submit" value="확인" > 
            <input type="reset"  value="다시입력" > 
         </td>
      </tr>
   </table>
</form>
</body>
</html>