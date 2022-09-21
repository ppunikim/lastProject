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
	height: 35px;
}

nav.hs_bn_nav input {
	width: 380px;
	height: 23px;
	padding: 4px;
}

nav.hs_bn_nav button {
	height: 35px;
	width: 46px;
}

section article div.hs_bn_divs {
	border-bottom: 1.6px solid black;
	padding: 12px;
	width: 500px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	line-height: 27px;
}

section article a.hs_bn_a {
	margin-left: 11px;
	text-decoration: none;
	color:inherit;
}
</style>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<nav class="hs_bn_nav">
		<form:form action="${rootPath}/write/search" method="POST"
			class="hs_bn_form">
			<select name="cat">
				<option value="NEWS">뉴스</option>
				<option value="BOOK">도서</option>
			</select>
			<input name="search" placeholder="검색어 입력 후 Enter" />
			<button>전송</button>
		</form:form>
	</nav>
	<section class="hs_bn_sec">
		<article>
			<c:forEach items="${NAVER}" var="naver">
				<div class="hs_bn_divs">
					<c:if test="${not empty naver.pubDate}">
						<div>${naver.pubDate}</div>
					</c:if>
					<a class="hs_bn_a" href="${rootPath}/write/${title}/api_detail"  onClick="api_detail(event)">${naver.title}</a>
				</div>
			</c:forEach>
		</article>
		<div style="font-weight: bolder">
			1. 정보가 나오면 그곳에 좋아요 누를 수 있는 기능 만들기<br> 2. 좋아요 한 내용은 다시 보관함에서 볼 수
			있도록 하기
		</div>
	</section>
	<section>
		<div class="book_news_detail"></div>
		<div>이곳에 비동기 방식으로 detail 옆으로 보게 만들기</div>
	</section>

</body>
</html>