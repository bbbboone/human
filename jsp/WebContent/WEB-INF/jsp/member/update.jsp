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
<main class="login p-5">
	<form method="post" class="form-group" name="updateForm" onsubmit="return checkUpdate()" id="updateForm">
		<fieldset>
			<legend>정보 수정</legend>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" class="form-control" value='${sessionScope.member.id}' disabled>
			<div class="invalid-feedback"></div>
			
			<label for="pwd">기존 비밀번호</label>
			<input type="password" name="pwd" id="pwd" class="form-control">
			<div class="invalid-feedback"></div>
			
			<label for="npwd">새 비밀번호</label>
			<input type="password" name="npwd" id="npwd" class="form-control">
			<div class="invalid-feedback"></div>
			
			<label for="pwdCk">새 비밀번호 확인</label>
			<input type="password" name="pwdCk" id="pwdCk" class="form-control">
			<div class="invalid-feedback"></div>
			
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" class="form-control" value='${sessionScope.member.email}'>
			<div class="invalid-feedback"></div>
			
			<label for="name">이름</label>
			<input type="text" name="name" id="name" class="form-control" value='${sessionScope.member.name}'>
			<div class="invalid-feedback"></div>
			
			<button class="btn btn-primary " id="btnUpdate" type="submit">저장</button>
		</fieldset>
	</form>
</main>
<script>
function checkUpdate() {
	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getName = RegExp(/^[가-힣]+$/);
	var xpwd = '${sessionScope.member.pwd}';
	
	$(".form-control").next().text("");
	$("#pwd").removeClass("is-invalid");
	$("#npwd").removeClass("is-invalid");
	$("#pwdCk").removeClass("is-invalid");
	$("#email").removeClass("is-invalid");
	$("#name").removeClass("is-invalid");
	
	if(xpwd != $("#pwd").val()) {
		$("#pwd").addClass("is-invalid");
		$("#pwd").next().text("비밀번호를 정확하게 입력해주세요.");
		$("#pwd").focus();
		return false;
	}

	if($("#pwd").val() == ""){
		$("#pwd").addClass("is-invalid");
		$("#pwd").next().text("필수 정보입니다.");
		$("#pwd").focus();
		return false;
	}

	if($("#npwd").val() == ""){
		$("#npwd").addClass("is-invalid");
		$("#npwd").next().text("필수 정보입니다.");
		$("#npwd").focus();
		return false;
	}

	if(!getCheck.test($("#npwd").val())) {
		$("#npwd").addClass("is-invalid");
		$("#npwd").next().text("비밀번호를 형식에 맞게 입력해주세요");
		$("#npwd").val("");
		$("#npwd").focus();
		return false;
	}

	if ($("#id").val() == ($("#npwd").val())) {
		$("#npwd").addClass("is-invalid");
		$("#npwd").next().text("비밀번호가 아이디랑 다르게 입력해주세요");
	    $("#npwd").val("");
	    $("#npwd").focus();
	    return false;
	}
	if ($("#pwd").val() == ($("#npwd").val())) {
		$("#npwd").addClass("is-invalid");
		$("#npwd").next().text("기존 비밀번호 입니다");
	    $("#npwd").val("");
	    $("#npwd").focus();
	    return false;
	}

	if($("#npwd").val() != ($("#pwdCk").val())){ 
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
	
	if($("#email").val()) {
		var xemail = '${member.email}';
		var flag = false;
		$.ajax("idValid?email="+$("#email").val()+"&id="+$("#id").val(), {
			async: false,
			success : function(data) {
				if((data < 2) || (xemail == $("#email").val())) {
					flag = true;
				} else {
					$("#email").addClass("is-invalid");
					$("#email").next().text("중복된 이메일입니다");
					flag = false;
				}
			}
		});
		return flag;
	};
};
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>