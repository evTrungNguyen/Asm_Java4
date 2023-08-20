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

<title>Forgot Password</title>
</head>
<body>
	<div 
      class="col-4 m-auto border border-4 border-info col-md-6 col-xl-5 shadow rounded mt-5"
    >
<form action="/SOF3011_ASM/ForgotPassword" method="post">
      <div class="bg-warning text-white text-uppercase text-center px-3 py-3">
        <h4>forgot password</h4>
      </div>
			<jsp:include page="/content/alert.jsp"></jsp:include>

      <div class="form-group p-3">
        <label>USERNAME?</label><br />
        <input class="w-100" name="username" />
      </div>
      <div class="form-group p-3">
        <label>EMAIL?</label><br />
        <input class="w-100" name="email" type="email" />
      </div>

      <hr />
      <div class="d-flex justify-content-around">
        <button class="btn btn-secondary mb-3" disabled>Back</button>
        <button type="submit" class="btn btn-danger mb-3">Retrieve</button>
      </div>
</form>
    </div>
</body>
</html>