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
<head>

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">

        <title>

        </title>
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <!-- Nucleo Icons -->
        <link href="${contextPath}/assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <link href="${contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
        <link href="${contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link href="${contextPath}/assets/css/argon-design-system.css?v=1.2.2" rel="stylesheet" />
    	 <!-- include summernote css/js -->
    <link
            href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
            rel="stylesheet">
    <script
            src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>


<body>
<div class="container pt-lg-7 pb-lg-7">
<form name="articleForm" method="post"
      action="${contextPath}/board/addNewArticle.do"
      enctype="multipart/form-data">
    <table border="0" align="center" style="width: 800px;">
        <tr>
            <td><input style="display: none;" type="text"
                       value="${member.member_email}" readonly />
            <td>

        </tr>
        <tr>
            <td width="20%" style="text-align: center;" align="center">제목</td>
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
        height : 300
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













<script href="${contextPath}/assets/js/core/jquery.min.js" type="text/javascript"></script>
<script href="${contextPath}/assets/js/core/popper.min.js" type="text/javascript"></script>
<script href="${contextPath}/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<script href="${contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script href="${contextPath}/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script href="${contextPath}/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<script href="${contextPath}/assets/js/plugins/moment.min.js"></script>
<script href="${contextPath}/assets/js/plugins/datetimepicker.js" type="text/javascript"></script>
<script href="${contextPath}/assets/js/plugins/bootstrap-datepicker.min.js"></script>
<!-- Control Center for Argon UI Kit: parallax effects, scripts for the example pages etc -->
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<script href="${contextPath}/assets/js/argon-design-system.min.js?v=1.2.2" type="text/javascript"></script>
<script>
    function scrollToDownload() {

        if ($('.section-download').length != 0) {
            $("html, body").animate({
                scrollTop: $('.section-download').offset().top
            }, 1000);
        }
    }
</script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
<script>
    window.TrackJS &&
    TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-design-system-pro"
    });
</script>
</body>
</html>





