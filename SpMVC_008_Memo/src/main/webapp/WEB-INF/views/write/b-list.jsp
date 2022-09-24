<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서록 리스트</title>
<style>
div.hs_b_div {
	display: flex;
	justify-content: space-between;
}
div.hs_b_div div.hs_blist_div{
	cursor: pointer;
	padding: 10px;
	font-size: 21px;
    margin-top: 5px;
} 
div.hs_blist_result {
margin-top: 20px;
}
article div.hs_blist_divresult {
	padding: 10px;
    font-size: 17px;
    margin-top: 10px;
    cursor: pointer;
}
article div.hs_blist_divresult:hover {
	color: #5151d5;
	font-weight: bold;
}
</style>
<script>
	const rootPath = '${rootPath}'
</script>
<script src="${rootPath}/static/js/write_ajax.js?ver=13"></script>
</head>
<body>
<div class="hs_b_div">
	<section>
		<div class="hs_b_div">
			<div class="hs_blist_div"  onClick="writeBook(event)">독후감 작성</div>
			<a href="${rootPath}/write/api_book_news">+뉴스, 책 정보 더보기</a>
		</div>
		<article>
			<c:forEach items="${BOOK}" var="book">
				<div onClick="updateBook(event)" class="hs_blist_divresult">${book.b_isbn} & ${book.b_title}</div>
			</c:forEach>
		</article>
	</section>
	<section>
		<div class="hs_blist_result"></div>
	</section>
</div>
</body>
</html>