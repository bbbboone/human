<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container-fluid">
			<div>
				<a class="navbar-brand" id="logo"
					href="${pageContext.request.contextPath}/index.html"><img
					src="${pageContext.request.contextPath}/images/logo2.png"
					alt="logo"></a>
			</div>
			<div class="float-end">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/index.html">HOME</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/board/list?category=3">공지사항</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/board/list?category=1">자유게시판</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/gallery/list">갤러리</a></li>
					<c:choose>
						<c:when test="${empty member}">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false"><img
									src="${pageContext.request.contextPath}/images/login.png"
									alt="logo"></a>
								<div class="dropdown-menu">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/login">로그인</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/join">회원가입</a>
								</div></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">${member.name}님</a>
								<div class="dropdown-menu">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/infoModify">정보 수정</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/logout">로그아웃</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/withdraw">회원
										탈퇴</a>
								</div></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</header>