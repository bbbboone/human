<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<main class="login">
	<form method="post" onsubmit="return checkFindId()" id="frmFindId">
		<fieldset>
		<legend>아이디 찾기</legend>
		<div class="form-group">
	      <input type="text" class="form-control my-3 mt-3" name="name" id="name" placeholder="이름를 입력해주세요">
	      <input type="hidden" name="code" id="code">
	      <div class="invalid-feedback"></div>
	      <input type="text" class="form-control" name="email" id="email" placeholder="가입한 메일 주소를 입력해주세요">
	      <div class="invalid-feedback"></div>
	    </div>
		<button type="button" class="btn btn-primary mt-3" id="btnCk">확인</button>
		<p></p>
		<button type="button" class="btn btn-primary mb-3 disabled" id="btnSend">발송</button>
		</fieldset>
		<fieldset>
		<div class="form-group">
	      <input type="text" class="form-control" name="verify" id="verify" placeholder="인증번호를 입력해주세요">
	      <div class="invalid-feedback"></div>
	    </div>
		<button type="button" class="btn btn-primary disabled mt-3" id="btnCf">인증</button>
		<button type="submit" class="btn btn-primary disabled mt-3" id="btnFindId">아이디 찾기</button>
		</fieldset>
		<div class="findId">
		<a href="findPwd">비밀번호 찾기 ㅣ</a>
		<a href="login"> 로그인하기</a>
		</div>
	</form>
</main>
<script>
$(function() {
	$("#btnSend").hide();
	// 확인버튼
	$("#btnCk").click(function() {
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getName = RegExp(/^[가-힣]+$/);

		$(".form-control").next().text("");
		$("#btnCk").next().text("");
		
		$("#name").removeClass("is-invalid");
		$("#email").removeClass("is-invalid");
		
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
		
		if($("#name").val() && $("#email").val()) {
			$.ajax("memberValid?name=" + $("#name").val() + "&email=" + $("#email").val(), {
				success : function(data) {
					if(data == 1) { 
						$("#btnSend").removeClass("disabled");
						$("#btnSend").show();
					} else { 
						$("#btnCk").next().text("이름과 이메일을 확인해주세요");
					}
				}
			});
		}
		
		$("#btnCk").addClass("disabled");
	})
	
	// 발송버튼
	$("#btnSend").click(function() {
		alert("이메일이 발송되었습니다.");
		$.ajax("sendMail?email=" + $("#email").val(), {
			success : function(data) {
				$("#code").val(data);
			}
		});
		$("#btnCf").removeClass("disabled");
		$("#btnSend").addClass("disabled");
	})
	
	// 인증버튼
	$("#btnCf").click(function() {
		if($("#code").val() == $("#verify").val()) {
			alert("확인되었습니다.");
			$("#btnFindId").removeClass("disabled");
		} else {
			alert("인증번호가 틀렸습니다.");
			history.go(0);
		}
		$("#btnCf").addClass("disabled");
	})
});
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>