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

    <script>
        function fn_articleForm(logOn, articleForm, login) {
            if (logOn != '' && logOn != 'false') {
                location.href = articleForm;
            } else {
                alert("로그인 후 글쓰기가 가능합니다.")
                location.href = login + '?action=/board/articleForm.do';
            }
        }
    </script>
    <link href="${contextPath}/assets/css/ligne.css" rel="stylesheet"/>
    <link href="${contextPath}/assets/css/paginate.css" rel="stylesheet"/>

</head>
<body>


<div class="container pt-lg-5 pb-lg-5">


    <table class="myTable table hover">
        <thead>
        <tr class="header" style="text-align: center;">
            <th>번호</th>

            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회</th>
            <th class="text-center">추천</th>

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
                                style="padding-right: 30px"></span> <c:choose>
                            <c:when test='${article.level > 1 }'>
                                <c:forEach begin="1" end="${article.level}" step="1">
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
                        <td width="15%">${article.member_email }</td>
                        <td width="15%">${article.writeDate}</td>
                        <td width="7%">${article.views }</td>
                        <td width="7%"></td>

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

        <a href="javascript:fn_articleForm('${logOn}','${contextPath}/board/articleForm.do','${contextPath}/login')">
            <button type="button" class="btn btn-default btn-round ">글쓰기</button>
        </a>
    </div>
</div>
</div>




<script>

    let options = {
        numberPerPage: 10, //Cantidad de datos por pagina
        goBar: true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
        pageCounter: true, //Contador de paginas, en cual estas, de cuantas paginas
    };

    let filterOptions = {
        el: '#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
    };

    paginate.init('.myTable', options, filterOptions);
</script>
</body>
</html>












