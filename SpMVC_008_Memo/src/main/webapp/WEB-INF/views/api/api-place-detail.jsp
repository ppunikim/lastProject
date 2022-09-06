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
<title>부산명소 자세히 보기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@include file="/WEB-INF/views/dosung/head.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/views/dosung/header.jsp"%>
	<div class="hs-container">
		<div class="w3-ul w3-card-4 w3-margin w3-padding-large hs_div">
			<label class="w3-text-pink w3-margin">명소 이름</label>
			<div class="w3-large w3-border-bottom w3-padding">${apiPlace.MAIN_TITLE}</div>
			<label class="w3-text-pink w3-margin">위치 자세히</label>
			<div class="w3-large w3-border-bottom w3-padding">${apiPlace.ADDR1}</div>
			<c:if test="${not empty apiPlace.HOMEPAGE_URL}">
				<label class="w3-text-pink w3-margin">홈페이지 링크</label>
				<div class="w3-large w3-border-bottom w3-padding">
					<a   target='_blank' href="${apiPlace.HOMEPAGE_URL}" class="hs_color">${apiPlace.HOMEPAGE_URL}</a>
				</div>
			</c:if>
			<label class="w3-text-pink w3-margin">교통정보</label>
			<div class="w3-large w3-border-bottom w3-padding">${apiPlace.TRFC_INFO}</div>
			<c:if test="${not empty apiPlace.USAGE_DAY}">
				<label class="w3-text-pink w3-margin">운영일</label>
				<div class="w3-large w3-border-bottom w3-padding">${apiPlace.USAGE_DAY}</div>
			</c:if>
			<c:if test="${not empty apiPlace.HLDY_INFO}">
				<label class="w3-text-pink w3-margin">휴무일</label>
				<div class="w3-large w3-border-bottom w3-padding">${apiPlace.HLDY_INFO}</div>
			</c:if>
			<label class="w3-text-pink w3-margin">이용요금</label>
			<div class="w3-large w3-border-bottom w3-padding">${apiPlace.USAGE_AMOUNT}</div>
			<label class="w3-text-pink w3-margin">운영 및 시간</label>
			<div class="w3-large w3-border-bottom w3-padding">${apiPlace.USAGE_DAY_WEEK_AND_TIME}</div>
			
			<label class="w3-text-pink w3-margin">편의시설</label>
			<div class="w3-large w3-border-bottom w3-padding">${apiPlace.MIDDLE_SIZE_RM1}</div>
			<div class="hs-img-div">
				<img src="${apiPlace.MAIN_IMG_THUMB}" class="w3-padding">
			</div>
		</div>
	</div>
</body>
</html>