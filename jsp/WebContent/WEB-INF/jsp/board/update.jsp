<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp"/>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<main class="write">
<form method="post" onsubmit="return checkWrite()">
	<table>
		<tr>
			<td><input type="text" name="title" id="title" placeholder="제목을 입력해주세요" value='${board.title}'></td>
		</tr>
		<tr>
			<td><textarea name="content" id="content" placeholder="내용을 입력해주세요">${board.content}</textarea></td>
		</tr>
		<tr>
			<td>
				<div class="float-end">
					<button type="button" class="btn btn-secondary" id="btnCl">취소</button>
					<button type="submit" class="btn btn-secondary" id="btnWrite">수정</button>
				</div>
			</td>
		</tr>
	</table>
</form>
</main>
<script>
function checkWrite() {
	var titleLen = $("#title").val().trim().length;
    var contentLen = $("#content").val().trim().length;

    if(!titleLen) {
        alert("제목을 입력하세요");
        $("#title").focus();
        return false;
    }
    
    if(!contentLen) {
        alert("내용을 입력하세요");
        $("#content").focus();
        return false;
    }
}

$(function() {
	$("#btnCl").click(function() {
		history.back();
	});
})
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>