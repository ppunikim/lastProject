<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 api 검색 결과값</title>
</head>
<style>
section.hs_bn_sec {
	padding: 12px;
}
nav.hs_bn_nav {
	margin-top: 116px;
    background-color: #c5c5c5d4;
    justify-content: space-around;
    display: flex;
    padding: 15px;
}
form.hs_bn_form {
	background-color: #c5c5c5d4;
}
nav.hs_bn_nav select {
	width: 70px;
	height: 28px;
}

nav.hs_bn_nav input {
	width: 380px;
	height: 23px;
}

nav.hs_bn_nav button {
	height: 30px;
	width: 46px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<nav class="hs_bn_nav">
		<form:form action="${rootPath}/write/search" method="POST" class="hs_bn_form">
			<select name="cat">
				<option value="NEWS">뉴스</option>
				<option value="BOOK">책</option>
			</select>
			<input name="search" placeholder="검색어 입력 후 Enter" />
			<button>전송</button>
		</form:form>
	</nav>
	<section class="hs_bn_sec">
		<article>
			<c:forEach items="${NAVER}" var="navers">
				<p>${navers.title}</p>
			</c:forEach>
		</article>
		<div style="font-weight: bolder">
			1. 정보가 나오면 그곳에 좋아요 누를 수 있는 기능 만들기<br> 2. 좋아요 한 내용은 다시 보관함에서 볼 수
			있도록 하기
		</div>
	</section>
</body>
</html>