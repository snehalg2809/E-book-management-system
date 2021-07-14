<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Register Page</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
body {
	background: url("img/b3.jpg");
	background-repreat: no-repeat;
	background-size: cover;
	height: 100vh;
}

.card {
	border-radius: 25px;
	opacity: 0.9;
	margin-top: 200px;
}
}
</style>
</head>
<body style="background-color: #f0f1f2">
	<section class="sec">
		<div class="container-fluid"
			style="height: 10px; background-color: #00acc1"></div>
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
					<button class="btn btn-light my-2 my-sm-0 " type="submit">
						<i class="fas fa-cog"></i> Setting
					</button>
					<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
						<i class="fas fa-phone-alt"></i> Contact us
					</button>
				</form>
			</div>

		</nav>

		<div class="container p-5">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center">Registration Page</h4>

							<c:if test="${not empty succMsg }">
								<p class="text-center text-success">${succMsg}</p>
								<c:remove var="succMsg" scope="session" />

							</c:if>

							<c:if test="${not empty failedMsg }">
								<p class="text-center text-danger">${failedMsg}</p>
								<c:remove var="failedMsg" scope="session" />
							</c:if>




							<form action="register" method="post">

								<div class="form-group mt-2">
									<label for="exampleInputEmail1"> Full Name</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" style="border-radius: 10px"
										required name="fname">

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" style="border-radius: 10px"
										required name="email">

								</div>


								<div class="form-group">
									<label for="exampleInputEmail1">Phone Number</label> <input
										type="tel" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" style="border-radius: 10px"
										required name="phno">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" style="border-radius: 10px"
										required name="password">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" style="border-radius: 10px"
										required name="cpassword">
								</div>

								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="check"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Agree Terms & Conditions</label>
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-dark mt-2"
										style="border-radius: 10px">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="all_component/footer.jsp"%>
	</section>
</body>
</html>