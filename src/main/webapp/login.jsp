<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<%@include file="all_component/allCss.jsp"%>
<style>
body {
	background: url("img/b3.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

.card {
	border-radius: 25px;
	opacity: 0.9;
	margin-top: 100px;
}

section.dark .card a{
 color:#fff;
}

</style>
</head>
<body>

	<!-- navbar -->


	<section class="sec">
		<div class="container-fluid p-1 bg-light">
			<div class="row">
				<div class="col-md-3">
					<h3>Ebooks</h3>
				</div>
				<div class="col-md-6">
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="search"
							placeholder=" Search" aria-label="Search"
							style="border-radius: 20px">
						<button
							class="btn btn-outline-primary my-2 my-sm-0 rounded-circle"
							type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>

				</div>
				<div class="col-md-3">
					<a href="login.jsp" class="btn btn-success rounded-square"><i
						class="fas fa-user"></i> Login</a> <a href="register.jsp"
						class="btn btn-primary text-white rounded-square"><i
						class="fas fa-user-edit"></i> Register</a>
					<div class="toggle"></div>
				</div>
			</div>
		</div>

		<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link active"
						href="index.jsp"><i class="fas fa-home"></i>Home <span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item active"><a class="nav-link text-black"
						href="#">Recent Book</a></li>
					<li class="nav-item active"><a class="nav-link " href="#">New
							Book</a></li>

					<li class="nav-item active"><a class="nav-link " href="#"
						tabindex="-1" aria-disabled="true">Old Book</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<a href="Editprofile.jsp" class="btn btn-light my-2 my-sm-0 " type="submit">
						<i class="fas fa-cog"></i> Setting
					</a>
					<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
						<i class="fas fa-phone-alt"></i> Contact us
					</button>
				</form>
			</div>
			<script type="text/javascript">
				const sec = document.querySelector('.sec');
				const toggle = document.querySelector('.toggle');

				toggle.onclick = function() {
					sec.classList.toggle('dark');
				}
			</script>
		</nav>

		<!-- content -->





		<div class="container p-5 mb-5 mt-5 align-center">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h3 class="text-center mt-5">Login Page</h3>


							<c:if test="${not empty failedMsg}">
								<h5 class="text-center text-danger">${failedMsg}</h5>
								<c:remove var="failedMsg" scope="session" />
							</c:if>
							
							<c:if test="${not empty succMsg}">
								<h5 class="text-center text-success">${succMsg}</h5>
								<c:remove var="failedMsg" scope="session" />
							</c:if>


							<form action="login" method="post">

								<div class="form-group">
									<label for="exampleInputPassword1">Login type</label> <select
										class="form-control" style="border-radius: 10px"
										id="exampleInputPassword1" required name="type">
										<option selected>---select---</option>
										<option name="admin">Admin</option>
										<option name="user">User</option>
									</select>
								</div>
								<div class="form-group mt-4">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" style="border-radius: 10px"
										id="exampleInputEmail1" aria-describedby="emailHelp" required
										name="email">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										style="border-radius: 10px" id="exampleInputPassword1"
										required name="password">
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-dark mt-2"
										style="border-radius: 10px">Login</button>
									<br> <a href="register.jsp" style="color: black">Create
										account</a> <br> <a href="forgetPassword.jsp"
										style="color: black; margin-top: 2px">Forget Password</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<%@include file="all_component/footer.jsp"%>
		</div>
	</section>
</body>
</html>