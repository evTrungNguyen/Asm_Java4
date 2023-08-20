<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.bundle.min.js"
	integrity="sha512-i9cEfJwUwViEPFKdC1enz4ZRGBj8YQo6QByFTF92YXHi7waCqyexvRD75S5NVTsSiTv7rKWqG9Y5eFxmRsOn0A=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css"
	integrity="sha512-SbiR/eusphKoMVVXysTKG/7VseWii+Y3FdHrt0EpKgpToZeemhqHeZeLWLhJutz/2ut2Vw1uQEj2MbRF+TVBUA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<style><%@include file="/css/style.css"%></style>
<title>Homepage</title>
</head>
<body>
	
		
			
		
	
	<nav class="row me-0">
		<nav class="navbar navbar-expand-lg bg-body-tertiary bg-warning">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a
							class="nav-link active text-uppercase fw-bold text-danger fs-5" aria-current="page"
							href="/SOF3011_ASM/Homepage">online entertainment</a></li>
							<c:if test="${!sessionScope.isLogin}">
						<li class="nav-item"><a class="nav-link text-uppercase ms-5 mt-1 fw-semibold text-primary"
							href="/SOF3011_ASM/Favorite">my favorites</a></li>								
							</c:if>
							<c:if test="${sessionScope.isLogin}">
						<li class="nav-item"><a class="nav-link text-uppercase ms-5 mt-1 fw-semibold text-primary"
							href="/SOF3011_ASM/Favorite">${sessionScope.username}'s &nbsp; favorites</a>
							</li>											
							</c:if>
					</ul>
				</div>
				<li class="nav-item dropdown" style="margin-right: 5px"><a
					class="nav-link dropdown-toggle text-primary fw-semibold" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false">
						MY ACCOUNT <i class="bi bi-person-lines-fill"></i>
				</a>
					<ul class="dropdown-menu">
					<c:if test="${!sessionScope.isLogin}">
						<li><a class="dropdown-item" href="/SOF3011_ASM/Login">Login</a></li>
						<li><a class="dropdown-item" href="/SOF3011_ASM/ForgotPassword">Forgot Password</a></li>
						<li><a class="dropdown-item" href="/SOF3011_ASM/Registration">Registration</a>
						</li>
						
						</c:if>
							
						
						<c:if test="${sessionScope.isLogin}">
						<li><a class="dropdown-item" href="Logoff">Logoff</a></li>
						<li><a class="dropdown-item" href="/SOF3011_ASM/changePassword">Change
								Password</a></li>
						<li><a class="dropdown-item" href="/SOF3011_ASM/EditProfile">Edit
								profile</a></li>
								<c:if test="${sessionScope.isAdmin}">								
						<li><a class="dropdown-item" href="/SOF3011_ASM/videoManagement">Developer mode</a></li>
								</c:if>
								</c:if>
					</ul></li>
			</div>
		</nav>
	</nav>
	<jsp:include page="${content}" />

			
		

</body>
</html>