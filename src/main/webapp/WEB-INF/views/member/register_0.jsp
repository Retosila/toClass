<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<body>
<div class="container container-lg pt-9 pb-9">
  <div class="row">
    <div class="col-md-6 mb-5 mb-md-0">
      <div class="card card-lift--hover shadow border-0">
        <a href="${contextPath}/member/register_1?member_type=교사" >
          <img src="${contextPath}/assets/img/ill/teacher.png" class="card-img">
        </a>
        <h3>교사 회원가입</h3>
      </div>
    </div>
    <div class="col-md-6 mb-5 mb-lg-0">
      <div class="card card-lift--hover shadow border-0">
        <a href="${contextPath}/member/register_1?member_type=학생" >
          <img src="${contextPath}/assets/img/ill/student.png" class="card-img">
        </a>
        <h3>학생 회원가입</h3>
      </div>

    </div>
  </div>
  <div class="row">

  </div>
</div>


</body>
</html>





