<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>로그인 하기</title>
<link rel="stylesheet" href="${rootPath}/static/css/home.css?ver=2"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<header class="hs_flex hs_sa hs_fix">
		<img src="${rootPath}/static/images/sign.png" width="50vw">
		<div class="hs_fix hs_border">
			<div class="hs_flex">
				<div class="z_log hs_menu">
					<div class="z_log hs_top hs_head">about</div>
					<div class="hs_drop">
						<sec:authorize access="isAnonymous()">
							<a href="${rootPath}/user/login">로그인</a>
						</sec:authorize>
						<sec:authorize
							access="isAuthenticated() AND hasRole('ROLE_ADMIN')">
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
			</div>
		</div>
	</header>
	<form:form class="w3-container w3-card-4 hs-form">
		
		<c:choose>
			<c:when test="${error == 'LOGIN_NEED'}">
				<c:set var="message" value="* 로그인이 필요한 서비스 입니다." />
			</c:when>
		</c:choose>
		
		<c:if test="${not empty exception}">
			<div class="w3-text-red w3-padding-16">${exception}</div>
		</c:if>
		<c:if test="${not empty message}">
			<div class="w3-text-red w3-padding-16">${message}</div>
		</c:if>
		<label class="w3-text-blue"><strong>USER NAME</strong></label>
		<input name="username" class="w3-input w3-border" />
		
		<label class="w3-text-blue"><strong>PASSWORD</strong></label>
		<input name="password" class="w3-input w3-border" type="password" />
		
		<button class="w3-button w3-green">로그인</button>
		
		<label>로그인 계정이 없으면 <a href="${rootPath}/user/join">회원가입</a>을 해주세요.
		</label>
	</form:form>
	
</body>
</html>