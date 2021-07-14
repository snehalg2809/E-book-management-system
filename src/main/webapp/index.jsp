<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/Resources_library_books.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}

.crd-ho:hover {
	background-color: #e0f2f1;
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
	box-shadow: 0px 0px 100px #000;
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#toast.display {
	visibility: visible; /* Show the snackbar */
	/* Add animation: Take 0.5 seconds to fade in and out the snackbar.
  However, delay the fade out process for 2.5 seconds */
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@
keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #d4d1c3">
	
	<!-- navbar -->

	<%@include file="all_component/navbar.jsp"%>

	<!-- content -->
	

	<div class="container-fluid back-img">
		<h2 class="text-center p-5 text-white">Ebook Management System</h2>

	</div>
	<%
	user u = (user) session.getAttribute("userobj");
	%>


	<!-- Start Recent Books -->
	<div class="container mt-2">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao1 = new BookDAOImpl(DBconnect.getConn());
			List<BookDtls> list1 = dao1.getRecentBook();
			for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
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

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-secondary  btn-sm ml-1">View details</a> <a
								href="" class="btn btn-dark  btn-sm ml-1 mt-1"><i
								class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>

						</div>

						<%
						} else {
						%>
						Category:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href=""
								class="btn btn-warning  btn-sm ml-1">Add Cart</a> <a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-secondary  btn-sm ml-1">View</a><a href=""
								class="btn btn-dark  btn-sm mt-1 ml-1"><i
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
		<div class="text-center">
			<a href="all_recent_books.jsp" class="btn btn-danger btn-sm mt-2">
				View all</a>

		</div>
	</div>


	<!-- End Recent Books -->
	<hr>

	<!-- Start New Books -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBconnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">

				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
						<div class="row">

							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-warning  btn-sm ml-1">Add Cart</a> <a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-secondary  btn-sm ml-1">View</a> <a href=""
								class="btn btn-dark  btn-sm ml-1 mt-1"><i
								class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>

			</div>


			<%
			}
			%>






		</div>
		<div class="text-center">
			<a href="all_new_books.jsp" class="btn btn-danger btn-sm mt-2">
				View all</a>

		</div>
	</div>


	<!-- End New Books -->
	<hr>

	<!-- Start Old Books -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBconnect.getConn());
			List<BookDtls> list2 = dao2.getOldBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
						<div class="row mt-2">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-secondary  btn-sm ml-1">View</a> <a href=""
								class="btn btn-dark  btn-sm ml-1 mt-1"><i
								class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>

						</div>
					</div>
				</div>
			</div>


			<%
			}
			%>

		</div>
		<div class="text-center">
			<a href="all_old_books.jsp" class="btn btn-danger btn-sm mt-2">
				View all</a>

		</div>
	</div>


	<!-- End Old Books -->
	<%@include file="all_component/footer.jsp"%>
	</section>
</body>
</html>