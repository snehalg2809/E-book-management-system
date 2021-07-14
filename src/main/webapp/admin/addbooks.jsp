<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add-books</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
body {
	background: url("../img/b.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	height: 126vh;
	width: 100%;
}

.card {
	border-radius: 25px;
	opacity: 0.8;
	margin-top: 100px;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container mt-0 mb-0">
		<div class="back-img">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card mt-2 mt-2">
						<div class="card-body">
							<h4 class="text-center">Add Book</h4>

							<c:if test="${not empty succMsg }">
								<h5 class="text-center text-success">${succMsg }</h5>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<c:if test="${not empty failedMsg }">
								<h5 class="text-center text-danger">${failedMsg }</h5>
								<c:remove var="failedMsg" scope="session" />
							</c:if>


							<form action="../add_books" method="post"
								enctype="multipart/form-data">

								<div class="form-group mt-2">
									<label for="exampleInputEmail1"> Book Name*</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" style="border-radius: 10px"
										required name="bName">

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Author Name*</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" style="border-radius: 10px"
										required name="author">

								</div>


								<div class="form-group">
									<label for="exampleInputEmail1">Price*</label> <input
										type="price" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" style="border-radius: 10px"
										required name="price">
								</div>
								<div class="form-group">
									<label for="inputState">Book Categories</label><br> <select
										id="inputState" name="categories" class="form-control">
										<option selected>---Select---</option>
										<option value="New">New Book</option>
										<option value="Old">Old Book</option>


									</select>
								</div>
								<div class="form-group">
									<label for="inputState">Book Status</label><br> <select
										id="inputState" name="status" class="form-control">
										<option selected>---select---</option>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>

									</select>
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Upload Photo</label> <input
										type="file" class="form-control-file" id="exampleInputEmail1"
										required name="bimg">
								</div>

								<div class="text-center">

									<button type="submit" class="btn btn-dark mt-2"
										style="border-radius: 10px">Add</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>