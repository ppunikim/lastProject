<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>api를 이용한 지도</title>
<link rel="stylesheet" href="${rootPath}/static/css/api.css?ver=003" />
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
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
#map {
	width: 80%;
	height: 450px;
	margin: 150px auto;
}
</style>
<script>
	const rootPath = '${rootPath}'
</script>
</head>

<body>
<%@include file="/WEB-INF/views/dosung/header.jsp"%>
<div id="map" ></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c973ccb369a6eba6a4c014a814dc007"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.1402,129.1064), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 


//마커가 표시될 위치입니다 
var markerPosition = new kakao.maps.LatLng(35.1402,129.1064); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 마커가 드래그 가능하도록 설정합니다 
marker.setDraggable(true); 
</script>
</body>
</html>