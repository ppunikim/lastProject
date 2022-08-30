<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>my-look</title>
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
	width: 250px;
	height: 40px;
}
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<!-- 추가, 수정, 삭제 같이 구현할 jsp 만들자 -->
<form method="POST">
	<div style="display:flex">
		<div class="w3-ul w3-card-4 w3-margin w3-padding-large hs_div">
			<label class="w3-text-pink w3-margin">음식점이름</label>
			<input name="main_title" value="${ONE.main_title}" />
			<div class="w3-large w3-border-bottom w3-padding">${ONE.main_title}</div>
			<label class="w3-text-pink w3-margin">구 위치</label>
			<div class="w3-large w3-border-bottom w3-padding">${ONE.gugun_nm}</div>
			<label class="w3-text-pink w3-margin">음식점위치</label>
			<div class="w3-large w3-border-bottom w3-padding">${ONE.addr1}</div>
			<label class="w3-text-pink w3-margin">전화번호</label>
			<div class="w3-large w3-border-bottom w3-padding">${ONE.cntct_tel}</div>
			<label class="w3-text-pink w3-margin">운영시간</label>
			<div class="w3-large w3-border-bottom w3-padding">${ONE.usage_day_week_and_time}</div>
			<label class="w3-text-pink w3-margin">설명</label>
			<div class="w3-large w3-border-bottom w3-padding">${ONE.itemcntnts}</div>
			<div><img src ="${ONE.main_img_thumb}" class="w3-padding"></div> 
		</div>
		<a href="${rootPath}/api/food" class="w3-button w3-indigo">이전</a>
	</div>
</form>
</body>
</html>