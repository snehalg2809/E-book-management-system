<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.user"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>View Books</title>
<%@include file="all_component/allCss.jsp"%>


</head>
<body style="background-color:#f0f1f2;">
<%
	user u = (user) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao= new BookDAOImpl(DBconnect.getConn());
	BookDtls b=dao.getBookById(bid);
	
	%>
	
	<div class="container p-3">
	<div class="row p-5">
	<div class="col-md-6 text-center p-5 border bg-white">
	<img alt="" src="book/<%=b.getPhotoName() %>" style="height:200px; width:100px;"><br>
	<h6 class="mt-5">Book Name:<%=b.getBookName() %> </h6>
	<h6>Author Name: <%=b.getAuthor() %></h6>
	<h6>Category: <%=b.getBookCategory() %></h6>
	</div>
	
	<!-- second div -->
	<div class="col-md-6 text-center p-5 border bg-white">
	<h4><%=b.getBookName() %></h4>
	
	
	<%
	if("Old".equals(b.getBookCategory()))
	{%>
	<h5 class="mt-3">Contact Seller</h5>
		Email-id:<%=b.getEmail() %>
		
	
	<%}
	
	%>
	
	
	
	
	<div class="row mt-5">
	<div class="col-md-4 text-danger text-center p-2">
	<i class="fas fa-money-bill-wave fa-2x"></i>
	<p>Cash Delivery</p>
	</div>
	<div class="col-md-4 text-danger text-center p-2">
	<i class="fas fa-undo-alt fa-2x"></i>
	<p>Fast Return</p>
	</div>
	<div class="col-md-4 text-danger text-center p-2">
	<i class="fas fa-truck fa-2x"></i>
	<p>Free Shipping</p>
	</div>
	</div>
	
	<%
	if("Old".equals(b.getBookCategory()))
	{ %>
		<div class="text-center p-3">
		<a href="index.jsp" class="btn btn-info">Continue Shopping</a>
		<a href="" class="btn btn-dark"><%=b.getPrice() %></a>
		</div>
	<%}else{ 
	%>
	<div class="text-center p-2">
	<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-warning">Add to cart</a>
		<a href="" class="btn btn-dark ml-2"><i class="fas fa-rupee-sign"></i><%=b.getPrice() %></a>
	
	<%}
	%>
	
	</div>
	</div>
	</div>
	</div>

</body>
</html>