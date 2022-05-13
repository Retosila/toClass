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

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!--
<link rel="apple-touch-icon" sizes="76x76"
	href="${contextPath}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${contextPath}/assets/img/favicon.png">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link href="${contextPath}/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />
<link href="${contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
<link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />
<link href="${contextPath}/assets/css/argon-design-system.css?v=1.2.2" rel="stylesheet" />
 -->

<script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=articleForm;
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/board/articleForm.do';
	  }
	}
</script>
</head>

<body>
	<div class="container pt-lg-7">
		<table class="table">
			<thead>
				<tr>
					<th></th>

					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
					<th class="text-center">추천</th>

				</tr>
			</thead>
			<c:choose>
				<c:when test="${articlesList ==null }">
					<tr height="10">
						<td colspan="4">
							<p align="center">
								<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
							</p>
						</td>
					</tr>
				</c:when>
				<c:when test="${articlesList !=null }">
					<c:forEach var="article" items="${articlesList }"
						varStatus="articleNum">
						<tr align="center">
							<td width="5%">${articleNum.count}</td>

							<td align='left' width="40%"><span
								style="padding-right: 30px"></span> <c:choose>
									<c:when test='${article.level > 1 }'>
										<c:forEach begin="1" end="${article.level }" step="1">
											<span style="padding-left: 20px"></span>
										</c:forEach>
										<span style="font-size: 12px;">[답변]</span>
										<a class='cls1'
											href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
									</c:when>
									<c:otherwise>
										<a class='cls1'
											href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
									</c:otherwise>
								</c:choose></td>
							<td width="15%">${article.id }</td>
							<td width="15%">${article.writeDate}</td>
							<td width="7%">${article.id }</td>
							<td width="7%"></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>

		</table>
	</div>

	<a
		href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do','${contextPath}/member/loginForm.do')">
		<button type="button" class="btn btn-default btn-round">글쓰기</button>
	</a>


	<div class="container pt-lg-7">
		<table class="table">
			<thead>
				<tr>
					<th>이름</th>

					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>

				</tr>
			</thead>


			<tr align="center">

				<td width="30%">홍길동</td>
				<td>출석</td>
				<td>출석</td>
				<td>출석</td>
				<td>출석</td>
				<td>출석</td>

			</tr>
		</table>
	</div>

</body>
</html>












