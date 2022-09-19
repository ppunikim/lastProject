<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서정보,뉴스정보 api</title>
</head>
<body>
<h1>뉴스도서 api</h1>
<c:forEach items="NEWS" var="newss">
	<tr>
		<th>뉴스제목</th>
	</tr>
	<tr>
		<td>${newss.title}</td>
	</tr>
</c:forEach>

<h5>정보가 나오면 그곳에 좋아요 누를 수 있는 기능 만들기</h5>
</body>
</html>