<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<main class="login">
	<form method="post" onsubmit="return checkLogin()" id="frmLg">
		<fieldset>
		<legend>로그인</legend>
		<div class="form-group">
	      <label for="id" class="form-label mt-4">아이디</label>
	      <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해주세요">
	      <div class="invalid-feedback"></div>
	      <label for="pwd" class="form-label mt-4">비밀번호</label>
	      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요">
	      <div class="invalid-feedback"></div>
	    </div>
		<div class="form-check">
        <label class="form-check-label" for="savedId">
        <input class="form-check-input" type="checkbox" value="" checked="" name="savedId" id="savedId">
          아이디 저장
        </label>
      	</div>
		<button type="submit" class="btn btn-primary" id="btnLg">로그인</button>
		<div></div>
		<div class="find">
		<a href="join">회원가입</a>
		<a href="findId">ㅣ 아이디 찾기</a>
		<a href="findPwd">ㅣ 비밀번호 찾기</a>
		</div>
		</fieldset>
	</form>
</main>
<jsp:include page="../common/footer.jsp"/>
<script>
$(function() {
	if($.cookie("savedId")) {
		$("#id").val($.cookie("savedId"));
		$("#savedId").prop("checked",true);
	}
}); // 아이디 저장

function checkLogin() {
	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	
	$(".form-control").next().text("");
	$("#id").removeClass("is-invalid");
	$("#pwd").removeClass("is-invalid");
	
	if($("#id").val() == ""){
		$("#id").addClass("is-invalid");
		$("#id").next().text("필수 정보입니다.");
		$("#id").focus();
		return false;
	}
    
	if($("#pwd").val() == ""){
		$("#pwd").addClass("is-invalid");
		$("#pwd").next().text("필수 정보입니다.");
		$("#pwd").focus();
		return false;
	}
	
	if($("#id").val() && $("#pwd").val()) {
		var flag = false;
		$.ajax("loginValid?id="+$("#id").val()+"&pwd="+$("#pwd").val() , {
			async: false,
			success : function(data) {
				if(data == 0) {
					$("#btnLg").next().text("아이디와 비밀번호를 정확히 입력해 주세요.");
				} else {
					flag = true;
				}
			}
		});
		return flag;
	}
}
</script>
</body>
</html>