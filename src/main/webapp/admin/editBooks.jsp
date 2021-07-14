<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add-books</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
.container {
	background:;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container mt-0 mb-0">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-2 mt-2">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>

						
						<%
			
						int id = Integer.parseInt(request.getParameter("id"));
						
						BookDAOImpl dao = new BookDAOImpl(DBconnect.getConn());

						BookDtls b = dao.getBookById(id);
			
						%>

						<form action="../editbooks" method="post">
						<input class="id" type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group mt-2">
								<label for="exampleInputEmail1"> Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="border-radius: 10px"
									required name="bName" value="<%=b.getBookName()%>">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="border-radius: 10px"
									required name="author" value="<%=b.getAuthor()%>">

							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="price" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="border-radius: 10px"
									required name="price" value="<%=b.getPrice()%>">
							</div>
														<div class="form-group">
								<label for="inputState">Book Status</label><br> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>

									<option value="Inactive">Inactive</option>

									<%
									
									} else 
									{
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>

									<%
									}
									%>


								</select>
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
	<%@include file="footer.jsp"%>
</body>
</html>