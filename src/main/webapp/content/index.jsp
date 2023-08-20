<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="../css/style.css" rel="stylesheet" type="text/css">
<title>Homepage</title>
</head>
<body>
	<div class="container">

		<div class="row">
		<jsp:include page="/content/alert.jsp"></jsp:include>
			<article class="col-9 pe-0 pt-1">
				<header class="text-center py-5 mb-4">
					<div class="container">
						<h1 class="text-danger text-uppercase">top trending</h1>
					</div>
				</header>
				<div class="container">
					<div class="row">
						<c:forEach var="item" items="${videos}">
							<div class="col-xl-4 col-md-6 mb-4" style="max-width: 400px">
								<div class="card border-0 shadow">
									<img src="images/${item.poster}" class="card-img-top"
										style="max-height: 257px" alt="..." />
										
									<div class="card-body text-center">
										<h5 class="card-title mb-0">${item.title}</h5>
									</div>
									<div class="card-footer text-center d-flex justify-content-end">

										<a href="LikeVideo?videoId=${item.videoId}"
											class="btn btn-info border border-dark">Like</a> <a
											href="ShareVideo?videoId=${item.videoId}"
											class="btn btn-danger border border-dark"
											style="margin-left: 7px">Share</a>
									</div>
								</div>
							</div>
						</c:forEach>



						<div class="move text-center fs-1 mb-3">
						<c:forEach begin="1" end="${end}" var="i">
						<a class="btn btn-dark" href="/SOF3011_ASM/Page?location=${i}">${i}</a>
						</c:forEach>
							<!-- <button type="button" class="btn btn-dark">
								<svg xmlns="http://www.w3.org/2000/svg" width="55" height="16"
									fill="currentColor" class="bi bi-chevron-bar-left"
									viewBox="0 2 16 16">
                  <path fill-rule="evenodd"
										d="M11.854 3.646a.5.5 0 0 1 0 .708L8.207 8l3.647 3.646a.5.5 0 0 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 0 1 .708 0zM4.5 1a.5.5 0 0 0-.5.5v13a.5.5 0 0 0 1 0v-13a.5.5 0 0 0-.5-.5z" />
                </svg>
							</button>
							<button type="button" class="btn btn-dark">
								<svg xmlns="http://www.w3.org/2000/svg" width="55" height="16"
									fill="currentColor" class="bi bi-chevron-double-left"
									viewBox="0 2 16 16">
                  <path fill-rule="evenodd"
										d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
                  <path fill-rule="evenodd"
										d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
                </svg>
							</button>
							<button type="button" class="btn btn-dark">
								<svg xmlns="http://www.w3.org/2000/svg" width="55" height="16"
									fill="currentColor" class="bi bi-chevron-double-right"
									viewBox="0 2 16 16">
                  <path fill-rule="evenodd"
										d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z" />
                  <path fill-rule="evenodd"
										d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z" />
                </svg>
							</button>
							<button type="button" class="btn btn-dark">
								<svg xmlns="http://www.w3.org/2000/svg" width="55" height="16"
									fill="currentColor" class="bi bi-chevron-bar-right"
									viewBox="0 2 16 16">
                  <path fill-rule="evenodd"
										d="M4.146 3.646a.5.5 0 0 0 0 .708L7.793 8l-3.647 3.646a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708 0zM11.5 1a.5.5 0 0 1 .5.5v13a.5.5 0 0 1-1 0v-13a.5.5 0 0 1 .5-.5z"></path>
                </svg>
							</button> -->
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

	<footer>
		<div class="row card-footer bg-info ps-3 pb-3 ms-0 me-0">
			<h4 class="text-uppercase fs-2 pt-3">CÔNG TY ONLINE
				ENTERTAINMENT</h4>
			<div class="row">
				<div class="col-6 text-light">
					<i class="bi bi-star-fill"></i> &nbsp; Cơ sở Hà Nội: Cổng số 1, Tòa
					nhà FPT Polytechnic, phố Trịnh Văn Bô, phường &nbsp Phương Canh,
					quận Nam Từ Liêm, TP Hà Nội <br /> <i class="bi bi-telephone-fill"></i>
					&nbsp; 024 8582 0808 <br /> <br /> <i class="bi bi-star-fill"></i>
					&nbsp; Cơ sở Thái Nguyên: Tòa nhà FPT Polytechnic, đường đê Mỏ
					Bạch, tổ 10, phường Quyết Thắng, TP Thái Nguyên, tỉnh Thái Nguyên <br />
					<i class="bi bi-telephone-fill"></i> &nbsp; 028 6686 6486
				</div>
				<div class="col-6 text-light">
					<i class="bi bi-star-fill"></i> &nbsp; Cơ sở Hồ Chí Minh: Tòa nhà
					QTSC9 (toà T), đường Tô Ký, phường Tân Chánh Hiệp, quận 12, TP HCM
					<br /> <i class="bi bi-telephone-fill"></i> &nbsp; 028 6686 6486 <br />
					<br /> <i class="bi bi-star-fill"></i> &nbsp; Cơ sở Hà Nam :Đường
					Lê Duẩn, khu Đô Thị CEO 1, phường Liêm Chính, TP Phủ Lý, tỉnh Hà
					Nam <br /> <i class="bi bi-telephone-fill"></i> &nbsp; 0911 968
					213
				</div>
			</div>
		</div>
	</footer>
</body>
</html>