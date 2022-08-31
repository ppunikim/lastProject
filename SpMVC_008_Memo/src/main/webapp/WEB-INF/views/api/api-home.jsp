<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>또가자</title>
<style>
.hs_width {
	background-color: #f5f5f5;
}

.hs_place {
	text-decoration: none;
	border: 1px solid transparent;
	border-radius: 50px;
	height: 40px;
	width: 45px;
	text-align: center;
	margin: 30px 0 0 20px;
	background-color: #3f3e3e9e;
	color: white;
	line-height: 32px;
	font-size: small;
}

img {
	border: 1px solid #aaa;
}

tr:hover {
	transform: scale(1.01, 1.01);
}

tr {
	overflow: hidden;
	transition-duration: 300ms;
}

</style>
<link rel="stylesheet" href="${rootPath}/static/css/api.css?ver=003" />
<link rel="stylesheet" href="${rootPath}/static/css/modal.css?ver=002" />
<script>
	const rootPath = '${rootPath}'
</script>
<script src="${rootPath}/static/js/api.js?ver=010"></script>
</head>
<body>
	<!-- 최종 구현하고자 하는 것 
 	1. 한줄 클릭하면 modal box 로 그 라인만 크게 보이게 하는 것, (detail)설명란 추가
 	2. pageNation 구현하기
 	3. 랜덤 이미지 클릭했을 때 음식 상세 페이지로 이동하기
 -->
	<header>
		<a href="${rootPath}/api/map" class="hs_place">지도</a>
		<a href="${rootPath}/api/place" class="hs_place">명소</a> <a
			href="${rootPath}/api/food" class="hs_place">맛집</a>
	</header>
</body>
</html>