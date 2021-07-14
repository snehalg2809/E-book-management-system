<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.entity.user" %>
	<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Profile</h4>
					<c:if test="${not empty succMsg }">
								<h5 class="text-center text-success">${succMsg }</h5>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<c:if test="${not empty failedMsg }">
								<h5 class="text-center text-danger">${failedMsg }</h5>
								<c:remove var="failedMsg" scope="session" />
							</c:if>
						<form action="editprofileServlet" method="post">
						<input class="id" type="hidden" name="id" value="${userobj.id }">

							<div class="form-group mt-2">
								<label for="exampleInputEmail1">Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="border-radius: 10px"
									required name="name" value="${userobj.name }">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="border-radius: 10px"
									required name="email" value="${userobj.email }">

							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="tel" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="border-radius: 10px"
									required name="phno" value="${userobj.phno }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									style="border-radius: 10px" required name="password" value=>
							</div>
							
							
							<div class="text-center">
								<button type="submit" class="btn btn-dark mt-2"
									style="border-radius: 10px">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@include file="all_component/footer.jsp"%>
	
</body>
</html>