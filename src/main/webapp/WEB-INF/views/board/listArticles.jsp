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
    <link rel="apple-touch-icon" sizes="76x76"
          href="./assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="./assets/img/favicon.png">
    <title></title>
    <!--     Fonts and icons     -->
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
            rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
          rel="stylesheet">
    <!-- Nucleo Icons -->
    <link href="${contextPath}/assets/css/nucleo-icons.css" rel="stylesheet"/>
    <link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <link href="${contextPath}/assets/css/font-awesome.css" rel="stylesheet"/>
    <link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- CSS Files -->
    <link href="${contextPath}/assets/css/argon-design-system.css?v=1.2.2"
          rel="stylesheet"/>

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

</head>
<body>
<div class="container pt-lg-5 pb-lg-5" align="center">
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
                <c:forEach var="article" items="${articlesList }" varStatus="articleNum">
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
                        <td width="15%">${article.member_email }</td>
                        <td width="15%">${article.writeDate}</td>
                        <td width="7%">${article.views }</td>
                        <td width="7%"></td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>


    </table>

    <hr style="margin-top: 0px;margin-bottom: 3px;">


    <div class="form-group row">
        <div class="input-group input-group-alternative col-2">
            <div class="input-group-prepend">
					<span class="input-group-text"><i
                            class="ni ni-zoom-split-in"></i></span>
            </div>
            <input class="form-control" placeholder="검색" type="text">
        </div>


        <div class="col-10" align="right">
            <a
            <%--href="javascript:fn_articleForm('${LogOn}','${contextPath}/board/articleForm.do','${contextPath}/member/loginForm.do')">--%>
                    href="javascript:fn_articleForm('${logOn}','${contextPath}/board/articleForm.do','${contextPath}/login')">
                <button type="button" class="btn btn-default btn-round ">글쓰기</button>
            </a>
        </div>
    </div>


    <ul class="pagination pagination-sm col-3">
        <li class="page-item"><a class="page-link" href="javascript:;"><i
                class="fa fa-angle-left"></i></a></li>
        <li class="page-item"><a class="page-link" href="javascript:;">1</a>
        </li>
        <li class="page-item active"><a class="page-link"
                                        href="javascript:;">2</a></li>
        <li class="page-item"><a class="page-link" href="javascript:;">3</a>
        </li>
        <li class="page-item"><a class="page-link" href="javascript:;">4</a>
        </li>
        <li class="page-item"><a class="page-link" href="javascript:;">5</a>
        </li>
        <li class="page-item"><a class="page-link" href="javascript:;"><i
                class="fa fa-angle-right"></i></a></li>
    </ul>
</div>


<script href="${contextPath}/assets/js/core/jquery.min.js"
        type="text/javascript"></script>
<script href="${contextPath}/assets/js/core/popper.min.js"
        type="text/javascript"></script>
<script href="${contextPath}/assets/js/core/bootstrap.min.js"
        type="text/javascript"></script>
<script
        href="${contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script href="${contextPath}/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script href="${contextPath}/assets/js/plugins/nouislider.min.js"
        type="text/javascript"></script>
<script href="${contextPath}/assets/js/plugins/moment.min.js"></script>
<script href="${contextPath}/assets/js/plugins/datetimepicker.js"
        type="text/javascript"></script>
<script
        href="${contextPath}/assets/js/plugins/bootstrap-datepicker.min.js"></script>
<!-- Control Center for Argon UI Kit: parallax effects, scripts for the example pages etc -->
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<script
        href="${contextPath}/assets/js/argon-design-system.min.js?v=1.2.2"
        type="text/javascript"></script>

<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>

</body>
</html>












