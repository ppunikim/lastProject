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

<link rel="stylesheet" href="${rootPath}/static/css/home.css?ver=2" />
</head>
<body>
	<header class="hs_flex hs_sa hs_fix">
		<img src="static/images/sign.png" width="50vw">
		<div class="hs_fix hs_border">
			<div class="hs_flex">
				<div class="z_log hs_menu">
					<div class="z_log hs_top hs_head">about</div>
					<div class="hs_drop">
						<sec:authorize access="isAnonymous()">
							<a href="${rootPath}/user/login">로그인</a>
						</sec:authorize>
						<sec:authorize
							access="isAuthenticated() AND hasRole('ROLE_ADMIN')">
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
			</div>
		</div>
	</header>
	<sec:authorize access="isAnonymous()">
		<section>
			<h1>Keep_cherish the day</h1>
			<h3>please sign in :></h3>
		</section>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">

		<section>
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
		on the egg to keep it warm. After about 30 days, the egg hatches.</p>
	<p>Flamingos are famous for their bright pink feathers, stilt-like
		legs, and S-shaped neck. When a flamingo spots potential
		dinner—favorite foods include shrimp, snails, and plantlike water
		organisms called algae—it plunges its head into the water, twists it
		upside down, and scoops the fish using its upper beak like a shovel.
		They are able to "run" on water, thanks to their webbed feet, to gain
		speed before lifting up into the sky. Flamingos build nests that look
		like mounds of mud along waterways. At the top of the mound, in a
		shallow hole, the female lays one egg. The parents take turns sitting
		on the egg to keep it warm. After about 30 days, the egg hatches.</p>
	<p>Flamingos are famous for their bright pink feathers, stilt-like
		legs, and S-shaped neck. When a flamingo spots potential
		dinner—favorite foods include shrimp, snails, and plantlike water
		organisms called algae—it plunges its head into the water, twists it
		upside down, and scoops the fish using its upper beak like a shovel.
		They are able to "run" on water, thanks to their webbed feet, to gain
		speed before lifting up into the sky. Flamingos build nests that look
		like mounds of mud along waterways. At the top of the mound, in a
		shallow hole, the female lays one egg. The parents take turns sitting
		on the egg to keep it warm. After about 30 days, the egg hatches.</p>
	<p>Flamingos are famous for their bright pink feathers, stilt-like
		legs, and S-shaped neck. When a flamingo spots potential
		dinner—favorite foods include shrimp, snails, and plantlike water
		organisms called algae—it plunges its head into the water, twists it
		upside down, and scoops the fish using its upper beak like a shovel.
		They are able to "run" on water, thanks to their webbed feet, to gain
		speed before lifting up into the sky. Flamingos build nests that look
		like mounds of mud along waterways. At the top of the mound, in a
		shallow hole, the female lays one egg. The parents take turns sitting
		on the egg to keep it warm. After about 30 days, the egg hatches.</p>

</body>
<script>
	const scroll = document.querySelector(".bottom");
	var s_bottom = scroll.offsetBottom;
	
	scroll.onclick = () => {
	    window.scroll({bottom: s_bottom,behavior:'smooth'})
	}
</script>
</html>