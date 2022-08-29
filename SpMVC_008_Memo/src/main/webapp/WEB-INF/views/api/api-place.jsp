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
<title>부산 명소추천</title>
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
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
}
.hs_body{
	
}
.hs_first {
	width: 417px;
	margin: 30px;
}

.hs_head {
	display: flex;
	margin: 10px;
	overflow-x: scroll;
	width: 1440px;
}
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<h2>부산 명소 추천</h2>
	<div class="hs_body">
		<div class="hs_head">
			<c:forEach items="${PLACE}" var="place">
				<div class="w3-card-4 hs_first">
					<div class="w3-display-container w3-hover-opacity">
						<img src="${place.MAIN_IMG_THUMB}" alt="부산명소" />
						<div class="w3-display-middle w3-display-hover">
							<a href="${rootPath}/api/${place.UC_SEQ}/place-detail"
								class="w3-button w3-black">자세히</a>
						</div>
					</div>
					<div class="w3-container w3-padding-16 w3-margin">
						<div>${place.MAIN_TITLE}</div>
						<div>${place.ADDR1}</div>
						<div>${place.HLDY_INFO}</div>
						<div>${place.USAGE_DAY_WEEK_AND_TIME}</div>
						<div>${place.USAGE_AMOUNT}</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>