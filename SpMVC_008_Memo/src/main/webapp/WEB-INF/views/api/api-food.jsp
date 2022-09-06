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
a.hs_btb {
	text-decoration: none;
	border: 1px solid transparent;
	background-color: #706666;
	border-radius: 10px;
	color: #fff;
	padding: 6px 10px;
	margin: 0 0 25px 25px;
}

.hs_btnbox {
	line-height: 50px;
}
</style>
</head>
<%@ include file="/WEB-INF/views/dosung/head.jsp"%>
<body>
	<!-- 최종 구현하고자 하는 것 
 	1. 한줄 클릭하면 modal box 로 그 라인만 크게 보이게 하는 것, (detail)설명란 추가
 	2. pageNation 구현하기
 	3. 랜덤 이미지 클릭했을 때 음식 상세 페이지로 이동하기
 -->
	<%@ include file="/WEB-INF/views/dosung/header.jsp"%>
	<div class="hs_btnbox">
		<a href="${rootPath}/api/my-food-add" class="hs_btb">추가</a>
	</div>
	<nav>
		<div class="hs_hs">
			<div style="width: 300px">음식점 이름</div>
			<div style="width: 180px">구 위치</div>
			<div style="width: 400px">음식점 위치</div>
			<div style="width: 180px">전화번호</div>
			<div style="width: 400px">운영 시간</div>
			<div style="width: 140px">대표 사진</div>
		</div>
		<table class="hs_detail">
			<colgroup>
				<col width="300px">
				<col width="180px">
				<col width="400px">
				<col width="180px">
				<col width="400px">
				<col width="140px">
			</colgroup>

			<%-- 	<c:forEach items="${food}" var='foods' varStatus="INDEX">
					<tr data-myseq="${foods.UC_SEQ}">
						<td>${foods.MAIN_TITLE}</td>
						<td>${foods.GUGUN_NM}</td>
						<td>${foods.ADDR1}</td>
						<td>${foods.CNTCT_TEL}</td>
						<td>${foods.USAGE_DAY_WEEK_AND_TIME}</td>
						<td><img src="${foods.MAIN_IMG_THUMB}" /></td>
					</tr>
				</c:forEach> --%>
			<c:forEach items="${apiFood}" var="aapi">
				<input type="hidden" />
				<c:choose>
					<c:when test="${not empty aapi.usercheck}">
						<tr data-myseq="${aapi.UC_SEQ}">
							<td>${aapi.MAIN_TITLE}</td>
							<td>${aapi.GUGUN_NM}</td>
							<td>${aapi.ADDR1}</td>
							<td>${aapi.CNTCT_TEL}</td>
							<td>${aapi.USAGE_DAY_WEEK_AND_TIME}</td>
							<td><img src="${aapi.MAIN_IMG_THUMB}" /></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr data-seq="${aapi.UC_SEQ}">
							<td>${aapi.MAIN_TITLE}</td>
							<td>${aapi.GUGUN_NM}</td>
							<td>${aapi.ADDR1}</td>
							<td>${aapi.CNTCT_TEL}</td>
							<td>${aapi.USAGE_DAY_WEEK_AND_TIME}</td>
							<td><img src="${aapi.MAIN_IMG_THUMB}" /></td>
						</tr>
					</c:otherwise>
				</c:choose>

			</c:forEach>
		</table>
	</nav>
	<div class="hs_div">
		<a href="${rootPath}" class="hs_home">홈으로</a>
	</div>
	<section class="modal" id="modal_box"></section>
</body>
</html>