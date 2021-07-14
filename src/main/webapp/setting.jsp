<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

		<c:if test="${not empty userobj }">
	<h3 class="text-center p-3">Hello ${userobj.name}</h3>
	</c:if>
	<div class="container p-2">
		<div class="row p-5 ml-2 text-center">
			<div class="col-md-5 text-center ">
				<a href="sellOldbook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-book-open text-info fa-3x"></i><br>
							<h3 class="text-dark">Sell Books</h3>

						</div>
					</div>
				</a>
			</div>
			<div class="col-md-7 text-center ">

				<a href="Editprofile.jsp">
					<div class="card">
						<div class="card-body text-center">

							<i class="fas fa-id-card fa-3x text-primary"></i>
							<h3 class="text-dark">Login & Security(Edit profile)</h3>

						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 text-center mt-3">

				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">

							<i class="fas fa-map-marker-alt fa-3x text-warning"></i>
							<h3>All Books</h3>
							<h6>Your Books</h6>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 text-center mt-3">

				<a href="myorders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-3x text-danger"></i>
							<h3>My Orders</h3>
							<h6>Track Your Orders</h6>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 text-center mt-3">

				<a href="helpcenter.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-phone-square-alt fa-3x text-success"></i>
							<h3>Help Center</h3>
							<h6>24*7 Service</h6>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>