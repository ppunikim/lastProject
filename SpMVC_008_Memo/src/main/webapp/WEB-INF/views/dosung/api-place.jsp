<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<link rel="stylesheet" href="${rootPath}/static/css/api.css?ver=003" />
<%@ include file="/WEB-INF/views/dosung/head.jsp"%>
<style>
nav {
margin-top : 100px;}
</style>
<body>
<%@ include file="/WEB-INF/views/dosung/header.jsp"%>
	여긴 명소 페이지
	<nav>
		<div class="hs_hs">
			<div style="width:15%">관광지 이름</div>
			<div style="width:10%">구 위치</div>
			<div style="width:15%">주소</div>
			<div style="width:15%">전화번호</div>
			<div style="width:20%">운영시간</div>
			<div style="width:30%">이미지</div>
		</div>
		<div class="hs_scroll">
			<table class="hs_detail">
				<colgroup>
					<col width="15%">
					<col width="10%">
					<col width="15%">
					<col width="15%">
					<col width="20%">
					<col width="30%">
				</colgroup>
				<c:forEach items="${fullPlace}" var='foods' varStatus="INDEX">
					<tr data-myseq="${foods.UC_SEQ}">
						<td>${foods.MAIN_TITLE}</td>
						<td>${foods.GUGUN_NM}</td>
						<td>${foods.ADDR1}</td>
						<td>${foods.TRFC_INFO}</td>
						<td>${foods.USAGE_DAY_WEEK_AND_TIME}</td>
						<td><img src="${foods.MAIN_IMG_THUMB}" /></td>
					</tr>
				</c:forEach>
			
			</table>
		</div>
	</nav>
</body>
