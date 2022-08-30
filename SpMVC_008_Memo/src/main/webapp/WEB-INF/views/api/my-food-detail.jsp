<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>api-look</title>
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
<form method="POST">
	<div style="display:flex">
		<div class="w3-ul w3-card-4 w3-margin w3-padding-large hs_div">
		<div>
			<input name="UC_SEQ" type="hidden" />
		</div>
			<div>
				<label class="w3-text-pink w3-margin">음식점이름</label>
				<input name="MAIN_TITLE" class="w3-large w3-border-bottom w3-padding" value="${VO.MAIN_TITLE}"/>
			</div>
			<div>
				<label class="w3-text-pink w3-margin">구 위치</label>
				<input name="GUGUN_NM" class="w3-large w3-border-bottom w3-padding" value="${VO.GUGUN_NM}"/>
			</div>
			<div>
				<label class="w3-text-pink w3-margin">음식점위치</label>
				<input name="ADDR1" class="w3-large w3-border-bottom w3-padding" value="${VO.ADDR1}" />
			</div>
			<div>
				<label class="w3-text-pink w3-margin">전화번호</label>
				<input name="CNTCT_TEL" class="w3-large w3-border-bottom w3-padding" value="${VO.CNTCT_TEL}" />
			</div>
			<div>
				<label class="w3-text-pink w3-margin">운영시간</label>
				<input name="USAGE_DAY_WEEK_AND_TIME" class="w3-large w3-border-bottom w3-padding" value="${VO.USAGE_DAY_WEEK_AND_TIME}" />
			</div>
			<div>
				<label class="w3-text-pink w3-margin">설명</label>
				<input name="ITEMCNTNTS" class="w3-large w3-border-bottom w3-padding" value="${VO.ITEMCNTNTS}" />
			</div>
			<div><img src ="${VO.MAIN_IMG_THUMB}" class="w3-padding"></div> 
			<button>전송</button>
		</div>
		<a href="${rootPath}/api/food" class="w3-button w3-indigo">이전</a>
	</div>
</form>
</body>
</html>