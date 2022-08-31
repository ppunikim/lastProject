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
<header>
		<a href="${rootPath}/api/map" class="hs_place">지도</a>
		<a href="${rootPath}/api/place" class="hs_place">명소</a> <a
			href="${rootPath}/api/food" class="hs_place">맛집</a>
	</header>
</body>
</html>