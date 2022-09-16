<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<link rel="stylesheet" href="${rootPath}/static/css/home.css?ver=4" />
<header class="hs_flex hs_sa hs_fix">
	<a href="${rootPath}" style="z-index: 100"> <img
		src="${rootPath}/static/images/sign.png" width="50vw">
	</a>
	<div class="hs_fix hs_border">
		<div class="hs_flex">
			<div class="z_log hs_menu">
				<div class="z_log hs_top hs_head">about</div>
				<div class="hs_drop">
					<sec:authorize access="isAnonymous()">
						<a href="${rootPath}/user/login">로그인</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated() AND hasRole('ROLE_ADMIN')">
						<a href="${rootPath}/admin/home">admin</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<a href="${rootPath}/write/home">글쓰기</a>
						<br>
						<a href="${rootPath}/study/home">스터디</a>
						<br>
						<a href="${rootPath}/api/home">또가자</a>
						<br>
						<form:form action="${rootPath}/user/login">
							<button>logout</button>
						</form:form>
					</sec:authorize>
				</div>
			</div>
		</div>
	</div>
</header>

