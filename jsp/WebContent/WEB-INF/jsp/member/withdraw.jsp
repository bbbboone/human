<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<main class="login">
	<form method="post" class="withdraw" id="withdraw" onsubmit="return checkWithdraw()">
		<fieldset>
		<h1>탈퇴 안내</h1>
		<p>사용하고 계신 아이디(${member.id})는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<p>
		<div class="form-group">
		<div>
	      <input type="text" class="form-control" name="id" id="id" value='${member.id}' readonly>
	      <input type="password" class="form-control mt-3" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요">
	      <div class="invalid-feedback"></div>
		</div>
	    </div>
		<button type="submit" class="btn btn-primary mt-3" id="btnWd">탈퇴</button>
		<div></div>
		</fieldset>
	</form>
</main>
<jsp:include page="../common/footer.jsp"/>
<script>
function checkWithdraw() {
	$(".form-control").next().text("");
	$("#pwd").removeClass("is-invalid");
    
	if($("#pwd").val() == ""){
		$("#pwd").addClass("is-invalid");
		$("#pwd").next().text("필수 정보입니다.");
		$("#pwd").focus();
		return false;
	}
	
	if($("#id").val() && $("#pwd").val()) {
		var flag = false;
		$.ajax("loginValid?id="+$("#id").val()+"&pwd="+$("#pwd").val(), {
			async: false,
			success : function(data) {
				if(data == 0) {
					$("#btnWd").next().text("비밀번호를 정확히 입력해 주세요.");
					$("#pwd").focus();
				} else { 
					if(confirm("정말 탈퇴하시겠습니까?")) {
						flag = true;
					} else {
						return false;
					}
				}
			}
		});
		return flag;
	}
}
</script>
</body>
</html>