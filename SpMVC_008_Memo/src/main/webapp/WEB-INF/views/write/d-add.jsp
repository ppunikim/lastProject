<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>diary 쓰기</title>
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
	display: flex;
	width: 100%;
	height: 100%;
	flex-direction: column;
	background-image: url(${rootPath}/static/images/texture.PNG);
}

#hs_flex_only {
	display: flex;
	width: 100px;
}

h3 {
	margin: 8px auto;
	font-weight: 800;
	font-size: 19px;
}

section {
	width: 70%;
	margin: 30px auto;
	text-align: center;
	max-width: 900px;
}

#hs_flex {
	display: flex;
	flex-direction: column;
}

input {
	padding-left: 6px;
}

textarea {
	height: 100px;
	padding: 7px;
}

form input {
	height: 33px;
	margin: 5px;
}
input {
	width : 20px;
}
.btn {
	background-color: #706c6c;
	color: #fff;
	border-radius: 10px;
	width: 70px;
}

.btns {
	margin-top: 20px;
}

.btn-light {
	background-color: #d4d3d3;
	color: black;
}

.d_inner {
	margin-bottom: 10px;
	color: red;
	margin-left: 5px;
	text-align: left;
	display: none;
}

.a_btn {
	padding: 4px;
	text-decoration: none;
	border: 1px solid black;
}

.hs_mor {
	justify-content: center;
	display: flex;
	align-items: center;
}
.hs_box{
	padding: 10px;
	border: 1.5px solid transparent;
	height: 130px;
	border-radius: 10px;
	min-width: 470px;
}
.hs_box:hover {
	padding: 10px;
	border: 1.5px solid black;
	transition: all 2s;
	border-radius: 20px;
}
textarea {
	width: 802px;
    height: 47px
}
.write {
	width: 450px;
}
.hs_lineheight {
	line-height: 55px;
}

</style>
<script>
	const rootPath = "${rootPath}"
</script>
<script src="${rootPath}/static/js/diary_detail.js?ver=9"></script>
</head>
<body>
	<section>
		<form:form modelAttribute="diaryVO">
			<h3>열심히 살지말고 즐기면서 살자</h3>
			<form:input path="d_day" readonly="true" type="hidden" />
		<div class="hs_box">
			<div class="hs_flex">
				<label>1. 아침 기록</label>
				<div class="hs_mor">
					<label>bad</label>
					<input type="radio" name="d_mor" value="m_bad"
						<c:if test="${D_DIARY.d_mor == 'm_bad'}">checked</c:if> /> 
						<label>soso</label>
					<input type="radio" name="d_mor" value="m_soso"
						<c:if test="${D_DIARY.d_mor == 'm_soso'}">checked</c:if> /> 
						<label>good</label>
					<input type="radio" name="d_mor" value="m_good"
						<c:if test="${D_DIARY.d_mor == 'm_good'}">checked</c:if> />
				</div>
				<div>
					<textarea name="d_mwrite"  class="write" placeholder="기분을 글로 표현해보세요." >${D_DIARY.d_mwrite}</textarea>
				</div>
		</div>
			</div>
		<div class="hs_box">
			<div class="hs_flex">
				<label>2. 점심 기록</label>
				<div class="hs_mor">
					<label>bad</label> <input type="radio" name="d_aft" value="a_bad"
					<c:if test="${D_DIARY.d_mor == 'm_good'}">checked</c:if> /> 
					<label>soso</label>
					<input type="radio" name="d_aft" value="a_soso"
					<c:if test="${D_DIARY.d_mor == 'm_good'}">checked</c:if> /> 
					<label>good</label>
					<input type="radio" name="d_aft" value="a_good"
					<c:if test="${D_DIARY.d_mor == 'm_good'}">checked</c:if> />
				</div>
				<div>
					<form:input path="d_awrite" value="${D_DIARY.d_awrite}" class="write"  placeholder="기분을 글로 표현해보세요." />
				</div>
			</div>
		</div>
		<div class="hs_box">
			<div class="hs_flex">
				<label>3. 저녁 기록</label>
				<div class="hs_mor">
					<label>bad</label> <input type="radio" name="d_din" value="d_bad"
						<c:if test="${D_DIARY.d_din== 'd_bad'}">checked</c:if> /> <label>soso</label>
					<input type="radio" name="d_din" value="d_soso"
						<c:if test="${D_DIARY.d_din== 'd_soso'}">checked</c:if> /> <label>good</label>
					<input type="radio" name="d_din" value="d_good"
						<c:if test="${D_DIARY.d_din== 'd_good'}">checked</c:if> />
				</div>
				<div>
					<form:input path="d_dwrite" value="${D_DIARY.d_dwrite}" class="write" placeholder="기분을 글로 표현해보세요." />
				</div>
			</div>
		</div>
		<div class="hs_box hs_lineheight">
			<div class="hs_flex">
				<div>
					<label>4. 밤: 내일 할일 정리하기</label>
				</div>
				<div>
					<form:input path="d_tom" value="${D_DIARY.d_tom}" class="write"  placeholder="내일 할 일을 정리해보세요." />
				</div>
			</div>
		</div>
		<div class="hs_box hs_lineheight">
			<div class="hs_flex">
				<div>
					<label>5. 오늘 하루 가장 좋았던 것 3가지</label>
				</div>
				<div>
					<form:input path="d_happy" class="write" 
						placeholder="오늘 하루 있었던 일 중, 가장 좋았던 일 3가지를 기록해보세요."
						value="${D_DIARY.d_happy}" />
				</div>
			</div>
		</div>
			<div class="hs_lineheight">
				<label>하루평가</label>
				<div class="hs_mor ">
					<label>bad</label> <input type="radio" name="d_today" value="t_bad" />
					<label>soso</label> <input type="radio" name="d_today"
						value="t_soso" /> <label>good</label> <input type="radio"
						name="d_today" value="t_good" />
			</div>
		</div>
			<div class="btns">
				<a href="${rootPath}/write/home" class="btn a_btn">리스트로</a> 
				<input
					class="btn btn-light" type="reset" value="다시쓰기"> 
					<input
					class="btn" type="submit" value="저장">
			</div>
		</form:form>
	</section>
</body>
</html>