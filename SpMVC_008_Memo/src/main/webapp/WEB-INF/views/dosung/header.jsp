<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<header>
	<div class="d-hslogo">
		<a href="${rootPath}"> <img
			src="${rootPath}/static/images/sign.png">
		</a>
	</div>
	<div>
		<form:form action="${rootPath}/api/search">
			<div class="inner-box">
				<select name="cat">
					<option value="Place">명소검색</option>
					<option value="Food">맛집검색</option>
				</select> <input class="hs_input" name="search" placeholder="검색어를 입력하세요" />
				<button>검색</button>
			</div>
		</form:form>
	</div>
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
				<a href="${rootPath}/api/home">또가자</a>
				<br>
				<a href="${rootPath}/study/home">스터디</a>
				<br>
				<form:form action="${rootPath}/user/login">
					<button>logout</button>
				</form:form>
			</sec:authorize>
		</div>
	</div>
</header>
