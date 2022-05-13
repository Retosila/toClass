<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <style>
    .joinTab table {
      width: 100%;
      height: 60px;
      border: 1px solid #d9d9d9;
      background: #fff;
    }

    .joinTab table th span {
      font-weight: normal;
      font-size: 12px;
      display: block;
    }

    .joinTab table th:first-child.on {
      background: #0065FF;
      color: #fff;
    }
  </style>
</head>
<body>
<div class="container container-lg pt-5 pb-5">
  <div class="joinTab">
    <table cellpadding="0" cellspacing="0">
      <colgroup>
        <col width="25%">
        <col width="25%">
        <col width="25%">
        <col width="25%">
      </colgroup>
      <tbody>
      <tr>
        <th class="on"><span>01</span> 약관동의</th>
        <th><span>02</span> 정보입력</th>
        <th style="border-right: 0px;"><span>03</span> 가입완료</th>
      </tr>
      </tbody>
    </table>
  </div>
  <br>
  <div class="row">
    <div class="col-md-6 mb-5 mb-md-0">
      <div class="card card-lift--hover shadow border-0">
        <a href="${contextPath}/member/register_1?member_type=교사"> <img
                src="${contextPath}/assets/img/ill/teacher.png" class="card-img">
        </a>
        <h3>교사 회원가입</h3>
      </div>
    </div>
    <div class="col-md-6 mb-5 mb-lg-0">
      <div class="card card-lift--hover shadow border-0">
        <a href="${contextPath}/member/register_1?member_type=학생"> <img
                src="${contextPath}/assets/img/ill/student.png" class="card-img">
        </a>
        <h3>학생 회원가입</h3>
      </div>

    </div>
  </div>
  <div class="row"></div>
</div>


</body>
</html>





