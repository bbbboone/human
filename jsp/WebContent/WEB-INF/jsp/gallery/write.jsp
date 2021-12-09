<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp"/>
<style>
.gdetail table {width: 800px; margin: 100px auto; border-collapse: collapse;}
.gdetail td {padding: 8px; border-top: 1px solid #bbb; border-bottom: 1px solid #bbb;}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<main class="gdetail">
<form method="post" enctype="multipart/form-data" onsubmit="return checkGWrite()">
<table>
	<tr>
		<td><input type="text" name="title" id="title" class="form-control"></td>
	</tr>
	<tr>
		<td><input class="form-control" type="file" name="file1" id="file1" accept="image/png, image/jpeg, image/gif"></td>
	</tr>
	<tr>
		<td><input class="form-control" type="file" name="file2" id="file2" accept="image/png, image/jpeg, image/gif"></td>
	</tr>
	<tr>
		<td><input class="form-control" type="file" name="file3" id="file3" accept="image/png, image/jpeg, image/gif"></td>
	</tr>
	<tr>
		<td>
			<div class="float-end">
				<button type="button" class="btn btn-secondary" id="btnGCl">취소</button>
				<button type="submit" class="btn btn-secondary"  id="btnGWrite">작성</button>
			</div>
		</td>
	</tr>
</table>
</form>
</main>
<script>
function checkGWrite() {
	var titleLen = $("#title").val().trim().length;
    
    if(!titleLen) {
        alert("제목을 입력하세요.");
        $("#title").focus();
        return false;
    }
    
    if(!($("#file1").val() || $("#file2").val() || $("#file3").val())) {
    	alert("파일을 첨부해주세요.")
    	return false;
    } 
}
$(function() {
	$("#btnGCl").click(function() {
		history.back();
	});
})
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>