<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>글쓰기 모음</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html {
	width: 100vw;
	height: 100vh;
}

body {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
}
header {
	display: flex;
	justify-content: space-around;
	background-color: #eee;
}
header a {
	padding: 15px;
	font-size: 18px;
	text-decoration: none;
	color: black;
}
nav {
	border: 3px solid black;
	border-radius: 10px;
}
</style>
</head>
<body>
<header>
	<a href="${rootPath}/write/m-list">메모장</a>
	<a href="${rootPath}/write/d-list">일기장</a>
</header>
<nav>
	<div></div>
</nav>
<!-- 가능하다면 네비 안에 메모나 리스트 나타나도록 하기 -->
</body>
</html>