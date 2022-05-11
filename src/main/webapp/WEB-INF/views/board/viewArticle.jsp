<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
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
            display: none;
        }

    </style>
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
    <script type="text/javascript">
        function backToList(obj) {
            obj.action = "${contextPath}/board/listArticles.do";
            obj.submit();
        }

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

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#preview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</head>
<body>


<div class="container">
    <form name="frmArticle" method="post" action="${contextPath}" enctype="multipart/form-data">


        <table class="myTable table hover col-12">
            <tbody>
            <tr style="background: #F4F4F5">
                <th style="text-align: left;padding-left: 11px;"><h6
                        style="font-weight: 800;margin-bottom: 0px;">${article.title }</h6></th>
                <th>
                    <p style="margin-bottom: 0px; text-align: right;font-size: 0.8em;padding-top: 2px;">${article.writeDate}</p>
                </th>
            </tr>
            <tr>
                <th style="font-weight:300;text-align: left;padding-left: 11px;font-size: 0.8em;margin-bottom: 0px;padding-top: 5px;">
                    <a>${article.member_name }</a></th>

                <th><p style="margin-bottom: 0px; text-align: right;font-size: 0.8em;">조회 ${article.views}
                    추천 ${article.views}
                    댓글 ${article.views}</p></th>
            </tr>
            <tr style="border-color: #F9FAFB;">
                <th></th>
                <th style="font-size: 0.4em; margin-bottom: 0px; text-align: right;"><a onclick="clip()">${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}</a>
                </th>
            </tr>
            </tbody>

        </table>

    </form>


    <c:choose>
        <c:when test="${not empty article.imageFileName }">
            <div class="input-slider-container" style="padding-left: 11px;">
                <div id="sliderRegular" class="slider"></div>
                <br>
                <div id="sliderDouble" class="slider slider-primary" rows="20" cols="60"
                     name="content">${article.content }</div>
            </div>
            <input type="hidden" name="originalFileName" value="${article.imageFileName }"/>
            <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}"
                 id="preview" width="300" height="200"/><br>
        </c:when>
        <c:otherwise>
            <div class="input-slider-container" style="padding-left: 11px;">
                <div class="slider"></div>
                <br>
                <div class="slider slider-primary" rows="20" cols="60"
                     name="content">${article.content }</div>
            </div>
        </c:otherwise>
    </c:choose>


    <div align="center">
        <div class="row col-3" >
            <button class="btn btn-secondary btn-round" onClick="#" style="margin-right: 5px"><img src="/assets/img/good.png" class="card-img"
                                                                         height="40"></button>
            <h3 style="padding-top: 3px" class="display-4">11</h3>
            <button class="btn btn-secondary btn-round" onClick="#" style="margin-left: 5px"><img src="/assets/img/bad.png" class="card-img"
                                                                         height="40"></button>
        </div>

        <br>
        <br>
        <div id="tr_btn">

            <c:if test="${member.member_name == article.member_name }">
                <input class="btn btn-secondary btn-round" type=button value="수정하기" onClick="fn_enable(this.form)">
                <input class="btn btn-secondary btn-round" type=button value="삭제하기"
                       onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
            </c:if>
            <button class="btn btn-secondary btn-round" type=button onClick="location.replace('${contextPath}/board/listArticles.do');">목록으로</button>
            <input class="btn btn-secondary btn-round" type=button value="답글쓰기"
                   onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.articleNO})">

        </div>


        <div id="tr_btn_modify" align="center">

            <input type=button value="수정반영하기" onClick="fn_modify_article(frmArticle)">
            <input type=button value="취소" onClick="backToList(frmArticle)">

        </div>
    </div>

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
                        <td width="15%">${article.member_name}</td>
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


<script type="text/javascript">

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
