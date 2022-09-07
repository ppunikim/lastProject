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
<link rel="stylesheet" href="${rootPath}/static/css/dosung/reset.css" />
<link rel="stylesheet" href="${rootPath}/static/css/dosung/header.css" />
<link rel="stylesheet" href="${rootPath}/static/css/dosung/main.css" />
<link rel="stylesheet" href="${rootPath}/static/css/dosung/home.css" />
<link rel="stylesheet" href="${rootPath}/static/css/dosung/result.css" />



<link rel="stylesheet" href="${rootPath}/static/css/api.css" />
<script>
	const rootPath = '${rootPath}'
</script>
<script src="${rootPath}/static/js/api.js?ver=013"></script>
<script src="${rootPath}/static/js/dosung/ajax.js?ver=12"></script> 
</head>