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
<title>Favorite</title>
</head>
<body>
	
	<div class="container">

		<div class="row">
			<article class="col-9 pe-0 pt-1">
				<header class="text-center py-5 mb-4">
					<div class="container">
						<h1 class="text-danger text-uppercase">favorites</h1>
					</div>
				</header>
				<div class="container">
					<div class="row">
					<jsp:include page="/content/alert.jsp"></jsp:include>
						<c:forEach var="item" items="${videos}">
							<div class="col-xl-4 col-md-6 mb-4" style="max-width: 400px">
								<div class="card border-0 shadow">
								<form action="./videoDetail" method="get">
								<input type="hidden" name="idVideo" value="${item.video.videoId}">
								<button type="submit" class="w-100" style="height: 350px">
									<img src="images/${item.video.poster}" class="card-img-top"
										style="max-height: 257px" alt="..." />
										
									<div class="card-body text-center">
										<h5 class="card-title mb-0">${item.video.title}</h5>
									</div>
									</button>
									</form>
									<div class="card-footer text-center d-flex justify-content-end">

										<a href="UnlikeVideo?videoId=${item.video.videoId}"
											class="btn btn-info border border-dark">Unlike</a> <a
											href="ShareVideo?videoId=${item.video.videoId}"
											class="btn btn-danger border border-dark"
											style="margin-left: 7px">Share</a>
									</div>
								</div>
							</div>
						</c:forEach>



						<div class="move text-center fs-1 mb-3">
						<c:forEach begin="1" end="${end}" var="i">
						<a class="btn btn-dark" href="/SOF3011_ASM/fvPage?location=${i}">${i}</a>
						</c:forEach>
							
						</div>
					</div>
				</div>
			</article>
			<aside class="col-3 pe-0 py-5">
				<div class="card mt-1 ml-n2 mr-n2">
					<div class="card-header">
						<i class="bi bi-search"></i>&nbsp; TÌM KIẾM
					</div>
					<div class="card-body">
						<form class="form-inline">
							<input type="search" class="form-control" placeholder="Search" />
						</form>
					</div>
				</div>
				<ul class="list-group">
					<div class="list-group-item text-uppercase fw-bold">
						<i class="bi bi-list-stars"></i> &nbsp; danh mục video
					</div>

					<li class="list-group-item"><a style="text-decoration: none"
						href="#!">HÀI ĐỘC THOẠI</a></li>
					<li class="list-group-item"><a style="text-decoration: none"
						href="#!">HÀI NƯỚC NGOÀI</a></li>
					<li class="list-group-item"><a style="text-decoration: none"
						href="#!">PHIM NGẮN</a></li>
					<li class="list-group-item"><a style="text-decoration: none"
						href="#!">KHÁM PHÁ TỰ NHIÊN</a></li>
					<li class="list-group-item"><a style="text-decoration: none"
						href="#!">KÊNH MUA SẮM</a></li>
				</ul>
			</aside>
		</div>
	</div>
</body>
</html>