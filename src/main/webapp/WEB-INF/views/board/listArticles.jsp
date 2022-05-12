<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>q</title>

    <script src="${contextPath}/assets/js/paginate.js"
            type="text/javascript"></script>

    <link href="${contextPath}/assets/css/ligne.css" rel="stylesheet"/>
    <link href="${contextPath}/assets/css/paginate.css" rel="stylesheet"/>

</head>
<body>


<div class="container ">

    <H6 class="display-4">자유게시판</H6>
    <table class="myTable table hover">
        <thead>
        <tr class="header" style="text-align: center;">
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회</th>
            <th>추천</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${empty articlesList  }">
                <tr height="10">
                    <td colspan="4">
                        <p align="center">
                            <b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
                        </p>
                    </td>
                </tr>
            </c:when>
            <c:when test="${not empty articlesList}">
                <c:forEach var="article" items="${articlesList}" varStatus="articleNum">
                    <tr align="center">

                        <td width="7%">${article.articleNO}</td>
                        <td align='left' width="40%"><span
                                style="padding-right: 30px"></span>
                        <a class='cls1'
                           href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
                        </td>
                        <td width="15%">${article.member_name}</td>
                        <td width="15%">${article.writeDate}</td>
                        <td width="7%">${article.views}</td>
                        <td width="7%">${article.good+article.bad}</td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
        </tbody>
    </table>


    <div class="row">
        <div class="input-group col-3">
            <input class="form-control" type="search" id="searchBox" placeholder="검색">
        </div>
        <div class="col-9" align="right">

            <a href="${contextPath}/board/articleForm.do">
                <button type="button" class="btn btn-default btn-round ">글쓰기</button>
            </a>
        </div>
    </div>
</div>


<script>

    let options = {
        numberPerPage: 10,
        goBar: true,
        pageCounter: true,
    };

    let filterOptions = {
        el: '#searchBox'
    };

    paginate.init('.myTable', options, filterOptions);
</script>
</body>
</html>












