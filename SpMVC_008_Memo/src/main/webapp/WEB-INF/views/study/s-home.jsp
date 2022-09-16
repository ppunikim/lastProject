<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>JSP 파일</title>
<style>
#pad {
	margin: 0 auto;
}
article#pad a {
	margin: 20px;
	text-decoration: none;
	color: #242424;
	font-size: 18px;
}
div.hs_first{
	display: flex;
	margin: 10px;
}
div.hs_div {
	margin-bottom: 25px;
}
section.hs_sec {
	margin: 150px auto;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<section class="hs_sec">
	<article id="pad">
		<div class="hs_first">
			<div class="hs_div"><a href="${rootPath}/study/one">공부 1</a></div>
			<div class="hs_div"><a href="${rootPath}/study/two">공부 2</a></div>
			<div class="hs_div"><a href="${rootPath}/study/three">공부 3</a></div>
		</div>
		<div class="hs_first">
			<div class="hs_div"><a href="${rootPath}/study/four">공부 4</a></div>
			<div class="hs_div"><a href="${rootPath}/study/five">공부 5</a></div>
			<div class="hs_div"><a href="${rootPath}/study/six">공부 6</a></div>
			<div class="hs_div"><a href="${rootPath}/study/seven">공부 7</a></div>
		</div>
	</article>
</section>
</body>
</html>