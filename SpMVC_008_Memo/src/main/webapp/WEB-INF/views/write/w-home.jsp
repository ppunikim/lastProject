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
<link rel="stylesheet" href="${rootPath}/static/css/w3css.css">
<title>글쓰기 모음</title>
<style>
section#hs_w_home_sec a {
    border: 1px solid black;
    border-radius: 50px;
    margin: 10px;
    padding: 10px;
    font-size: 12px;
    text-decoration: none;
    color: black;
}
div.hs-w-div nav{
    background-color: #c5c5c5d4;
	justify-content: space-around;
    margin-top: 113px;
    display: flex;
	padding: 15px;
}
div.hs-w-div nav a {
    background-color: inherit;
	text-decoration: none;
	color:inherit;
}
div.hs_result {
	width: 800px;
	margin: 5px auto;
}
</style>
<script>
	const rootPath = '${rootPath}'
</script>
<script src="${rootPath}/static/js/write_ajax.js?ver=7"></script>
<script src="${rootPath}/static/js/memo_detail.js?ver=14"></script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="hs-w-div">
	<nav>
		<div onClick="memo(event)">메모장</div>
		<div onClick="diary(event)">일기장</div>
		<div onClick="book(event)">독후감</div>
	</nav>
</div>
<section id="hs_w_home_sec">
	<div class="hs_result"></div>
</section>
</body>
</html>