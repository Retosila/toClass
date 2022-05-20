<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>알림장(교사)</title>

    <script>

        var studentEmailList = {};
        var studentNameList = {};

        function sendNotice() {
            frmNotice.submit();
            alert("알림장 전송완료");
        }

        $(document).ready(function () {
            $("#student_name_list").on("change", function () {
                console.log("클릭!");
                var selectedStudentEmail = $("#student_name_list option:selected").val();
                var selectedStudentName = $("#student_name_list option:selected").text();
                console.log(selectedStudentEmail);
                console.log(selectedStudentName);

                // 전체, 한 학생 말고 특정 몇 명의 학생에게만 보내는 것 차후에 구현할 예정
                $("#notice_receiver_name").val(selectedStudentName);
                $("#notice_receiver").val(selectedStudentEmail);

            });
        });

    </script>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="${contextPath}/assets/css/bootstarp_summernote.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <script src="${contextPath}/assets/js/summernote-ko-KR.min.js"></script>
</head>
<body>
<div class="container">
    <form id="frmNotice" action="${contextPath}/board/sendNotice.do" method="post">
        <fieldset>

            <input id="notice_sender" name="notice_sender" type="hidden" value="${member.member_email}"/><br>
            알림장 제목 <input id="notice_title" class="form-control" name="notice_title" type="text" placeholder="제목"/><br>

            알림장 수신자 <input id="notice_receiver_name" class="form-control" name="notice_receiver_name" type="text"
                           readonly/><br>

            수신자 선택 <select id="student_name_list" class="custom-select" name="student_name_list">
            <option class="student_tag" value="select_all">전체</option>
            <c:forEach var="student" items="${studentList}">
                <option class="student_tag" value="${student.member_email}">${student.member_name}</option>
            </c:forEach>
        </select>
			<br>
            <input id="notice_receiver" class="form-control" name="notice_receiver" type="hidden"/><br>

            알림장 내용 <textarea id="summernote" name="notice_content" placeholder="가정통신문 제목"></textarea><br>
            <div class="text-right">
                <button id="sendButton" class="btn btn-default" type="button" onClick="sendNotice()">보내기</button>
            </div>
        </fieldset>


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
            onImageUpload: function (files) {
                uploadSummernoteImageFile(files[0], this);
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
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor', 'color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture', 'link', 'video']],
            ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']

    });

    function uploadSummernoteImageFile(file, editor) {
        data = new FormData();
        data.append("file", file);
        $.ajax({
            data: data,
            type: "POST",
            url: "/uploadSummernoteImageFile",
            contentType: false,
            processData: false,
            success: function (data) {
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
            reader.onload = function (e) {
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
