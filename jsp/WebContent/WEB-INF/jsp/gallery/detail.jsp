<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp"/>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<main class="gdetail">
<table>
	<tr>
		<td>${board.title}</td>
		<td>${board.id}</td>
		<td>${board.regDate}</td>
	</tr>
	<tr>
		<td class="px-40" colspan="3">
			<c:forEach items="${board.attachs}" var="attach">
			<a href="${pageContext.request.contextPath}/download?filename=${attach.uuid}">
			${attach.origin}
			</a>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td id="gallery3" colspan="3"><c:out value='${board.content}' escapeXml="true"/>
			<img id="galleryImg" alt="" src="${pageContext.request.contextPath}/display?filename=${board.attachs[0].path}/${board.attachs[0].uuid}">
		</td>
	</tr>
	<tr>
		<td colspan="3">
		<div class="float-end">
			<c:if test="${member.id == board.id}">
				<button class="btn btn-outline-primary" id="btnDt">삭제</button>
			</c:if>
		</div>
		</td>
	</tr>
</table>
<c:if test="${not empty member}">
<div class="col-6 mx-auto">
	<div class="form-group clearfix">
		<p>${member.name}</p>
		<form id="frmReplyWrite">
		<input type="text" class="form-control" placeholder="댓글 제목을 입력하세요" name="title" id="title">
		<textarea class="form-control my-1" placeholder="댓글을 입력하세요" name="content" id="content"></textarea>
		<input type="hidden" name="bno" value="${board.bno}">
		<input type="hidden" name="id" value="${member.id}">
		<button class="btn btn-dark float-end disabled" id="btnReplyWrite">등록</button>
		</form>
	</div>
</div>
</c:if>
<div class="container col-6 mx-auto reply-wrapper">
</div>
</main>
<script>
var cp = "${pageContext.request.contextPath}";
var bno = '${param.bno}';
var pageNum = '${param.pageNum}'
var memberId = '${sessionScope.member.id}';

$(function() {
	showList();
	function showList() {
		var url = cp + "/reply/list?bno=" + bno + "&pageNum=" + pageNum;

		$.getJSON(url).done(function(data) {
			var str = "";
			
			for(var i in data) {
				str += '<div class="card my-3 border-secondary '+ data[i].rno +'" data-rno="' + data[i].rno +'">'
				str += '	<div class="card-header bg-dark text-light">' + (data[i].id != null ? data[i].id : "(탈퇴회원)") + '<span class="float-end">' + data[i].regDate +'</span></div>'
				str += '	<div class="card-body">' + data[i].content + '</div>'
			 	if(memberId == data[i].id) {
					str += '<div class="card-footer">'
					str += '	<button type="button" class="btn btn-link btn-sm float-end" id="btnRDt">삭제</button>'
					str += '	<button type="button" class="btn btn-link btn-sm float-end" id="btnRMf">수정</button>'
					str += '</div>'
				} 
				str += '</div>'
			}
			$(".reply-wrapper").html(str);
		});
	}
	
	// 댓글 수정 창 바꾸기
	$(".reply-wrapper").on("click", "#btnRMf", function() {
		var rno = $(this).closest(".card").data("rno");
		var url =  cp + "/reply?rno=" + rno + "&pageNum=" + pageNum;
		$.getJSON(url).done(function(data) {
			var str = "";
			str += '<form method="post" action="' + url + '" onsubmit="return checkReply()">'
			str += '<div class="card my-3 border-secondary" data-rno="' + data.rno +'">'
			str += '	<div class="card-header bg-dark text-light">' + (data.id != null ? data.id : "(탈퇴회원)") + '<span class="float-end">' + data.regDate +'</span></div>'
			str += '	<div class="card-body"><textarea class="form-control" name="content" id="contentMf">' + data.content + '</textarea></div>'
			str += '	<div class="card-footer">'
			str += '		<button type="button" class="btn btn-link btn-sm float-end" id="replyCl">취소</button>'
			str += '		<button type="submit" class="btn btn-link btn-sm float-end" id="replyMf">수정</button>'
			str += '	</div>'
			str += '</div>'
			str += '</form>'
			$("div ." + data.rno).replaceWith(str);
		});
	});
	
	
	
	// 수정 취소
	$(".reply-wrapper").on("click", "#replyCl", function() {
		showList();
	});
	
	// 댓글 삭제
	$(".reply-wrapper").on("click", "#btnRDt", function() {
		// ajax
		var rno = $(this).closest(".card").data("rno");
		var url =  cp + "/reply?rno=" + rno;
		
		if($("#btnRDt").is(".disabled")) {
			return;
		}
		
		if(confirm("정말 삭제하시겠습니까?")) {
			$.ajax(url, {
				method:"delete",
				success : function(data) {
					if(data/1) { //  가입 가능
						showList();
					} else { // 가입 불가능
						alert("본인만 삭제 가능합니다.");
					}
				}
			});
		} else {
			return false;
		}
	});
	
	// 댓글 유효성 검증
	$("#content").keyup(function() {
		var contentLen = $("#content").val().trim().length;
		
		if(contentLen) {
			$("#btnReplyWrite").removeClass("disabled");
		} 
		else {
			$("#btnReplyWrite").addClass("disabled");
		}
	});
	
	
	$("#frmReplyWrite").submit(function() {
		event.preventDefault();
		if($("#btnReplyWrite").is(".disabled")) return;
		
		var reply = {};
		reply.title = $(this.title).val();
		reply.content = checkXSS($(this.content).val(), 1);
		reply.id = $(this.id).val();
		reply.bno = $(this.bno).val();

		var data = JSON.stringify(reply);
		
		var frm = this;
		var url =  cp + "/reply";
		$.ajax(url, {
			method : "post",
			data : {"jsonData":data},
			success : function(data) {
				showList();
				frm.reset();
				$("#btnReplyWrite").addClass("disabled");
			}
		});
	});
	
	$("#frmRpMf").submit(function() {
		event.preventDefault();
		if($("#frmRpMf").is(".disabled")) return;
		
		var reply = {};
		reply.content = $(this.content).val();
		reply.id = $(this.id).val();
		reply.bno = $(this.bno).val();
		
		var data = JSON.stringify(reply);
		console.log(data);
		var frm = this;
		var url =  cp + "/reply";
		$.ajax(url, {
			method : "post",
			data : {"jsonData":data},
			success : function(data) {
				showList();
				frm.reset();
				$("#frmRpMf").addClass("disabled");
			}
		});
	});

	// 글 삭제
	$("#btnDt").click(function() {
		var url =  cp + "/board/detail?bno=" + bno;
		var category = '${board.category}';
		//event.preventDefault();
		if($("#btnDt").is(".disabled")) {
			return;
		}
		// ajax
		if(confirm("정말 삭제하시겠습니까?")) {
			$.ajax(url, {
				method:"delete",
				success : function(data) {
					if(data/1) { //  가입 가능
						window.location.href = "list?category=" + category;
					} else { // 가입 불가능
						alert("본인만 삭제 가능합니다.")
					}
				}
			});
		} else {
			return false;
		}
	});
	
});

function checkReply() {
    var contentLen = $("#contentMf").val().trim().length;
	
	if(!contentLen) {
        alert("내용을 입력하세요");
        $("#content").focus();
        return false;
    }
	
    $("#contentMf").val(checkXSS($("#contentMf").val(), 1));
}

//xss
function checkXSS(str, level) {
    if (level == undefined || level == 0) {
        str = str.replace(/<|>|"|'|%|;|(|)|&|+|-/g,"");
    } else if (level != undefined && level == 1) {
        str = str.replace(/</g, "&lt;");
        str = str.replace(/>/g, "&gt;");
    }
    return str;
}
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>