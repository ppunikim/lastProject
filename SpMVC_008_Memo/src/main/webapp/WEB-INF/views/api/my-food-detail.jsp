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

body {

	display: flex;
	flex-direction: column;
}

a {
	text-decoration: none;
	margin-top: 20px;
	width: 170px;
	height: 40px;
}
input {
	width: 500px;
}
.hs_div label {
	display: inline !important;
}
div.hs_div button,div.hs_div a {
	width: 500px;
	background-color:#fff7aee0;
}
div.hs_divhead {
	margin: 10px auto;	
}
div.hs_div h2 {
	text-align: center;
	background-color:#ffef5aeb;
	width :200px;
	border-radius: 30px;
	margin: 10px auto;
	
}
div.hs_middle {
	margin: 0 auto;
	padding: 5px;
}
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<%@ include file="/WEB-INF/views/dosung/head.jsp"%>
<body>
<%@include file="/WEB-INF/views/dosung/header.jsp"%>
	<form:form method="POST" modelAttribute="FOOD">
		<div style="display: flex" class="hs_divhead">
			<div class="hs_div ">
				<c:choose>
					<c:when test="${not empty  UC_SEQ}">
						<h2>맛집 수정하기</h2>
					</c:when>
					<c:otherwise>
						<h2>맛집 추가하기</h2>
					</c:otherwise>
				</c:choose>
				<div>
					<input name="UC_SEQ" type="hidden" value="${VO.UC_SEQ}"/>
				</div>
				<div class="hs_middle">
				<label>음식점이름</label>
				<div class="hs_div_middle">
					<input name="MAIN_TITLE"
						value="${VO.MAIN_TITLE}" />
				</div>
				<label>구 위치</label>
				<div class="hs_div_middle">
					<input name="GUGUN_NM"
						value="${VO.GUGUN_NM}" />
				</div>
				<label>음식점위치</label>
				<div class="hs_div_middle">
					<input name="ADDR1"
						value="${VO.ADDR1}" />
				</div>
				<label>전화번호</label>
				<div class="hs_div_middle">
					<input name="CNTCT_TEL"
						value="${VO.CNTCT_TEL}" />
				</div>
				<label>운영시간</label>
				<div class="hs_div_middle">
					<input name="USAGE_DAY_WEEK_AND_TIME"
						value="${VO.USAGE_DAY_WEEK_AND_TIME}" />
				</div>
				<label>설명</label>
				<div class="hs_div_middle">
					<input name="ITEMCNTNTS"
						value="${VO.ITEMCNTNTS}" />
				</div>
				<div>
					<img src="${VO.MAIN_IMG_THUMB}">
				</div>
				<c:choose>
					<c:when test="${not empty  UC_SEQ}">
						<button class=" w3-button w3-pale-red">수정</button>
						<a href="${rootPath}/api/${VO.UC_SEQ}/my-delete"  class=" w3-button w3-pale-yellow">삭제</a>
					</c:when>
					<c:otherwise>
						<button class=" w3-button">추가</button> 
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>