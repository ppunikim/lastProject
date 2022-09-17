<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>JSP 파일</title>
<style>
div.hs_m_first_div {
	padding: 10px;
	margin: 30px auto;
}

table.hs_container tr td {
	padding: 5px;
}
</style>
</head>
<script>
	const rootPath = '${rootPath}'
</script>
<script src="${rootPath}/static/js/memo_detail.js?ver=14"></script>
<body>
	<div class="hs_m_first_div">
		<section>
			<article>
				<div class="main_div">
					<form:form modelAttribute="MEMOLIST" class="main_memo">
						<input type="hidden" value="${M_MEMO.m_seq}">
						<div class="auto">
							<textarea name="m_memo" id="MEMO"
								class="w3-input w3-border input_memo" placeholder="메모를 입력하세요."
								autofocus="autofocus" required="required" autocomplete="off">${M_MEMO.m_memo}</textarea>
						</div>
						<div id="hs_save">
							<c:if test="${not empty M_MEMO.m_seq}">
								<a href="${rootPath}/memo/${M_MEMO.m_seq}/delete"
									class="w3-button w3-round-xxlarge w3-padding-large">삭제</a>
							</c:if>
							<input type="submit" placeholder="전송" value="저장"
								class="w3-button w3-round-xxlarge w3-padding-large ">
						</div>
					</form:form>
				</div>
			</article>
			<article>
				<div class="hs_memos">
					<c:if test="${empty MEMOLIST}">
						<tr>
							<td colspan="6">작성한 내용이 없습니다.</td>
						</tr>
					</c:if>
					<table class="hs_memo hs_container">
						<c:forEach items="${MEMOLIST}" var="memo" varStatus="INDEX">
							<tr data-seq="${memo.m_seq}">
								<td>${memo.m_date}</td>
								<td>${memo.m_time}</td>
								<td id="hs_flex_memo">${memo.m_memo}</td>
							</tr>
						</c:forEach>
					</table>

				</div>
			</article>
		</section>
		<div style="border-top: 2px solid black">
			<p>추가할 사항 : detail 들어가지는 것, 들어가서 수정 삭제 되는지 확인하기</p>
		</div>
	</div>
</body>
</html>