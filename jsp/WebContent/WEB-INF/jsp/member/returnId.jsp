<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<main class="login">
	<form method="post" class="returnId" id="returnId"">
		<fieldset>
		<h1>아이디 찾기</h1>
		<p>${param.name}/${param.email}으로 찾은 아이디입니다.<p>
		<div class="form-group">
		<div>
	      <input type="text" class="form-control" name="returnId" id="returnId" value='${param.id}' disabled>
		</div>
	    </div>
		<a href="index.html" class="btn btn-primary mt-3" id="btnLogin">메인</a>
		<div></div>
		</fieldset>
	</form>
</main>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>