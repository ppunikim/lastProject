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
</head>
<%@ include file="/WEB-INF/views/dosung/head.jsp"%>
<body>
	<!-- 최종 구현하고자 하는 것 
 	1. 한줄 클릭하면 modal box 로 그 라인만 크게 보이게 하는 것, (detail)설명란 추가
 	2. pageNation 구현하기
 	3. 랜덤 이미지 클릭했을 때 음식 상세 페이지로 이동하기
 -->
	<%@ include file="/WEB-INF/views/dosung/header.jsp"%>
	<nav>
		<div class="hs_hs">
			<div style="width:15%">음식점 이름</div>
			<div style="width:10%">구 위치</div>
			<div style="width:15%">음식점 위치</div>
			<div style="width:15%">전화번호</div>
			<div style="width:20%">운영 시간</div>
			<div style="width:30%">대표 사진</div>
		</div>
			<table class="hs_detail">
				<colgroup>
					<col width="300px">
					<col width="240px">
					<col width="300px">
					<col width="300px">
					<col width="400px">
					<col width="600px">
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
					<tr data-seq="${aapi.UC_SEQ}">
						<td>${aapi.MAIN_TITLE}</td>
						<td>${aapi.GUGUN_NM}</td>
						<td>${aapi.ADDR1}</td>
						<td>${aapi.CNTCT_TEL}</td>
						<td>${aapi.USAGE_DAY_WEEK_AND_TIME}</td>
						<td><img src="${aapi.MAIN_IMG_THUMB}" /></td>
					</tr>
				</c:forEach>
			</table>
	</nav>
	<div class="hs_div">
		<a href="${rootPath}" class="hs_home">홈으로</a>
		<a href="${rootPath}/api/my-food-add" class="hs_home">추가</a>
	</div>
	<section class="modal" id="modal_box"></section>
</body>
</html>