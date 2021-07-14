<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Orders</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	
	<div class="container">
	<c:if test="${not empty succMsg }">
	<div class="alert alert-success text-center">${succMsg }</div>
	
	</c:if>
	<c:if test="${not empty failedMsg }">
	<div class="alert alert-success text-center">${failedMsg }</div>
	
	</c:if>
		<table class="table table-hover mt-4">
			<thead class="thead-dark mt-4">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>
			<%
			
			user u = (user) session.getAttribute("userobj");
			String email = u.getEmail();
			BookDAOImpl dao = new BookDAOImpl(DBconnect.getConn());
			List<BookDtls> list = dao.getBookByOld(email, "Old");
			for (BookDtls b : list) {
			
			%>
			
			<tr>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getBookCategory() %></td>
				<td><a href="deleteBook?em=<%=email %>&&id=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
			
			<% 
			
			}
				
%>
			</tbody>
		</table>

	</div>
</body>
</html>