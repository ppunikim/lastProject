<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독후감 작성</title>
<style>
</style>
</head>
<body>
	<form:form method="POST">
		<input placeholder="책의 isbn 을 작성하세요." value="${book.b_isbn}" name="b_isbn" />
		<input placeholder="책의 제목을 입력하세요." value="${book.b_title}" name="b_title" />
		<button>전송</button>
	</form:form>
</body>
</html>