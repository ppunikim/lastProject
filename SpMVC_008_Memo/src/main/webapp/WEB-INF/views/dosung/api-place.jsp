<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<%@ include file="/WEB-INF/views/dosung/head.jsp"%>

<body>
<%@ include file="/WEB-INF/views/dosung/header.jsp"%>

	<nav>
		<div class="hs_hs">
				<div style="width:300px">관광지 이름</div>
			<div style="width:180px">구 위치</div>
			<div style="width:400px">오시는 길</div>
			<div style="width:180px">운영 시간</div>
			<div style="width:400px">관광지 위치</div>
			<div style="width:140px">대표 사진</div>
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
				<c:forEach items="${apiPlace}" var='place' varStatus="INDEX">
					<tr data-seqplace="${place.UC_SEQ}">
						<td>${place.MAIN_TITLE}</td>
						<td>${place.GUGUN_NM}</td>
						<td>${place.TRFC_INFO}</td>
						<td>${place.USAGE_DAY_WEEK_AND_TIME}</td>
						<td>${place.ADDR1}</td>
						<td><img src="${place.MAIN_IMG_THUMB}" /></td>
					</tr>
				</c:forEach>
			
			</table>
	</nav>
</body>
