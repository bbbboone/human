<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp"/>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<main class="list">
<table class="table">
	<tr class="table-active">
		<th>연번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	<c:forEach items="${list}" var="b">
	<tr class="table-light">
		<td>${b.bno}</td>
		<td><a href="detail?bno=${b.bno}&pageNum=${page.cri.pageNum}"><c:out value='${b.title}' escapeXml="true"/><span class="text-muted small">[${b.replyCnt}]</span></a></td>
		<td>${b.id != null ? b.id : '(탈퇴회원)'}</td>
		<td><fmt:formatDate value="${b.regDate}" pattern="yy/MM/dd"/></td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4">
			<ul class="pagination justify-content-center">
				<li class="page-item ${page.prev ? '' : 'disabled'}">
					<a class="page-link" href="list?pageNum=${page.startPage-1}&amount=${page.cri.amount}&category=${page.cri.category}">Previous</a>
				</li>
				
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
				<li class="page-item ${p == page.cri.pageNum ? 'active' : ''}">
					<a class="page-link" href="list?pageNum=${p}&amount=${page.cri.amount}&category=${page.cri.category}">${p}</a>
				</li>
				</c:forEach>
				
				<li class="page-item ${page.next ? '' : 'disabled'}">
					<a class="page-link" href="list?pageNum=${page.endPage+1}&amount=${page.cri.amount}&category=${page.cri.category}">Next</a>
				</li>
			</ul>
		</td>
	</tr>
	<c:if test="${not empty member}">
	<tr>
	<td colspan="4"><a href="write?category=${param.category}"><button class="btn btn-secondary float-end">글쓰기</button></a></td>
	</tr>
	</c:if>
</table>
</main>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>