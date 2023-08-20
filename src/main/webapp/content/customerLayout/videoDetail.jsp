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
<title>Video Detail</title>
</head>
<body>
    <div class="container-fluid">
      

        

        <div class="row me-0">
          <article class="col-9 pe-0 pt-1">
            <div class="card mb-3">
              <div class="card-header text-center">
                <!-- <iframe
                  width="800"
                  height="350"
                  src="https://www.youtube.com/embed/_fghQ0axjSo"
                  title="YouTube video player"
                  frameborder="0"
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                  allowfullscreen
                ></iframe> -->
                <img src="images/${poster}" class="card-img-top"
				style="height: 400px; width:800px" />
              </div>
              <div class="card-body text-uppercase fw-bold">
                <div class="title fs-2">${title}</div>
                <br />
                <hr />
                <div class="detail fs-1">${description}</div>
                <br /><br /><br /><br />
              </div>
              <div class="card-footer text-center d-flex justify-content-end">
                <button class="btn btn-info border border-dark">Like</button>
                <button
                  class="btn btn-danger border border-dark"
                  style="margin-left: 7px"
                >
                  Share
                </button>
              </div>
            </div>
          </article>
          <aside class="col-3  pe-0 pt-1">
          <c:forEach var="vid" items="${videos}">
          <form action="./videoDetail?idVideo=${idVideo}" method="get">
          <input type="hidden" name="idVideo" value="${vid.videoId}">
            <button class="mb-2" type="submit" style="height: 110px;width: 300px">
            <div
              class="video card border mb-5"
              style="display: flex; flex-direction: row"
            >
              <img src="images/${vid.poster}" style="height: 100px"/>
              <div class="detail m-auto">${vid.title}</div>
            </div>
            </button>
            </form>
            </c:forEach>
          </aside>
        </div>
      
      <footer class="row">
        <div class="card-footer bg-info ps-3 pb-3">
          <h4 class="text-uppercase fs-2 pt-3">công ty online entertainment</h4>
          <div class="row">
            <div class="col-6 text-light">
              <i class="bi bi-star-fill"></i> &nbsp; Cơ sở Hà Nội: Cổng số 1,
              Tòa nhà FPT Polytechnic, phố Trịnh Văn Bô, phường Phương Canh,
              quận Nam Từ Liêm, TP Hà Nội
              <br />
              <i class="bi bi-telephone-fill"></i> &nbsp; 024 8582 0808
              <br />
              <br />
              <i class="bi bi-star-fill"></i> &nbsp; Cơ sở Thái Nguyên: Tòa nhà
              FPT Polytechnic, đường đê Mỏ Bạch, tổ 10, phường Quyết Thắng, TP
              Thái Nguyên, tỉnh Thái Nguyên
              <br />
              <i class="bi bi-telephone-fill"></i> &nbsp; 028 6686 6486
            </div>
            <div class="col-6 text-light">
              <i class="bi bi-star-fill"></i> &nbsp; Cơ sở Hồ Chí Minh: Tòa nhà
              QTSC9 (toà T), đường Tô Ký, phường Tân Chánh Hiệp, quận 12, TP HCM
              <br />
              <i class="bi bi-telephone-fill"></i> &nbsp; 028 6686 6486
              <br />
              <br />
              <i class="bi bi-star-fill"></i> &nbsp; Cơ sở Hà Nam :Đường Lê
              Duẩn, khu Đô Thị CEO 1, phường Liêm Chính, TP Phủ Lý, tỉnh Hà Nam
              <br />
              <i class="bi bi-telephone-fill"></i> &nbsp; 0911 968 213
            </div>
          </div>
        </div>
      </footer>
    </div>
  </body>
</html>