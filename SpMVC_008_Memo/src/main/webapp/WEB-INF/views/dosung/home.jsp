<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.d-main {
	margin-top: 100px;
	width: 100%;
	position: relative;
}

div.d-map {
	position: absolute;
	left: 0;
}

div.d-content {
	position: absolute;
	left: 950px;
	width: 850px;
	height: 800px;
	padding-top: 30px;
	overflow: hidden;
}

div.d-map img {
	width: 1200px;
	border: none;
}
</style>
</head>
<%@ include file="/WEB-INF/views/dosung/head.jsp"%>
<body>
	<%@ include file="/WEB-INF/views/dosung/header.jsp"%>

	<div class="d-main">
		<div class="d-map">
			<!-- Image Map Generated by http://www.image-map.net/ -->
			<img src="${rootPath}/static/images/d-map.png" usemap="#busan"
				id="map-img">
			<map name="busan">
				<area target="_blank" alt="강서구" title="강서구"
					onclick="dosungPower(event)"
					coords="348,331,347,367,319,386,244,672,96,594,52,476,173,468,172,369"
					shape="poly">
				<area target="_blank" alt="사상구" title="사상구"
					onclick="dosungPower(event)"
					coords="320,404,352,387,354,399,399,413,390,435,387,463,394,490,391,504,369,502,373,533,352,532,334,543,312,536,321,490,311,470"
					shape="poly">
				<area target="_blank" alt="사하구" title="사하구"
					onclick="dosungPower(event)"
					coords="313,540,342,550,374,538,379,564,383,581,380,619,373,675,346,654,341,704,322,676,320,591,312,587,289,603,276,608,280,562"
					shape="poly">
				<area target="_blank" alt="서구" title="서구"
					onclick="dosungPower(event)"
					coords="379,512,394,593,382,668,411,671,409,599,407,516"
					shape="poly">
				<area target="_blank" alt="중구" title="중구"
					onclick="dosungPower(event)"
					coords="418,559,431,562,453,568,445,579,421,589,414,574"
					shape="poly">
				<area target="_blank" alt="영도구" title="영도구"
					onclick="dosungPower(event)"
					coords="463,572,509,588,537,671,436,609" shape="poly">
				<area target="_blank" alt="남구" title="남구"
					onclick="dosungPower(event)"
					coords="524,477,488,483,474,551,538,589,580,549" shape="poly">
				<area target="_blank" alt="수영구" title="수영구"
					onclick="dosungPower(event)"
					coords="561,433,580,465,574,494,545,498,534,471,530,435"
					shape="poly">
				<area target="_blank" alt="동구" title="동구"
					onclick="dosungPower(event)"
					coords="420,514,440,512,444,500,467,504,470,519,465,552,420,551"
					shape="poly">
				<area target="_blank" alt="부산진구" title="부산진구"
					onclick="dosungPower(event)"
					coords="409,420,433,398,456,417,489,440,491,473,456,482,425,487,407,504,401,463"
					shape="poly">
				<area target="_blank" alt="연제구" title="연제구"
					onclick="dosungPower(event)"
					coords="499,396,539,407,526,424,514,452,496,426,475,417,469,406"
					shape="poly">
				<area target="_blank" alt="동래구" title="동래구"
					onclick="dosungPower(event)"
					coords="466,346,496,340,511,345,510,354,544,369,557,385,553,403,500,388,484,392,469,399,451,394,452,377"
					shape="poly">
				<area target="_blank" alt="북구" title="북구"
					onclick="dosungPower(event)"
					coords="396,244,442,245,440,256,430,265,447,279,444,289,452,305,448,321,468,331,455,357,439,384,407,406,375,401,359,389,372,320"
					shape="poly">
				<area target="_blank" alt="금정구" title="금정구"
					onclick="dosungPower(event)"
					coords="467,199,490,211,543,189,579,201,573,234,563,263,596,284,574,326,553,360,502,337,455,316,452,278,447,249"
					shape="poly">
				<area target="_blank" alt="기장군" title="기장군"
					onclick="dosungPower(event)"
					coords="588,67,651,95,690,70,692,24,750,36,797,28,821,64,826,90,818,110,856,129,852,153,825,137,798,148,785,179,789,194,788,226,770,244,746,260,748,271,766,273,764,313,745,341,729,363,742,386,717,414,705,386,694,387,667,389,633,369,644,335,629,316,624,301,595,275,573,262,588,211,578,191,556,180,574,128"
					shape="poly">
				<area target="_blank" alt="해운대" title="해운대"
					onclick="dosungPower(event)"
					coords="607,299,622,308,619,317,631,332,624,363,636,385,665,407,676,411,690,405,700,420,682,457,650,469,597,468,570,431,560,390,563,361,573,339"
					shape="poly">

			</map>


		</div>
		<div class="d-content"></div>
	</div>
</body>

</html>