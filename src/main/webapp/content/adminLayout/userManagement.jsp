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
</style>
<title>User Management</title>
</head>
<body>
    
    <div class="container">
      <nav class="d-flex justify-content-center">
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
          <button
            class="nav-link active text-uppercase"
            id="nav-user-edition-tab"
            data-bs-toggle="tab"
            data-bs-target="#nav-user-edition"
            type="button"
            role="tab"
            aria-controls="nav-user-edition"
            aria-selected="true"
          >
            user edition
          </button>
          <button
            class="nav-link text-uppercase"
            id="nav-user-list-tab"
            data-bs-toggle="tab"
            data-bs-target="#nav-user-list"
            type="button"
            role="tab"
            aria-controls="nav-user-list"
            aria-selected="false"
          >
            user list
          </button>
        </div>
      </nav>
      <div class="tab-content m-auto" id="nav-tabContent">
        <div
          class="tab-pane fade show active col-10 m-auto"
          id="nav-user-edition"
          role="tabpanel"
          aria-labelledby="nav-user-edition-tab"
          tabindex="0"
        >
          <form action="/SOF3011_ASM/userManagement" method="post"
            class="row m-auto border border-4 border-info col-md-7 col-xl-7 shadow rounded mt-5"
          >
            <div
              class="bg-warning text-white text-uppercase text-center px-3 py-3"
            >
              <h4>Edit profile</h4>
            </div>
            <jsp:include page="/content/alert.jsp"></jsp:include>
            <div class="form-group col-6 p-3">
              <label>username?</label><br />
              <input class="w-100" name="username" value="${user.username}" />
            </div>
            <div class="form-group col-6 p-3">
              <label>password?</label><br />
              <input class="w-100" name="password" type="password" value="${user.password}" />
            </div>
            <div class="form-group col-6 p-3">
              <label>fullname?</label><br />
              <input class="w-100" name="fullname" type="text" value="${user.fullname}"/>
            </div>
            <div class="form-group col-6 p-3">
              <label>email address?</label><br />
              <input class="w-100" name="email" type="email" value="${user.email}"/>
            </div>
			
            <hr />
            <div class="d-flex justify-content-around">
              <button class="btn btn-info mb-3 px-4" formaction="/SOF3011_ASM/updateUser">Update</button>
              <button class="btn btn-danger mb-3 px-3" formaction="/SOF3011_ASM/deleteUser">Delete</button>
            </div>
          </form>
        </div>
        <div
          class="tab-pane fade"
          id="nav-user-list"
          role="tabpanel"
          aria-labelledby="nav-user-list-tab"
          tabindex="0"
        >
          <table class="table table-bordered table-hover table-striped">
            <tr class="text-center">
              <th>Username</th>
              <th>Password</th>
              <th>Fullname</th>
              <th>Email</th>
              <th>Role</th>
              <th>Action</th>
            </tr>
            
            <c:forEach var="item" items="${list}">
            
            <tr class="text-center">
              <td>${item.username}</td>
              <td>${item.password }</td>
              <td>${item.fullname }</td>
              <td>${item.email}</td>
              <td>${item.admin == true?'Admin':'User'}</td>
              <td>
                <a href="/SOF3011_ASM/userManagement/editUser?username=${item.username}" class="btn btn-info btn-sm" style="width: 70px">
                  Edit
                </a>
              </td>
            </tr>
            </c:forEach>
          </table>
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