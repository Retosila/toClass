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
    <title>Title</title>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="${contextPath}/assets/css/bootstarp_summernote.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <script src="${contextPath}/assets/js/summernote-ko-KR.min.js"></script>
    <script>
        document.getElementById("i_title").disabled=false;
        document.getElementById("i_content").disabled=false;
        document.getElementById("i_imageFileName").disabled=false;
        document.getElementById("tr_btn_modify").style.display="block";
        document.getElementById("tr_file_upload").style.display="block";
        document.getElementById("tr_btn").style.display="none";
    </script>
</head>
<body>
<div class="container">
    <form name="articleForm" method="post"
          action="${contextPath}/board/modArticle.do?articleNO=${article.articleNO}"
          enctype="multipart/form-data">
        <table border="0" align="center" style="width: 800px;">
            <tr>
                <td><input style="display: none;" type="text"
                           value="${member.member_name}" readonly />
                <td>
                <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
            </tr>
            <tr>

                <td><input type="text" placeholder="제목"
                           class="form-control" value="${article.title}" style="width: 100%" ></td>
            </tr>
            <tr>
                <td colspan="2"><textarea id="summernote" name="content"
                                          align="center">${article.content}</textarea></td>

            </tr>

            <tr>
                <td colspan="4"><div id="d_file"></div></td>
            </tr>
            <tr>
            </tr>
            <c:choose>
                <c:when test="${not empty article.imageFileName && article.imageFileName!='null' }">
                    <tr>
                        <td>
                            <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />

                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td ></td>
                        <td>
                            <input  type="file"  name="imageFileName" id="i_imageFileName"   value="${article.imageFileName}"   onchange="${article.imageFileName}"   />
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr  id="tr_file_upload" >
                        <td>
                            <input  type= "hidden"   name="originalFileName" value="${article.imageFileName}" />
                        </td>
                    </tr>
                    <tr>
                        <td ></td>
                        <td>

                            <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
            <tr>
                <td align="center" colspan="4">
                    <input class="btn btn-default" type="submit" value="수정하기" />
                    <input class="btn btn-secondary" type=button value="수정취소" onClick=location.href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}"> </td>
            </tr>
        </table>
    </form>

</div>
<script>
    $('#summernote').summernote({
        placeholder : '공지사항 필독!',
        tabsize : 2,
        height : 300,
        lang: "ko-KR"

    });



</script>
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    function backToList(obj) {
        obj.action = "${contextPath}/board/listArticles.do";
        obj.submit();
    }

    var cnt = 1;
    function fn_addFile() {
        $("#d_file").append(
            "<br>" + "<input type='file' name='file"+cnt+"' />");
        cnt++;
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
</body>
</html>
