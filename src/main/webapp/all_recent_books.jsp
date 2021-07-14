<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.user" %>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@include file="all_component/allCss.jsp"%>
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

#toast.display {
  visibility: visible; /* Show the snackbar */
  /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
  However, delay the fade out process for 2.5 seconds */
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
</style>

<title>All Recent Books</title>
</head>
<body>
<%
	user u = (user) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			
			<%
				BookDAOImpl dao1 = new BookDAOImpl(DBconnect.getConn());
				List<BookDtls> list1 = dao1.getAllRecentBooks();
				for (BookDtls b : list1) {
				%>
				<div class="col-md-3 mt-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoName()%>"
								style="width: 150px; height: 200px;" class="img-thumbnil">
							<p><%=b.getBookName()%></p>
							<p><%=b.getAuthor()%></p>
							<p>
								<%
								if (b.getBookCategory().equals("Old")) {
								%>

								Category:<%=b.getBookCategory()%></p>
							<div class="row mt-2">

								<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-secondary  btn-sm ml-1">View
									details</a> <a href="" class="btn btn-dark  btn-sm ml-1 mt-1"><i
									class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>

							</div>

							<%
							} else {
							%>
							Category:<%=b.getBookCategory()%></p>
							<div class="row">
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-warning  btn-sm ml-1">Add Cart</a> <a href="view_books.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-secondary  btn-sm ml-1">View</a> <a
									href="" class="btn btn-dark  btn-sm ml-1 mt-1"><i
									class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>

							</div>

							<%
							}
							%>


						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>

		</div>
		<%@include file="all_component/footer.jsp" %>

</body>
</html>