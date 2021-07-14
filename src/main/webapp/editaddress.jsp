<%@page import="com.entity.user"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="col-md-6 offset-md-4 mt-4 twxt-center">
		<div class="card mt-3">
			<div class="card-body">
				<h4 class="text-center">Edit Address</h4>

				<c:if test="${not empty succMsg }">
					<h5 class="text-center text-success">${succMsg }</h5>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<c:if test="${not empty failedMsg }">
					<h5 class="text-center text-danger">${failedMsg }</h5>
					<c:remove var="failedMsg" scope="session" />
				</c:if>

				
				<form action="edit_address" method="post">
					<input class="id" type="hidden" name="id"
						value="${userobj.id }">

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">Address</label> <input type="text"
								class="form-control" id="inputEmail4"
								placeholder="Enter Address" name="address" value="${userobj.address}">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Landmark</label> <input type="text"
								class="form-control" id="inputPassword4" placeholder="Landmark"
								name="landmark" value="${userobj.landmark }" >
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">City</label> <input type="text"
								class="form-control" id="inputCity" placeholder="city" name="city" value="${userobj.city }">
						</div>
						<div class="form-group col-md-4">
							<label for="inputState">State</label> <select id="inputState"
								class="form-control" name="state">
								<option selected>Choose...</option>
								<option>Andhra Pradesh</option>
								<option>Arunachal Pradesh</option>
								<option>Assam</option>
								<option>Bihar</option>
								<option>Chattisgarh</option>
								<option>Goa</option>
								<option>Gujrat</option>
								<option>Hariyana</option>
								<option>Himachal Pradesh</option>
								<option>Jammu and Kashmir</option>
								<option>Jharkhand</option>
								<option>Karnataka</option>
								<option>Kerala</option>
								<option>Madhya Pradesh (MP)</option>
								<option>Maharashtra</option>
								<option>Manipur</option>
								<option>Meghalaya</option>
								<option>Mizoram</option>
								<option>Nagaland</option>
								<option>Punjab</option>
								<option>Rajasthan</option>
								<option>Sikkim</option>
								<option>Tamil Nadu (TN)</option>
								<option>Telangana</option>
								<option>Tripura</option>
								<option>Uttar Pradesh (UP)</option>
								<option>Uttarakhand</option>
								<option>West Bengal (WB)</option>



							</select>
						</div>
						<div class="form-group col-md-2">
							<label for="inputZip">Zip</label> <input type="text"
								class="form-control" id="inputZip" placeholder="pin" name="zip">
						</div>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-dark">Add Address</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html>