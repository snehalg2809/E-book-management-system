<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Old Book</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container mt-0 mb-0">
		<div class="back-img">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card mt-3">
						<div class="card-body">
							<h4 class="text-center">Sell Book</h4>
							<c:if test="${not empty succMsg }">
								<h5 class="text-center text-success">${succMsg }</h5>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<c:if test="${not empty failedMsg }">
								<h5 class="text-center text-danger">${failedMsg }</h5>
								<c:remove var="failedMsg" scope="session" />
							</c:if>
							<form action="addBookServlet" method="post" enctype="multipart/form-data">
							<input type="hidden" value="${userobj.email}" name="useremail">
								<div class="form-group">
									<label for="exampleInputEmail1">Book Name</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="bName">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Author</label> <input
										type="text" class="form-control" id="exampleInputPassword1" name="author">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Price</label> <input
										type="price" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="price">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Upload Photo</label> <input
										type="file" class="form-control-file" id="exampleInputEmail1"
										required name="bimg" name="bimg">
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary">Add</button>

								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>

</body>
</html>