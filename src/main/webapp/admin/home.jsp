<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin:home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a{
text-decoration:none;
color:black;
}

a:hover{
text-decoration:none;
color:black;
}
body{
background:#ecf7c8 ;
height:50vh;
width:100%;
background-size:cover;
background-repeat:no-repeat;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
	
	
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
			<a href="addbooks.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa fa-plus-square fa-3x text-primary" aria-hidden="true"></i><br>
						<h3>Add Books</h3>
						_____________

					</div>
				</div>
				</a>
			</div>
			
			<div class="col-md-3">
			<a href="allbooks.jsp">
				<div class="card">
					<div class="card-body text-center ">
						<i class="fas fa-book-open fa-3x text-danger"></i><br>
						<h3>All Books</h3>
						_____________

					</div>
				</div>
				</a>
			</div>
			
			
			<div class="col-md-3">
			<a href="order.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-box-open fa-3x text-warning"></i><br>
						<h3>Order</h3>
						_____________

					</div>
				</div>
				</a>
			</div>
			
			<div class="col-md-3">
			<a data-toggle="modal" data-target="#staticBackdrop">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-sign-out-alt fa-3x text-dark"></i><br>
						<h3>Logout</h3>
						_____________

					</div>
				</div>
				</a>
			</div>
			
		</div>
	</div>
	<div class="container-fluid text-center text-white p-4" style="background-color:black; margin-top:150px;">

<h5>@Copyright Design and Developed by : SNEHAL </h5>

</div>
</body>
</html>