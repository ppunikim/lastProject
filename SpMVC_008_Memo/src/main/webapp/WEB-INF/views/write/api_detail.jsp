<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>naver api detail</title>
</head>
<body>
	<c:forEach items="${NAVER}" var="naver">
		<div>${naver.title}</div>
		<div>${naver.link}</div>
		<div>${naver.description}</div>
		<div>${naver.pubDate}</div>
	</c:forEach>
</body>
</html>