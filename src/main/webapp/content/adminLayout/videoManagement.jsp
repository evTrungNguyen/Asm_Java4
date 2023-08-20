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
</style>
<title>Video Management</title>
</head>
<body>

    <div class="container">
    <jsp:include page="/content/alert.jsp"></jsp:include>
      <nav class="d-flex justify-content-center">
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
          <button
            class="nav-link active text-uppercase"
            id="nav-video-edition-tab"
            data-bs-toggle="tab"
            data-bs-target="#nav-video-edition"
            type="button"
            role="tab"
            aria-controls="nav-video-edition"
            aria-selected="true"
          >
            video edition
          </button>
          <button
            class="nav-link text-uppercase"
            id="nav-video-list-tab"
            data-bs-toggle="tab"
            data-bs-target="#nav-video-list"
            type="button"
            role="tab"
            aria-controls="nav-video-list"
            aria-selected="false"
          >
            video list
          </button>
        </div>
      </nav>
      
      
      
      <div class="tab-content m-auto" id="nav-tabContent">
        <div
          class="tab-pane fade show active col-10 m-auto"
          id="nav-video-edition"
          role="tabpanel"
          aria-labelledby="nav-video-edition-tab"
          tabindex="0"
        >
        <form action="/SOF3011_ASM/videoManagement" method="post" enctype="multipart/form-data">
          <div class="card">
            <div class="card-body">
              <div class="content row">
                <div class="video col-5">
                <c:if test="${video.poster!=null}">
                  <img alt="" src="images/${video.poster}" width="350px" height="270px">
                
                </c:if>
                <c:if test="${video.poster==null}">
                  <img alt="" src="../images/medora.jpg" width="350px" height="270px">
                
                </c:if>
                  <div class="input-group mt-3">
                  	<div class="custom-file">
                  		<input type="file" class="custom-file-input" id="cover" name="cover">
                  		
                  	</div>
                  </div>
                </div>
                <aside class="col-7">
                  <div class="item ms-5">
                    <label for="">YOUTUBE ID?</label><br />
                    <input type="text" name="videoId" class="w-100" value="${video.videoId}"/>
                  </div>
                  <div class="item ms-5">
                    <label for="">VIDEO TITLE?</label>
                    <input type="text" name="title" class="w-100" value="${video.title}" />
                  </div>
                  <div class="item ms-5">
                    <label for="">VIEW COUNT?</label>
                    <input type="text" name="views" class="w-100" value="${video.views}"/>
                  </div>
                  <div class="item ms-5">
                  
                    <input name="active" type="radio" value="true" ${video.active ? 'checked':''} />                  
                  
                    Active
				
                    <input name="active" type="radio" value="false" ${!video.active ? 'checked':''} /> Inactive
                    
                  </div>
                </aside>
              </div>
              <hr />
              <div class="description row">
                <label for="">DESCRIPTION?</label>
                <textarea name="description" id="" rows="5">${video.description}</textarea>
              </div>
            </div>
            <div class="card-footer ms-auto bg-white">
              <button class="btn bg-secondary text-white fw-bold" formaction="/SOF3011_ASM/createVideo">
                Create
              </button>
              <button class="btn bg-secondary text-white fw-bold" formaction="/SOF3011_ASM/updateVideo">
                Update
              </button>
              <button class="btn bg-secondary text-white fw-bold" formaction="/SOF3011_ASM/deleteVideo">
                Delete
              </button>
              <button class="btn bg-secondary text-white fw-bold" formaction="/SOF3011_ASM/resetVidManage">Reset</button>
            </div>
          </div>
          
          </form>
        </div>
        <div
          class="tab-pane fade"
          id="nav-video-list"
          role="tabpanel"
          aria-labelledby="nav-video-list-tab"
          tabindex="0"
        >
          <table class="table table-bordered table-hover table-striped">
            <tr class="text-center">
              <th>YouTube Id</th>
              <th>Video Title</th>
              <th>View Count</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          <c:forEach var="v" items="${v}">
            <tr class="text-center">
              <td>${v.videoId}</td>
              <td>${v.title}</td>
              <td>${v.views}</td>
              <td>${v.active==true?'Active':'Deactive'}</td>
              <td>
                <a class="btn btn-info btn-sm" href="/SOF3011_ASM/editVideo?idVideo=${v.videoId}"  style="width: 70px">
                  Edit
                </a>
              </td>
            </tr>
           </c:forEach>
          </table>
          <%-- <div class="move text-center fs-1 mb-3">
          c:forEach begin="1" end="${end}" var="i">
						<a class="btn btn-dark" href="/SOF3011_ASM/totalVideo?location=${i}">${i}</a>
						</c:forEach> 
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
          </div> --%>
        </div>
      </div>
    </div>
  </body>
</html>