<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<main class="login">
	<form method="post">
		<fieldset>
		<h2>비밀번호를 변경해주세요.</h2>
		<div class="form-group">
	      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="새 비밀번호를 입력해주세요">
	      <input type="password" class="form-control" name="pwdCk" id="pwdCk" placeholder="새 비밀번호를 다시 입력해주세요">
	    </div>
		<button type="submit" class="btn btn-primary" id="btnLg">메인</button>
		</fieldset>
	</form>
</main>
<script>

</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>