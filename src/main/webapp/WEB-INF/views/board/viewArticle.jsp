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
                <th style="text-align: left;padding-left: 11px;"><h6 style="font-weight: 800;margin-bottom: 0px;">${article.title }</h6></th>
                <th><p style="margin-bottom: 0px; text-align: right;font-size: 0.8em;padding-top: 2px;">${article.writeDate}</p></th>
            </tr>
            <tr>
                <th style="font-weight:300;text-align: left;padding-left: 11px;font-size: 0.8em;margin-bottom: 0px;padding-top: 5px;"><a>${article.member_name }</a></th>

                <th><p style="margin-bottom: 0px; text-align: right;font-size: 0.8em;">조회 ${article.views} 추천 ${article.views}
                    댓글 ${article.views}</p></th>
            </tr>
            <tr style="border-color: #F9FAFB;">
                <th></th>
                <th style="font-size: 0.4em; margin-bottom: 0px; text-align: right;"><a onclick="clip()">${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}</a>
                </th>
            </tr>

            <%--
   <c:if test="${not empty imageFileList && imageFileList!='null' }">
        <c:forEach var="item" items="${imageFileList}" varStatus="status" >
              <tr>
                  <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
                    이미지${status.count }
                 </td>
                 <td>
                   <input  type= "hidden"   name="originalFileName" value="${item.imageFileName }" />
                  <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${item.imageFileName}" id="preview"  /><br>
                 </td>
                </tr>
                <tr>
                  <td>
                     <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
                  </td>
               </tr>
          </c:forEach>
   </c:if>
        --%>

            <c:choose>
                <c:when test="${not empty article.imageFileName }">
                    <tr>
                        <td style="border-color: #F9FAFB;">

                            <div class="input-slider-container" style="padding-left: 11px;">
                                <div id="sliderRegular" class="slider"></div>
                                <br>
                                <div id="sliderDouble" class="slider slider-primary" rows="20" cols="60"
                                     name="content">${article.content }</div>
                            </div>
                            <input type="hidden" name="originalFileName" value="${article.imageFileName }"/>
                            <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}"
                                 id="preview" width="300" height="200"/><br>
                        </td>

                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td style="border-color: #F9FAFB;">

                            <div class="input-slider-container" style="padding-left: 11px;">
                                <div id="sliderRegular" class="slider"></div>
                                <br>
                                <div id="sliderDouble" class="slider slider-primary" rows="20" cols="60"
                                     name="content">${article.content }</div>
                            </div>

                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>


            <tr id="tr_btn">
                <td colspan="2" align="center">
                    <c:if test="${member.member_name == article.member_name }">
                        <input  class="btn btn-secondary btn-round" type=button value="수정하기" onClick="fn_enable(this.form)">
                        <input class="btn btn-secondary btn-round" type=button value="삭제하기"
                               onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
                    </c:if>
                    <input class="btn btn-secondary btn-round" type=button value="리스트로 돌아가기" onClick="backToList(this.form)">
                    <input class="btn btn-secondary btn-round" type=button value="답글쓰기"
                           onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.articleNO})">
                </td>
            </tr>


            <tr id="tr_btn_modify" align="center">
                <td colspan="2">
                    <input type=button value="수정반영하기" onClick="fn_modify_article(frmArticle)">
                    <input type=button value="취소" onClick="backToList(frmArticle)">
                </td>
            </tr>


            </tbody>

        </table>

    </form>

</div>

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
