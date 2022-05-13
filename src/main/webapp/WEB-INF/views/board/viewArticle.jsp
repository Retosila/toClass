<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" session="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%--
<c:set var="article"  value="${articleMap.article}"  />
<c:set var="imageFileList"  value="${articleMap.imageFileList}"  />

 --%>
<%
    request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>글보기</title>

    <style>
        #tr_file_upload {
            display: none;
        }

        #tr_btn_modify {
           /* display: none;*/
        }
    </style>
    <script src="${contextPath}/assets/js/paginate.js"
            type="text/javascript"></script>
    <link href="${contextPath}/assets/css/ligne.css" rel="stylesheet"/>
    <link href="${contextPath}/assets/css/paginate.css" rel="stylesheet"/>

</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <H6 class="display-4">자유게시판</H6>
        </div>
        <div class="col-md-6" align="right">
            <button class="btn btn-secondary btn-round" type=button
                    onClick="location.replace('${contextPath}/board/listArticles.do');">목록으로
            </button>
            <%--<input class="btn btn-secondary btn-round" type=button value="답글쓰기"
                   onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.articleNO})">--%>
        </div>
    </div>

    <form name="frmArticle" method="post" action="${contextPath}" enctype="multipart/form-data">

        <div class="row" style="background: #F4F4F5;border-color:gainsboro;border-top-style: solid; border-top-width: thin; border-bottom-style: solid; border-bottom-width: thin;">
            <div class="col-md-6"><h5><input type=text value="${article.title }"  style="padding-top: 8px;border:0 solid black;font-weight: 800;" name="title"  id="i_title" disabled/></h5></div>

            <div class="col-md-6">
                <p style="margin-bottom: 0px; text-align: right;font-size: 1em;padding-top: 10px;">${article.writeDate}</p>
            </div>
        </div>
        <div class="row" style=" border-color:gainsboro;border-bottom-style: solid; border-bottom-width: thin;">
            <div class="col-md-6"
                 style="font-weight:300; text-align:left; font-size: 0.8em; margin-top: 2px;">
                <p style="margin-bottom:5px;padding-top: 5px;font-size: 0.9em;">${article.member_name}</p></div>

            <div class="col-md-6"><p style="margin-bottom:5px;padding-top: 5px; text-align: right;font-size: 0.9em;">조회 ${article.views}
                추천 ${article.good+article.bad}
                댓글 ${article.views}</p></div>
        </div>
        <div style="border-color: #F9FAFB;">

            <div style="font-size: 0.4em; margin-bottom: 0px; text-align: right;"><a onclick="clip()">${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}</a>
            </div>
        </div>


        <c:choose>
        <c:when test="${not empty article.imageFileName }">
        <div class="input-slider-container col-md-12" style="min-height: 200px;">

            <div><p>${article.title }</p></div>
        </div>
        <input type="hidden" name="originalFileName" value="${article.imageFileName }"/>
        <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}"
             id="preview" width="300" height="200"/><br>
        </c:when>
        <c:otherwise>
        <div class="input-slider-container" style="min-height: 200px;">
            <div class="slider"></div>
            <br>
            <div class="slider slider-primary" rows="20" cols="60"
                 name="content">${article.content}</div>
        </div>
        </c:otherwise>
        </c:choose>

        <br>
        <div align="center">
            <div class="row">
                <div class="col-md-5" style="text-align: right">
                    <a
                       href="${contextPath}/board/good.do?articleNO=${article.articleNO}"
                       type="button" style="margin-right: 5px"><img src="/assets/img/good.PNG" class="card-img"
                                                                    height="40"></a>
                </div>
                <div class="col-md-2">
                    <h3 style="padding-top: 3px;" class="display-4">${article.good+article.bad}</h3>
                </div>
                <div class="col-md-5" style="text-align: left">
                    <a
                       href="${contextPath}/board/bad.do?articleNO=${article.articleNO}"
                       type="button" style="margin-left: 5px"><img src="/assets/img/bad.PNG" class="card-img"
                                                                   height="40"></a>
                </div>
            </div>
            <br>
            <br>

            <div class="row">
                <div class="col-md-12">
                    <div id="tr_btn">
                        <c:if test="${member.member_name == article.member_name }">
                            <input class="btn btn-secondary btn-round" type=button value="수정하기"
                                   onClick=location.href="${contextPath}/board/modArticleForm?articleNO=${article.articleNO}">
                            <input class="btn btn-secondary btn-round" type=button value="삭제하기"
                                   onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
                        </c:if>

                    </div>
                    <br>

                </div>
            </div>


        </div>
    </form>
</div>

<br>
<br>

<div class="container ">
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

        <c:forEach var="article1" items="${articlesList}" varStatus="articleNum">

            <tr align="center">
                <td width="7%">${article1.articleNO}</td>
                <td align='left' width="40%"><span
                        style="padding-right: 30px"></span>
                    <c:if test="${article1.articleNO == article.articleNO}">
                        <a class='cls1' style="font-size:1.1em;font-weight:700;color: #0065FF;"
                           href="${contextPath}/board/viewArticle.do?articleNO=${article1.articleNO}">${article1.title}</a>
                    </c:if>
                    <c:if test="${article1.articleNO != article.articleNO}">
                        <a class='cls1'
                           href="${contextPath}/board/viewArticle.do?articleNO=${article1.articleNO}">${article1.title}</a>
                    </c:if>
                </td>
                <td width="15%">${article1.member_name}</td>
                <td width="15%">${article1.writeDate}</td>
                <td width="7%">${article1.views }</td>
                <td width="7%">${article1.good+article1.bad}</td>
            </tr>
        </c:forEach>
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


<script type="text/javascript">

    function fn_enable(obj) {

        document.getElementById("i_title").disabled = false;
        document.getElementById("i_content").disabled = false;
        document.getElementById("i_imageFileName").disabled = false;
        document.getElementById("tr_btn_modify").style.display = "block";

        document.getElementById("tr_file_upload").style.display = "block";
        document.getElementById("tr_btn").style.display = "none";
    }

    function fn_modify_article(obj) {
        obj.action = "${contextPath}/board/modArticle.do";
        obj.submit();
    }

    function fn_remove_article(url, articleNO) {
        var form = document.createElement("form");
        form.setAttribute("method", "post");
        form.setAttribute("action", url);
        var articleNOInput = document.createElement("input");
        articleNOInput.setAttribute("type", "hidden");
        articleNOInput.setAttribute("name", "articleNO");
        articleNOInput.setAttribute("value", articleNO);

        form.appendChild(articleNOInput);
        document.body.appendChild(form);
        form.submit();

    }

    function fn_reply_form(url, parentNO) {
        var form = document.createElement("form");
        form.setAttribute("method", "post");
        form.setAttribute("action", url);
        var parentNOInput = document.createElement("input");
        parentNOInput.setAttribute("type", "hidden");
        parentNOInput.setAttribute("name", "parentNO");
        parentNOInput.setAttribute("value", parentNO);

        form.appendChild(parentNOInput);
        document.body.appendChild(form);
        form.submit();
    }

    function clip() {
        var url = '';
        var textarea = document.createElement("textarea");
        document.body.appendChild(textarea);
        url = window.document.location.href;
        textarea.value = url;
        textarea.select();
        document.execCommand("copy");
        document.body.removeChild(textarea);
        alert("URL이 복사되었습니다.")
    }
</script>
</body>
</html>
