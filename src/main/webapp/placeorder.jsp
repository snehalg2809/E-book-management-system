<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Placed</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
<div class="container text-center p-4 mt-4">
<i class="fas fa-check-circle text-success fa-3x"></i>
<h2>Thank You</h2>
<h4>Your Order Placed Successfully !</h4>
<h5>Within 7 Days order will be delivered</h5>
<a href="index.jsp" class="btn btn-primary">HOME</a>
<a href="" class="btn btn-danger">View Order</a>
</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>