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
	body {
        background: #007bff;
        background: linear-gradient(to right, #0062e6, #33aeff);
      }

      .card-img-left {
        width: 45%;
        /* Link to your background image using in the property below! */
        background: scroll center
          url("https://source.unsplash.com/WEQbe2jBg40/414x512");
        background-size: cover;
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
<title>Registration</title>
</head>
<body>
    <div class="container">
      <div class="row">
        <div class="col-lg-10 col-xl-9 mx-auto">
          <div
            class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden"
          >
            <div class="card-img-left d-none d-md-flex">
              <!-- Background image for card set in CSS! -->
            </div>
            <div class="card-body p-4 p-sm-5">
              <h5 class="card-title text-center mb-5 fw-light fs-5">
                Register
              </h5>
              
              <jsp:include page="/content/alert.jsp"></jsp:include>
              <form action="/SOF3011_ASM/Registration" method="post">
              
              <div class="form-floating mb-3">
                  <input
                  value="${user.username}"
                    type="text"
                    name="username"
                    class="form-control"
                    id="floatingInputUsername"
                    placeholder="myusername"
                    required
                    autofocus
                  />
                  <label for="floatingInputUsername">Username</label>
                </div>
              
              
              <div class="form-floating mb-3">
                  <input
                  name="password"
                    type="password"
                    value="${user.password}"
                    class="form-control"
                    id="floatingPassword"
                    placeholder="Password"
                    required
                  />
                  <label for="floatingPassword">Password</label>
                </div>

                <hr />

				<div class="form-floating mb-3">
                  <input
                  name="fullname"
                    type="text"
                    class="form-control"
                    value="${user.fullname}"
                    id="fullname"
                    placeholder="fullname"
                    required
                  />
                  <label for="fullname">Fullname</label>
                </div>	

                <div class="form-floating mb-3">
                  <input
                    type="email"
                    name="email"
                    value="${user.email}"
                    class="form-control"
                    id="floatingInputEmail"
                    placeholder="name@example.com"
                    required
                  />
                  <label for="floatingInputEmail">Email address</label>
                </div>

                

                <div class="d-grid mb-2">
                  <button
                    class="btn btn-lg btn-primary btn-login fw-bold text-uppercase"
                    type="submit" 
                  >
                    Register
                  </button>
                </div>

                <a class="d-block text-center mt-2 small" href="#"
                  >Have an account? Sign In</a
                >

                <hr class="my-4" />

                <div class="d-grid mb-2">
                  <button
                    class="btn btn-lg btn-google btn-login fw-bold text-uppercase"
                    type="submit"
                  >
                    <i class="fab fa-google me-2"></i> Sign up with Google
                  </button>
                </div>

                <div class="d-grid">
                  <button
                    class="btn btn-lg btn-facebook btn-login fw-bold text-uppercase"
                    type="submit"
                  >
                    <i class="fab fa-facebook-f me-2"></i> Sign up with Facebook
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>