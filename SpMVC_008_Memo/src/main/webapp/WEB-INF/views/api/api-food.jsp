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
.hs_width {
	background-color:#f5f5f5;
}
.hs_place {
	text-decoration: none;
	border: 1px solid transparent;
	border-radius: 50px;
	height: 40px;
    width: 45px;
    text-align: center;
    margin: 30px 0 0 20px;
    background-color:#3f3e3e9e;
    color: white;
    line-height: 32px;
    font-size: small;
    
}
img {
	border: 1px solid #aaa;
}
tr:hover{
	transform: scale(1.01,1.01);
	
}
tr{
	overflow: hidden;
	transition-duration: 300ms;
}
header {
	background-color: #eee;
}
.hs_adbtn{
	border: 1px solid transparent;
	border-radius: 40px;
	background-color: #919191c7;
	margin-left: 30px;
	padding: 10px;
	height: 50px;
	margin-top: 25px;
}
.hs_add {
	line-height: 30px;
	color: #fffdfd;
}
</style>
<link rel="stylesheet" href="${rootPath}/static/css/api.css?ver=003" />
<script>
	const rootPath = '${rootPath}'
</script>
<script src="${rootPath}/static/js/api.js?ver=012"></script>
</head>
<body>
	<!-- 최종 구현하고자 하는 것 
 	1. 한줄 클릭하면 modal box 로 그 라인만 크게 보이게 하는 것, (detail)설명란 추가
 	2. pageNation 구현하기
 	3. 랜덤 이미지 클릭했을 때 음식 상세 페이지로 이동하기
 -->
	<header>
		<form:form>
			<select name="cat">
				<option value="Place">장소검색</option>
				<option value="Food">음식검색</option>
			</select>
			<input name="search" placeholder="검색어를 입력하세요." />
			<button>검색</button>
		</form:form>
		<div class="hs_adbtn">
			<a class="hs_add">추가</a>
		</div>
	</header>
	<nav>
		<div class="hs_width">
			<h4>오늘의 추천 메뉴 (◕ᴗ◕✿)</h4>
			<div class="hs_how">
				<c:forEach items="${RANDOM}" var="random">
					<label for="this"></label>
					<div data-seq="${random.UC_SEQ}"><a
						href="${rootPath}/api/${random.UC_SEQ}/api-look">
						<img src="${random.MAIN_IMG_THUMB}" id="this" class="img" /></a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="hs_hs">
			<div style="width:15%">음식점이름</div>
			<div style="width:10%">구 위치</div>
			<div style="width:15%">음식점위치</div>
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
				<c:if test="${empty api}">
					<tr>
						<td></td>
						<td>검색</td>
						<td>결과가</td>
						<td>없습니다</td>
						<td></td>
						<td></td>
					</tr>
				</c:if>
				<c:forEach items="${FOOD}" var='food'>
					<tr>
						<td><a href="${rootPath}/api/${food.main_title}/my-look">${food.main_title}</a></td>
						<td>${food.gugun_nm}</td>
						<td>${food.addr1}</td>
						<td>${food.cntct_tel}</td>
						<td>${food.usage_day_week_and_time}</td>
						<td><img src="${food.main_img_thumb}" /></td>
					</tr>
				</c:forEach>
				<c:forEach items="${api}" var="aapi">
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
		</div>
	</nav>
	<div class="hs_div">
		<a href="${rootPath}" class="hs_home">홈으로</a>
	</div>
	<section class="modal" id="modal_box"></section>
</body>
</html>