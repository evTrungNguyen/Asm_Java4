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
	.item {
        margin-top: 20px;
      }
      label {
        margin-bottom: 5px;
      }
      .form-group {
        text-transform: uppercase;
      }
      .sort {
        display: flex;
        justify-content: flex-start;
        gap: 20px;
      }
</style>
<title>admin Layout</title>
<!-- <base href="/SOF3011_ASM/adLayout"> -->
</head>
<body>
    <nav class="row me-0">
      <nav
        class="navbar navbar-expand-lg bg-body-tertiary bg-secondary fw-bold"
      >
        <div class="container-fluid">
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a
                  class="nav-link active text-uppercase text-warning ms-3 fs-5"
                  aria-current="page"
                  href="/SOF3011_ASM/videoManagement"
                  >administration tool</a
                >
              </li>
            </ul>
            <li class="nav-item">
              <a class="nav-link text-uppercase ms-5 text-info" href="/SOF3011_ASM/Homepage"
                >home</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link text-uppercase ms-5 text-info" href="/SOF3011_ASM/videoManagement"
                >videos</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link text-uppercase ms-5 text-info" href="/SOF3011_ASM/userManagement"
                >users</a
              >
            </li>
            <li class="nav-item" style="margin-right: 20px">
              <a class="nav-link text-uppercase ms-5 text-info" href="/SOF3011_ASM/report"
                >reports</a
              >
            </li>
          </div>
        </div>
      </nav>
    </nav>
    <jsp:include page="${adcontent}"></jsp:include>
  </body>
</html>