<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
section.hs_bn_sec  {
    padding: 12px;
    margin-top: 120px;
}
article.hs_bn_art select {
	width: 70px;
    height: 28px;
}
article.hs_bn_art input{
	width: 380px;
	height: 23px;
}
article.hs_bn_art button {
	height: 30px;
    width: 46px;
}
</style>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
	<section class="hs_bn_sec">
		<article class="hs_bn_art">
			<form:form action="${rootPath}/write/search" method="POST">
				<select name="cat">
					<option value="NEWS">뉴스</option>
					<option value="BOOK">책</option>
				</select>
				<input name="search" placeholder="검색어 입력 후 Enter" />
				<button>전송</button>
			</form:form>
		</article>
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