<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서록 리스트</title>
<style>
div.hs_b_div {
	display: flex;
}
</style>
</head>
<body>
	<section>
		<div class="hs_b_div">
			<h3>독후감 작성</h3>
			<a href="${rootPath}/write/api_book_news">+뉴스, 책 정보 더보기</a>
		</div>
	</section>
</body>
</html>