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
section { 
    margin: 70px auto;
}
section a {
	border: 1px solid black;
    border-radius: 50px;
    margin: 30px;
	padding: 15px;
	font-size: 18px;
	text-decoration: none;
	color: black;
}
div.hs-w-div nav{
    background-color: #c5c5c5d4;
	justify-content: space-around;
    margin-top: 117px;
    display: flex;
	padding: 15px;
}
div.hs-w-div nav a {
    background-color: inherit;
	text-decoration: none;
	color:inherit;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="hs-w-div">
	<nav>
		<a href="${rootPath}/write/m-list">메모장</a>
		<a href="${rootPath}/write/d-list">일기장</a>
		<a href="${rootPath}/write/b-list">독후감</a>
	</nav>
</div>
<section>
	<div></div>
</section>
</body>
</html>