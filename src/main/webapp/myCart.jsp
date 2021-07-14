<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DAO.CartDAO"%>
<%@page import="java.util.List"%>

<%@page import="com.DB.DBconnect"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.user"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="all_component/allCss.jsp"%>

<title>Cart</title>
</head>
<body style="background-color:#d4d1c3;">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">
			<a href="#" class="alert-link">${succMsg}</a>
			<c:remove var="succMsg" scope="session" />
		</div>
		<c:if test="${not empty failedMsg }">
			<div class="alert alert-danger" role="alert">
				<a href="#" class="alert-link">${failedMsg}</a>
				<c:remove var="failedMsg" scope="session" />
						</div>
				
		</c:if>
	</c:if>
	<div class="container">
		<c:if test="${not empty userobj }">
			<h3 class="text-center mt-3">Hello, ${userobj.name }</h3>
		</c:if>
		<div class="row">

			<div class="col-md-5">

				<table class="table table-hover mt-4 ml-2 border bg-white"
					style="height: 300px; width: 500px">
					<thead class="thead-dark">
						<tr>

							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						user us = (user) session.getAttribute("userobj");
						CartDAOImpl dao = new CartDAOImpl(DBconnect.getConn());
						List<Cart> list = dao.getBookByUser(us.getId());
						double total_price = 0.00;
						for (Cart c : list) {
							total_price = c.getTotal_price();
						%>
						<tr>
							<th scope="row"><%=c.getBook_name()%></th>
							<td><%=c.getAuthor()%></td>
							<td><%=c.getPrice()%></td>
							<td><a href="remove?bid=<%=c.getBid()%>&&uid=<%=c.getUid() %>&&cid=<%=c.getCid() %>" class="btn btn-danger ">Remove</a></td>
						</tr>

						<%
						}
						%>
						<tr style="background-color:#ffab00 ">
							<td>Total Price</td>
							<td></td>
							<td></td>
							<td><%=total_price%></td>
						</tr>



					</tbody>
				</table>

			</div>
			
			

			<div class="col-md-6 border ml-4 mt-3 bg-white">
				<form action="order" method="post">
					<h4 class="text-center">Order Details</h4>
					<c:if test="${not empty failedMsg }">
			<div class="alert alert-danger" role="alert">
				<a href="#" class="alert-link">${failedMsg}</a>
				<c:remove var="failedMsg" scope="session" />
						</div>
				
		</c:if>
					<input type="hidden" value="${userobj.id }" name="id">
					<div class="form-row mt-4">
						<div class="form-group col-md-6">
							<label for="inputEmail4">Name</label> <input type="text"
								class="form-control" id="inputEmail4" placeholder="Enter Name"
								name="username" value="${userobj.name }">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Email Address</label> <input
								type="text" class="form-control" id="inputPassword4"
								placeholder="Email Address" name="email" value="${userobj.email }">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4"></label>Mobile Number<input type="text"
								class="form-control" id="inputEmail4"
								placeholder="Mobile Number" name="phno" value="${userobj.phno }">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Address</label> <input type="text"
								class="form-control" id="inputPassword4" placeholder="Address"
								name="address">
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">Landmark</label> <input type="text"
								class="form-control" id="inputCity" placeholder="Landmark"
								name="landmark">
						</div>

						<div class="form-group col-md-6">
							<label for="inputZip">City</label> <input type="text"
								class="form-control" id="inputZip" placeholder="City" name="city">
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputCity">State</label> <input type="text"
									class="form-control" id="inputCity" placeholder="State" name="state">
							</div>

							<div class="form-group col-md-6">
								<label for="inputZip">Pin code</label> <input type="text"
									class="form-control" id="inputZip" placeholder="Pin code"
									name="pincode">
							</div>
							<div class="form-group col-md-12">
								<label class="" >Payment Mode</label> 
								<select class="form-control" name="payment">
									<option value="noselect">---select--</option>
									<option value="COD">Cash On delivery</option>

								</select>


							</div>

						</div>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-dark">Order Now</button>

						<button type="submit" class="btn btn-warning">Continue
							Shopping</button>


					</div>
				</form>
			</div>

		</div>
	</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>