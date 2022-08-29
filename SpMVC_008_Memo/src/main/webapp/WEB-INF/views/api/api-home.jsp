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
<title>부산광역시 맛집리스트</title>
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
#map {
	margin-top: 200px;
	width: 80%;
	height: 50%;
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
		<form:form>
			<input name="search" placeholder="검색어를 입력하세요." />
			<button>검색</button>
		</form:form>
		<a href="${rootPath}/api/place" class="hs_place">명소</a> <a
			href="${rootPath}/api/food" class="hs_place">맛집</a>
	</header>
	<div id="map"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c973ccb369a6eba6a4c014a814dc007"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.1609, 126.9075), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
	</script>
</body>
</html>