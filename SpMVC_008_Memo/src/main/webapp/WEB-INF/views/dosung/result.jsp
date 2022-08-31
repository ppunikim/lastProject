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
<style>
div.d-result-main {
	display: flex;
	margin: 20px 0 50px 10px;
}

div.d-result-title {
	display: flex;
	justify-content: space-between;
	align-content: center;
	align-items: center;
}

div.d-btn {
	padding: 5px 12px;
	margin: 5px;
	border: 1px solid #4444444a;
	width: 115px;
	text-align: center;
}

div.d-btn a {
	color: inherit;
	text-decoration: none;
}

div.d-result-box-title {
	font-weight: 700;
	text-align: center;
}

div.d-result-box-img {
	overflow: hidden;
	border-radius: 50% 50%;
	margin: 15px;
}

div.d-result-box-img img {
	width: 250px;
	height: 250px;
}
</style>
</head>
<%@ include file="/WEB-INF/views/dosung/head.jsp"%>
<body>
	<div class="d-result-title">
		<h2>${title} 맛집 결과</h2>
		<div class="d-btn">
			<a href="${rootPath}/dosung/${title}/gotofoods">자세히 보기</a>
		</div>
	</div>
	<div class="d-result-main">
		<c:forEach items="${api}" var="api">
			<div class="d-result-box">
				<div class="d-result-box-title">${api.MAIN_TITLE}</div>
				<div class="d-result-box-img">
					<a href="${rootPath}/api/${api.UC_SEQ}/api-detail"> <img
						src='${api.MAIN_IMG_THUMB}'>
					</a>
				</div>
			</div>

		</c:forEach>
	</div>
	<div class="d-result-title">
		<h2>${title}의 관광 명소는..?</h2>
		<div class="d-btn">
			<a href="${rootPath}/dosung/${title}/gotoplaces">자세히 보기</a>
		</div>
	</div>
	<div class="d-result-main">
		<c:forEach items="${apiPlace}" var="api">
			<div class="d-result-box">
				<div class="d-result-box-title">${api.MAIN_TITLE}</div>
				<div class="d-result-box-img">
					<a href="${rootPath}/api/${api.UC_SEQ}/api-detail"> <img
						src='${api.MAIN_IMG_THUMB}'>
					</a>
				</div>
			</div>

		</c:forEach>
	</div>
</body>

</html>