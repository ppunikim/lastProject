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
<body>
	<div class="d-result-title">
		<h2>${title} 맛집 결과</h2>
		<div class="d-btn">
			<a href="${rootPath}/dosung/${title}/gotofoods">&#43; 더보기</a>
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
			<a href="${rootPath}/dosung/${title}/gotoplaces">&#43; 더보기</a>
		</div>
	</div>
	<div class="d-result-main">
		<c:forEach items="${apiPlace}" var="api">
			<div class="d-result-box">
				<div class="d-result-box-title">${api.MAIN_TITLE}</div>
				<div class="d-result-box-img">
					<a href="${rootPath}/api/${api.UC_SEQ}/place-detail"> <img
						src='${api.MAIN_IMG_THUMB}'>

					</a>
				</div>
			</div>

		</c:forEach>
	</div>
</body>

</html>