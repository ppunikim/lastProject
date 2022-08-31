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
<title>맛집 추가하기</title>
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
	width: 170px;
	height: 40px;
}

.hs_div_middle {
	margin: 10px 0;
	width: 600px;
}
input {
	width: 500px;
}
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<form:form method="POST" modelAttribute="FOOD">
		<div style="display: flex">
			<div class="w3-ul w3-card-4 w3-margin w3-padding-large hs_div">
				<div>
					<input name="UC_SEQ" type="hidden" value="${VO.UC_SEQ}"/>
				</div>
				<label class="w3-text-pink w3-margin">음식점이름</label>
				<div class="hs_div_middle">
					<input name="MAIN_TITLE"
						class="w3-large w3-border-bottom w3-padding"
						value="${VO.MAIN_TITLE}" />
				</div>
				<label class="w3-text-pink w3-margin">구 위치</label>
				<div class="hs_div_middle">
					<input name="GUGUN_NM" class="w3-large w3-border-bottom w3-padding"
						value="${VO.GUGUN_NM}" />
				</div>
				<label class="w3-text-pink w3-margin">음식점위치</label>
				<div class="hs_div_middle">
					<input name="ADDR1" class="w3-large w3-border-bottom w3-padding"
						value="${VO.ADDR1}" />
				</div>
				<label class="w3-text-pink w3-margin">전화번호</label>
				<div class="hs_div_middle">
					<input name="CNTCT_TEL"
						class="w3-large w3-border-bottom w3-padding"
						value="${VO.CNTCT_TEL}" />
				</div>
				<label class="w3-text-pink w3-margin">운영시간</label>
				<div class="hs_div_middle">
					<input name="USAGE_DAY_WEEK_AND_TIME"
						class="w3-large w3-border-bottom w3-padding"
						value="${VO.USAGE_DAY_WEEK_AND_TIME}" />
				</div>
				<label class="w3-text-pink w3-margin">설명</label>
				<div class="hs_div_middle">
					<input name="ITEMCNTNTS"
						class="w3-large w3-border-bottom w3-padding"
						value="${VO.ITEMCNTNTS}" />
				</div>
				<div>
					<img src="${VO.MAIN_IMG_THUMB}" class="w3-padding">
				</div>
				<c:choose>
					<c:when test="${not empty  UC_SEQ}">
						<button class=" w3-button w3-pale-red">수정</button>
						<a href="${rootPath}/api/${VO.UC_SEQ}/my-delete"  class=" w3-button w3-pale-yellow">삭제</a>
					</c:when>
					<c:otherwise>
						<button class=" w3-button w3-pale-red">추가</button>
					</c:otherwise>
				</c:choose>
			</div>
			<a href="${rootPath}/api/food" class="w3-button w3-dark-gray">이전</a>
		</div>
	</form:form>
</body>
</html>