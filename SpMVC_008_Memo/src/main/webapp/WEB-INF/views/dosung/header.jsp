<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<style>
header {
	background-image: url(${rootPath}/static/images/paper2.PNG);
	width: 100%;
	display: flex;
	justify-content: space-between;
	height: 100px;
	align-content: center;
	align-items: center;
}

header>div {
	margin: 0 50px;
}

div.d-hslogo img {
	width: 50px;
}
.z_log {
  line-height: 46px;
  /* margin-left: auto; */
  color: #3f4338;
  text-decoration: none;
  font-weight: 700;
  font-size: 23px;
}
.hs_menu {
	position: relative;
	display: inline-block;
	cursor: pointer;
	vertical-align: top;
}

.hs_top {
	outline: none;
	cursor: pointer;
}
.hs_head {
  flex: 1;
}
.hs_drop {
  min-height: 0;
  visibility: hidden;
  opacity: 0;
  transform: translateY(-2rem);
  list-style: none;
  position: absolute;
  min-width: 100px;
  transition: 0.8s;
  cursor: pointer;
  background-color: transparent;
}
.hs_drop a,
.hs_drop button {
  color: #eee;
  border-radius: 25px;
  background-color: #686767;
  padding: 10px;
  font-weight: 300;
  text-decoration: none;
  font-size: 18px;
}

.hs_menu:hover .hs_drop,
.hs_drop:hover button {
  cursor: pointer;
  visibility: visible;
  opacity: 1;
  transform: translateY(0);
}
</style>
<header>
	<div class="d-hslogo">
		<a href="${rootPath}"> <img
			src="${rootPath}/static/images/sign.png">
		</a>
	</div>
	<div>
		임시 박스 (검색창, 버튼 등)
		<a href="${rootPath}/api/map" class="hs_place">지도</a>
		<a href="${rootPath}/api/place" class="hs_place">명소</a> 
		<a href="${rootPath}/api/food" class="hs_place">맛집</a>
	</div>
	<div class="z_log hs_menu">
		<div class="z_log hs_top hs_head">about</div>
		<div class="hs_drop">
			<sec:authorize access="isAnonymous()">
				<a href="${rootPath}/user/login">로그인</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated() AND hasRole('ROLE_ADMIN')">
				<a href="${rootPath}/admin/home">admin</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="${rootPath}/write/home">글쓰기</a>
				<br>
				<a href="${rootPath}/api/home">또가자</a>
				<br>
				<a href="${rootPath}/study/home">스터디</a>
				<br>
				<form:form action="${rootPath}/user/login">
					<button>logout</button>
				</form:form>
			</sec:authorize>
		</div>
	</div>

</header>
