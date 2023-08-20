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
<title>Share</title>
</head>
<body>
    <form action="/SOF3011_ASM/ShareVideo" method="post">
    <input type="hidden" name="videoId" value="${videoId}">
    <div class="container col-6 mt-5">
      <div class="card border border-dark">
        <div class="card-header text-uppercase fw-bold">
          <h3>send video to your friend</h3>
        </div>
        <jsp:include page="/content/alert.jsp"></jsp:include>
        <div class="card-body text-uppercase">
          <h5>your friend's email?</h5>
          <input class="w-100" style="height: 40px" name="email" value="${email}" id="email" type="email" />
        </div>
        <div class="card-footer ms-auto bg-white border-0">
          <button class="btn btn-danger text-light">Send</button>
        </div>
      </div>
    </div>
    </form>
  </body>
</html>