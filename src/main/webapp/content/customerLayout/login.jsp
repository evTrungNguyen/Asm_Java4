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
<style><%@include file="/css/style.css"%></style>
<style type="text/css">
body {
	background: #007bff;
	background: linear-gradient(to right, #0062e6, #33aeff);
}

.btn-login {
	font-size: 0.9rem;
	letter-spacing: 0.05rem;
	padding: 0.75rem 1rem;
}

.btn-google {
	color: white !important;
	background-color: #ea4335;
}

.btn-facebook {
	color: white !important;
	background-color: #3b5998;
}
</style>
<title>Login</title>
</head>
<body>
	
	<div class="row me-0">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card border-0 shadow rounded-3 my-5">
				<div class="card-body p-4 p-sm-5">
					<h5 class="card-title text-center mb-5 fw-light fs-5">ONLINE ENTERTAINMENT</h5>
					<jsp:include page="/content/alert.jsp"></jsp:include>
					<form action="/SOF3011_ASM/Login" method="post">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="username" name="username" required />
							<label for="floatingInput">Tên đăng nhập</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control" id="floatingPassword"
								placeholder="Password" name="password" required  />
							<label for="floatingPassword">Mật khẩu</label>
						</div>

						<div class="form-check mb-3">
							<input class="form-check-input" type="checkbox" name="remember"
								id="rememberPasswordCheck" /> <label
								class="form-check-label" for="rememberPasswordCheck">
								Lưu mật khẩu </label>
						</div>
						<div class="d-grid">
							<button type="submit"
								class="btn btn-primary btn-login text-uppercase fw-bold w-50 m-auto"
								>Đăng nhập</button>
						</div>
						<hr class="my-4" />
						<div class="d-grid mb-2">
							<button class="btn btn-google btn-login text-uppercase fw-bold"
								type="submit">
								<i class="fab fa-google me-2"></i> Sign in with Google
							</button>
						</div>
						<div class="d-grid">
							<button class="btn btn-facebook btn-login text-uppercase fw-bold"
								type="submit">
								<i class="fab fa-facebook-f me-2"></i> Sign in with Facebook
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>