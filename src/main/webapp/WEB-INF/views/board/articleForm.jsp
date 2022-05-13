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
            <td align="left"><input type="file" name="imageFileName"  onchange="readURL(this);" /></td>
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
        height: 300,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",					// 한글 설정
        placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
        callbacks: {	//여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files) {
                uploadSummernoteImageFile(files[0],this);
            },
            onPaste: function (e) {
                var clipboardData = e.originalEvent.clipboardData;
                if (clipboardData && clipboardData.items && clipboardData.items.length) {
                    var item = clipboardData.items[0];
                    if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
                        e.preventDefault();
                    }
                }
            }
        },
        toolbar: [
            // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture','link','video']],
            ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

    });
    function uploadSummernoteImageFile(file, editor) {
        data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "/uploadSummernoteImageFile",
            contentType : false,
            processData : false,
            success : function(data) {
                //항상 업로드된 파일의 url이 있어야 한다.
                $(editor).summernote('insertImage', data.url);
            }
        });
    }


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


</script>

</body>
</html>





