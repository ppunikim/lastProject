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
<title>명소 자세히 보기</title>
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
	width: 80%;
	height: 100%;
	display: flex;
	flex-direction: column;
}

a {
	text-decoration: none;
	margin-top: 20px;
	width: 500px;
	height: 40px;
}
.hs_color {
	text-decoration: underline;
	color: blue;
}
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<div class="">
		<div class="w3-ul w3-card-4 w3-margin w3-padding-large">
			<label class="w3-text-pink w3-margin">명소 이름</label>
			<div class="w3-large w3-border-bottom w3-padding">${DETAIL.MAIN_TITLE}</div>
			<label class="w3-text-pink w3-margin">위치 자세히</label>
			<div class="w3-large w3-border-bottom w3-padding">${DETAIL.ADDR1}</div>
			<c:if test="${not empty DETAIL.HOMEPAGE_URL}">
				<label class="w3-text-pink w3-margin">홈페이지 링크</label>
				<div class="w3-large w3-border-bottom w3-padding"><a href="${DETAIL.HOMEPAGE_URL}" class="hs_color">${DETAIL.HOMEPAGE_URL}</a></div>
			</c:if>
			<label class="w3-text-pink w3-margin">교통정보</label>
			<div class="w3-large w3-border-bottom w3-padding">${DETAIL.TRFC_INFO}</div>
			<c:if test="${not empty DETAIL.USAGE_DAY}">
				<label class="w3-text-pink w3-margin">운영일</label>
				<div class="w3-large w3-border-bottom w3-padding">${DETAIL.USAGE_DAY}</div>
			</c:if>
			<c:if test="${not empty DETAIL.HLDY_INFO}">
				<label class="w3-text-pink w3-margin">휴무일</label>
				<div class="w3-large w3-border-bottom w3-padding">${DETAIL.HLDY_INFO}</div>
			</c:if>
			<label class="w3-text-pink w3-margin">이용요금</label>
			<div class="w3-large w3-border-bottom w3-padding">${DETAIL.USAGE_AMOUNT}</div>
			<label class="w3-text-pink w3-margin">운영 및 시간</label>
			<div class="w3-large w3-border-bottom w3-padding">${DETAIL.USAGE_DAY_WEEK_AND_TIME}</div>
			<label class="w3-text-pink w3-margin">상세내용</label>
			<div class="w3-large w3-border-bottom w3-padding">${DETAIL.ITEMCNTNTS}</div>
			<label class="w3-text-pink w3-margin">편의시설</label>
			<div class="w3-large w3-border-bottom w3-padding">${DETAIL.MIDDLE_SIZE_RM1}</div>
			<div>
				<img src="${DETAIL.MAIN_IMG_THUMB}" class="w3-padding">
			</div>
		</div>
		<a href="${rootPath}/api/place" class="w3-button w3-dark-gray">이전</a>
	</div>
</body>
</html>