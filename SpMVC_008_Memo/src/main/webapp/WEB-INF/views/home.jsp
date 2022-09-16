<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>하루를 간직하자</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<sec:authorize access="isAnonymous()">
		<section id="hs_home_sec">
			<h1>Keep_cherish the day</h1>
			<h3>please sign in :></h3>
		</section>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<section id="hs_home_sec">
			<h1>
				"
				<sec:authentication property="principal.username" />
				"_cherish the day

			</h1>
			<h3>diary, memo, books.. etc</h3>
		</section>
	</sec:authorize>

	<footer>
		<div>
			<a class="bottom">▼</a>
		</div>
	</footer>
	<p>Flamingos are famous for their bright pink feathers, stilt-like
		legs, and S-shaped neck. When a flamingo spots potential
		dinner—favorite foods include shrimp, snails, and plantlike water
		organisms called algae—it plunges its head into the water, twists it
		upside down, and scoops the fish using its upper beak like a shovel.
		They are able to "run" on water, thanks to their webbed feet, to gain
		speed before lifting up into the sky. Flamingos build nests that look
		like mounds of mud along waterways. At the top of the mound, in a
		shallow hole, the female lays one egg. The parents take turns sitting
		on the egg to keep it warm. After about 30 days, the egg hatches.
		Flamingos are famous for their bright pink feathers, stilt-like legs,
		and S-shaped neck. When a flamingo spots potential dinner—favorite
		foods include shrimp, snails, and plantlike water organisms called
		algae—it plunges its head into the water, twists it upside down, and
		scoops the fish using its upper beak like a shovel. They are able to
		"run" on water, thanks to their webbed feet, to gain speed before
		lifting up into the sky. Flamingos build nests that look like mounds
		of mud along waterways. At the top of the mound, in a shallow hole,
		the female lays one egg. The parents take turns sitting on the egg to
		keep it warm. After about 30 days, the egg hatches.</p>
</body>
</html>