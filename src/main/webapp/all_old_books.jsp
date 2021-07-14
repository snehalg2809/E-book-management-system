<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.user" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.crd-ho:hover {
	background-color: #e0f2f1;
}
body{
background:#d4d1c3;
}
#toast {
  visibility: hidden; /* Hidden by default. Visible on click */
  min-width: 250px; /* Set a default minimum width */
  margin-left: -125px; /* Divide value of min-width by 2 */
  background-color: #333; /* Black background color */
  color: #fff; /* White text color */
  text-align: center; /* Centered text */
  border-radius: 2px; /* Rounded borders */
  padding: 16px; /* Padding */
  position: fixed; /* Sit on top of the screen */
  z-index: 1; /* Add a z-index if needed */
  left: 50%; /* Center the snackbar */
  bottom: 30px; /* 30px from the bottom */
  box-shadow:0px 0px 100px #000;
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */



</style>

<title>All Old Books</title>
</head>
<body>
<%
	user u = (user) session.getAttribute("userobj");
	%>



<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid">
<div class="row p-3">
<%
				BookDAOImpl dao2 = new BookDAOImpl(DBconnect.getConn());
				List<BookDtls> list2 = dao2.getAllOldBooks();
				for (BookDtls b : list2) {
				%>
				<div class="col-md-3">
					<div class="card crd-ho mt-2">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoName()%>"
								style="width: 150px; height: 200px;" class="img-thumbnil">
							<p><%=b.getBookName()%></p>
							<p><%=b.getAuthor()%></p>
							<p>Category:<%=b.getBookCategory()%></p>
							<div class="row mt-2">
								<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-secondary  btn-sm ml-1">View
									details</a> 
									<a href="" class="btn btn-dark  btn-sm ml-1 mt-1"><i
									class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>

							</div>
						</div>
					</div>
				</div>


				<%
				}
				%>

</div>

</div>
</body>
</html>