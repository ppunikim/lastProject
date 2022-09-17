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
<link rel="stylesheet" href="${rootPath}/static/css/diary_list.css?ver=0" />
<title>JSP 파일</title>
<script>
	const rootPath = "${rootPath}"
</script>
</head>
<body>
	<section>
		<article>
			<div class="hs_flex hs_content">
				<h3>제목</h3>
				<a class="add_btn" href="${rootPath}/write/d-add">오늘은 일기쓰는 날</a> 
			</div>
			<c:if test="${empty DIARYLIST}">
				<tr>
					<td colspan="6" class="hs_blank">작성한 내용이 없습니다.</td>
				</tr>
			</c:if>
			<table class="memos scroll diarys">
				<colgroup>
					<col width="24%">
					<col width="19%">
					<col width="19%">
					<col width="19%">
					<col width="19%">
				</colgroup>
				<c:forEach items="${DIARYLIST}" var="diary" >
						<tr>
							<th><a href="${rootPath}/write/${diary.d_day}/d-detail">${diary.d_day}</a></th>
							<td>${diary.d_mor}</td>
							<td>${diary.d_aft}</td>
							<td>${diary.d_din}</td>
							<td>${diary.d_today}</td>
						</tr>
				</c:forEach>
			</table>
			<div id="hs_img" class="hs_flex">
				<div class="hs_left"></div>
				<img src="${rootPath}/static/images/good.png">
			</div>
		</article>
	</section>
	<div style="border-top: 2px solid black">
			<p>추가할 사항 : detail 들어가서 제대로 데이터 전송 저장 되도록 만들기</p>
		</div>
</body>
</html>