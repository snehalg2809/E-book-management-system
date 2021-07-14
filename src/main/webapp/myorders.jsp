<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Orders</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body class="">
	<%@include file="all_component/navbar.jsp"%>
<div class="container">
<table class="table mt-5 p-3">
		<thead class="thead-dark">

			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment</th>

			</tr>
		</thead>
		<tbody>
			<%
			user u = (user) session.getAttribute("userobj");
			BookOrderImpl dao = new BookOrderImpl(DBconnect.getConn());
			List<Book_Order> blist = dao.getBook(u.getEmail());
			for (Book_Order b : blist) {
			%>
			<tr>
				<th scope="row"><%=b.getOrder_id()%></th>
				<td><%=b.getUsername()%></td>
				<td><%=b.getBook_name()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPayment() %></td>


			</tr>

			<%
			}
			%>


		</tbody>
	</table>

	
	</div>
</body>
</html>