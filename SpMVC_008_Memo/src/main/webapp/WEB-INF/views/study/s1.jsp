<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<title>첫 번째 공부</title>
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

</style>
</head>
<body>
<h4>sp_mvc_003_school</h4>
<c:forEach items="NEWS" var="news">
<p>${news.title}</p>
<!-- search 를 null 값 줘서 nullpointer 오류 났다.
 이것을 해결하기 위해 다른 api 보면서 한번 생각해보자. -->
</c:forEach>
</body>
</html>