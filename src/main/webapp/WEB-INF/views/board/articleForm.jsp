<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="en">


<!-- include libraries(jQuery, bootstrap) -->
<link href="${contextPath}/assets/css/bootstarp_summernote.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script src="${contextPath}/assets/js/summernote-ko-KR.min.js"></script>

<body>



<div class="container">
<form name="articleForm" method="post"
      action="${contextPath}/board/addNewArticle.do"
      enctype="multipart/form-data">
    <table border="0" align="center" style="width: 800px;">
        <tr>
            <td><input style="display: none;" type="text"
                       value="${member.member_name}" readonly />
            <td>

        </tr>
        <tr>

            <td><input type="text" placeholder="제목"
                       class="form-control" name="title" style="width: 100%"></td>
        </tr>
        <tr>
            <td colspan="2"><textarea id="summernote" name="content"
                                      align="center"></textarea></td>
        </tr>
        <tr>
            <td align="left"><input class="btn btn-secondary" type="button"
                                    value="파일 추가" onClick="fn_addFile()" /></td>
        </tr>
        <tr>
            <td colspan="4"><div id="d_file"></div></td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td align="center" colspan="4"><input class="btn btn-default"
                                                  type="submit" value="글쓰기" /> <input class="btn btn-secondary"
                                                                                      type=button value="목록보기" onClick="backToList(this.form)" /></td>
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
</script>

</body>
</html>





