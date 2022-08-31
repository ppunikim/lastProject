<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원가입</title>
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
		height: 80%;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: #efefef;
	}
	form {
		width: 50%;
		text-align: center;
	}
	legend {
		margin-bottom: 20px;
	}
	input {
		padding: 1rem;
		width: 100%;
		box-shadow: -6px -6px 14px rgba(255, 255, 255, 0.7),
          -6px -6px 10px rgba(255, 255, 255, 0.5),
          6px 6px 8px rgba(255, 255, 255, 0.075),
          6px 6px 10px rgba(0, 0, 0, 0.15);
        border-radius: 20px;
       border:none;
       margin-bottom: 20px;
	}
	button {
		border: 1px solid transparent;
		background-color: #aeadad7d;
		padding: 3px;
	}
</style>
</head>
<body>
	<form:form>
			<input name="username" placeholder="가입할 아이디를 입력하세요."	autofocus="autofocus" autocomplete="off">
			<input type="password" name="password" placeholder="비밀번호를 입력하세요." autocomplete="off">
			<input name="email" placeholder="이메일을 입력하세요.">
			<input name="realname" placeholder="이름을 입력하세요.">
			<input name="nickname" placeholder="닉네임을 입력하세요.">
	   		<button>회원가입</button>
	</form:form>
	<section></section>
</body>
</html>