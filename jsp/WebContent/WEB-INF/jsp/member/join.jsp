<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"></jsp:include>
	<style>
	.msg {height: 20px;}
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<main class="login">
	<form method="post" class="form-group" name="joinForm" onsubmit="return checkJoin()" id="joinForm">
		<fieldset>
			<legend>회원가입</legend>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" class="form-control mb-3">
			<div class="invalid-feedback"></div>
			
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd" class="form-control mb-3">
			<div class="invalid-feedback"></div>
			
			<label for="pwdCk">비밀번호 확인</label>
			<input type="password" name="pwdCk" id="pwdCk" class="form-control mb-3">
			<div class="invalid-feedback"></div>
			
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" class="form-control mb-3">
			<div class="invalid-feedback"></div>
			
			<label for="name">이름</label>
			<input type="text" name="name" id="name" class="form-control mb-3">
			<div class="invalid-feedback"></div>
			
			<button class="btn btn-primary " id="btnJoin" type="submit">회원가입</button>
		</fieldset>
	</form>
</main>
<script>
function checkJoin() {
	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getName = RegExp(/^[가-힣]+$/);
	
	$(".form-control").next().text("");
	$("#id").removeClass("is-invalid");
	$("#pwd").removeClass("is-invalid");
	$("#npwd").removeClass("is-invalid");
	$("#pwdCk").removeClass("is-invalid");
	$("#email").removeClass("is-invalid");
	$("#name").removeClass("is-invalid");
	
	if($("#id").val() == ""){
		$("#id").addClass("is-invalid");
		$("#id").next().text("필수 정보입니다.");
		$("#id").focus();
		return false;
	}

	if(!getCheck.test($("#id").val())){
		$("#id").addClass("is-invalid");
		$("#id").next().text("아이디를 형식에 맞게 입력해주세요");
		$("#id").val("");
		$("#id").focus();
		return false;
	}
     
	if($("#pwd").val() == ""){
		$("#pwd").addClass("is-invalid");
		$("#pwd").next().text("필수 정보입니다.");
		$("#pwd").focus();
		return false;
	}

	if(!getCheck.test($("#pwd").val())) {
		$("#pwd").addClass("is-invalid");
		$("#pwd").next().text("비밀번호를 형식에 맞게 입력해주세요");
		$("#pwd").val("");
		$("#pwd").focus();
		return false;
	}

	if ($("#id").val() == ($("#pwd").val())) {
		$("#pwd").addClass("is-invalid");
		$("#pwd").next().text("비밀번호가 아이디랑 다르게 입력해주세요");
	    $("#pwd").val("");
	    $("#pwd").focus();
	    return false;
	}

	if($("#pwd").val() != ($("#pwdCk").val())){ 
		$("#pwdCk").addClass("is-invalid");
		$("#pwdCk").next().text("비밀번호를 다시 확인해주세요");
		$("#pwdCk").val("");
		$("#pwdCk").focus();
		return false;
	}

	if($("#email").val() == ""){
		$("#email").addClass("is-invalid");
		$("#email").next().text("필수 정보입니다.");
		$("#email").focus();
		return false;
	}
          
	if(!getMail.test($("#email").val())){
		$("#email").addClass("is-invalid");
		$("#email").next().text("이메일형식에 맞게 입력해주세요")
		$("#email").val("");
		$("#email").focus();
		return false;
	}
     
	if($("#name").val() == ""){
		$("#name").addClass("is-invalid");
		$("#name").next().text("필수 정보입니다.");
		$("#name").focus();
		return false;
	}

	if (!getName.test($("#name").val())) {
		$("#name").addClass("is-invalid");
		$("#name").next().text("이름을 다시 입력해주세요");
		$("#name").val("");
		$("#name").focus();
		return false;
	}
	
	if($("#id").val() && $("#email").val()) {
		var flag = false;
		$.ajax("idValid?id="+$("#id").val()+"&email="+$("#email").val() , {
			async: false,
			success : function(data) {
				if(data %2 == 1) {
					$("#id").addClass("is-invalid");
					$("#id").next().text("이미 가입된 id입니다");
					$("#id").val("");
					$("#id").focus();
				} else if(data >= 2) {
					$("#email").addClass("is-invalid");
					$("#email").next().text("이미 가입된 이메일입니다");
					$("#email").val("");
					$("#email").focus();
				} else {
					flag = true;
				}
			}
		});
		return flag;
	}
}
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>