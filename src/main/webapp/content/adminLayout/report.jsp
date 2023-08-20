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
<title>Report</title>
</head>
<body>
    
    <div class="container">
    
      <nav class="d-flex justify-content-center" id="tabs">
        <div class="nav nav-tabs" id="nav-tabs" role="tablist">
          <button
            class="nav-link active text-uppercase"
            id="nav-favorites-tab"
            data-bs-toggle="tab"
            data-bs-target="#nav-favorites"
            type="button"
            role="tab"
            aria-controls="nav-favorites"
            aria-selected="true"
          >
            favorites
          </button>
          <button
            class="nav-link text-uppercase"
            id="nav-favorite-user-tab"
            data-bs-toggle="tab"
            data-bs-target="#nav-favorite-user"
            type="button"
            role="tab"
            aria-controls="nav-favorite-user"
            aria-selected="false"
          >
            favorites users
          </button>
          <button
            class="nav-link text-uppercase"
            id="nav-share-tab"
            data-bs-toggle="tab"
            data-bs-target="#nav-share"
            type="button"
            role="tab"
            aria-controls="nav-share"
            aria-selected="false"
          >
            shared friends
          </button>
        </div>
      </nav>

      <div class="tab-content m-auto" id="nav-tabContent">
        <div
          class="tab-pane fade show active col-10 m-auto"
          id="nav-favorites"
          role="tabpanel"
          aria-labelledby="nav-favorites-tab"
          tabindex="0"
        >
          <table class="table table-bordered table-hover table-striped mt-5">
            <tr class="text-center text-uppercase">
              <th class="text-danger">video title</th>
              <th class="text-danger">favorite count</th>
              <th class="text-danger">latest date</th>
              <th class="text-danger">oldest date</th>
            </tr>
			<c:forEach var="item" items="${favlist}">
            <tr class="text-center">
              <td>${item.videoTitle}</td>
              <td>${item.favoriteCount}</td>
              <td>${item.newestDate}</td>
              <td>${item.oldestDate}</td>
            </tr>
            </c:forEach>
          </table>
        </div>
        <div
          class="tab-pane fade"
          id="nav-favorite-user"
          role="tabpanel"
          aria-labelledby="nav-favorite-user-tab"
          tabindex="0"
        >
        <form action="/SOF3011_ASM/report" method="get">
          <div class="sort mt-4">
            <div class="title text-uppercase pt-1">
              <h4>video title?</h4>
            </div>
            <div class="select">
              <select
                class="form-select mb-3"
                style="width: 900px"
                aria-label="Default select example"
                name="videoUserId"
                id="videoUserId"
              >
              <c:forEach var="item" items="${vidlist}">
                <option value="${item.videoId}" ${item.videoId == videoUserId?'selected':''} >${item.title}</option>               
                </c:forEach>
              </select>
            </div>
            <div class="rp">
              <button class="btn btn-info">Report</button>
            </div>
            
          </div>
          <table class="table table-bordered table-hover table-striped">
            <tr class="text-center text-uppercase">
              <th>Username</th>
              <th>Fullname</th>
              <th>Email</th>
              <th>Favorite date</th>
            </tr>
            
            <c:forEach var="item" items="${favUserList}">
            <tr class="text-center">
              <td>${item.username}</td>
              <td>${item.fullname}</td>
              <td>${item.email}</td>
              <td>${item.likeDate}</td>
            </tr>
            </c:forEach>
          </table>
          </form>
          <div class="move text-center fs-1 mb-3">
            <button type="button" class="btn btn-dark">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="55"
                height="16"
                fill="currentColor"
                class="bi bi-chevron-bar-left"
                viewBox="0 2 16 16"
              >
                <path
                  fill-rule="evenodd"
                  d="M11.854 3.646a.5.5 0 0 1 0 .708L8.207 8l3.647 3.646a.5.5 0 0 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 0 1 .708 0zM4.5 1a.5.5 0 0 0-.5.5v13a.5.5 0 0 0 1 0v-13a.5.5 0 0 0-.5-.5z"
                />
              </svg>
            </button>
            <button type="button" class="btn btn-dark">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="55"
                height="16"
                fill="currentColor"
                class="bi bi-chevron-double-left"
                viewBox="0 2 16 16"
              >
                <path
                  fill-rule="evenodd"
                  d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"
                />
                <path
                  fill-rule="evenodd"
                  d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"
                />
              </svg>
            </button>
            <button type="button" class="btn btn-dark">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="55"
                height="16"
                fill="currentColor"
                class="bi bi-chevron-double-right"
                viewBox="0 2 16 16"
              >
                <path
                  fill-rule="evenodd"
                  d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"
                />
                <path
                  fill-rule="evenodd"
                  d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"
                />
              </svg>
            </button>
            <button type="button" class="btn btn-dark">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="55"
                height="16"
                fill="currentColor"
                class="bi bi-chevron-bar-right"
                viewBox="0 2 16 16"
              >
                <path
                  fill-rule="evenodd"
                  d="M4.146 3.646a.5.5 0 0 0 0 .708L7.793 8l-3.647 3.646a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708 0zM11.5 1a.5.5 0 0 1 .5.5v13a.5.5 0 0 1-1 0v-13a.5.5 0 0 1 .5-.5z"
                ></path>
              </svg>
            </button>
          </div>
        </div>
        <div
          class="tab-pane fade"
          id="nav-share"
          role="tabpanel"
          aria-labelledby="nav-share-tab"
          tabindex="0"
        >
         <form action="/SOF3011_ASM/report" method="get">
          <div class="sort mt-4">
            <div class="title text-uppercase pt-1">
              <h4>video title?</h4>
            </div>
            <div class="select">
              <select
                class="form-select mb-3"
                style="width: 950px"
                aria-label="Default select example"
                name="videoShareId"
                id="videoShareId"
              >
                <c:forEach var="item" items="${vid2list}">
                <option value="${item.videoId}" ${item.videoId == videoShareId?'selected':''} >${item.title}</option>               
                </c:forEach>
              </select>
            </div>
            <div class="rp">
              <button class="btn btn-info">Submit</button>
            </div>
          </div>
          <table class="table table-bordered table-hover table-striped">
            <tr class="text-center text-uppercase">
              <th>sender name</th>
              <th>sender email</th>
              <th>receiver email</th>
              <th>sent date</th>
            </tr>
            
            <c:forEach var="item" items="${shareList}">
            <tr class="text-center">
              <td>${item.fullname }</td>
              <td>${item.fromEmail}</td>
              <td>${item.toEmail}</td>
              <td>${item.sendDate}</td>
            </tr>
            </c:forEach>
          </table>
          </form>
          <div class="move text-center fs-1 mb-3">
            <button type="button" class="btn btn-dark">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="55"
                height="16"
                fill="currentColor"
                class="bi bi-chevron-bar-left"
                viewBox="0 2 16 16"
              >
                <path
                  fill-rule="evenodd"
                  d="M11.854 3.646a.5.5 0 0 1 0 .708L8.207 8l3.647 3.646a.5.5 0 0 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 0 1 .708 0zM4.5 1a.5.5 0 0 0-.5.5v13a.5.5 0 0 0 1 0v-13a.5.5 0 0 0-.5-.5z"
                />
              </svg>
            </button>
            <button type="button" class="btn btn-dark">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="55"
                height="16"
                fill="currentColor"
                class="bi bi-chevron-double-left"
                viewBox="0 2 16 16"
              >
                <path
                  fill-rule="evenodd"
                  d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"
                />
                <path
                  fill-rule="evenodd"
                  d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"
                />
              </svg>
            </button>
            <button type="button" class="btn btn-dark">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="55"
                height="16"
                fill="currentColor"
                class="bi bi-chevron-double-right"
                viewBox="0 2 16 16"
              >
                <path
                  fill-rule="evenodd"
                  d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"
                />
                <path
                  fill-rule="evenodd"
                  d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"
                />
              </svg>
            </button>
            <button type="button" class="btn btn-dark">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="55"
                height="16"
                fill="currentColor"
                class="bi bi-chevron-bar-right"
                viewBox="0 2 16 16"
              >
                <path
                  fill-rule="evenodd"
                  d="M4.146 3.646a.5.5 0 0 0 0 .708L7.793 8l-3.647 3.646a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708 0zM11.5 1a.5.5 0 0 1 .5.5v13a.5.5 0 0 1-1 0v-13a.5.5 0 0 1 .5-.5z"
                ></path>
              </svg>
            </button>
          </div>
        </div>
      </div>
    </div>
  </body>

</html>