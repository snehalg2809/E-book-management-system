<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<section class="sec">
	<div class="container-fluid"
		style="height: 10px; background-color: #00acc1"></div>
	<div class="container-fluid p-1 bg-light">
		<div class="row">
			<div class="col-md-3">
				<h3>Ebooks</h3>
			</div>
			<div class="col-md-6">
					<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
						<input class="form-control mr-sm-2" type="search" name="ch"
							placeholder=" Search" aria-label="Search"
							style="border-radius: 20px">
						<button
							class="btn btn-outline-primary my-2 my-sm-0 rounded-circle"
							type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>

				</div>
				<c:if test="${not empty userobj }">
					<div class="col-md-3">
						<a href="myCart.jsp" class="text-dark" style="position:relative; top:0.5em; padding:1.5px;"><i
							class="fas fa-shopping-cart fa-2x"></i></a> <a href="login.jsp"
							class="btn btn-success rounded-square"><i class="fas fa-user"></i>
							${userobj.name}</a> <a href="logoutServlet"
							class="btn btn-primary text-white rounded-square"><i
							class="fas fa-user-"></i> Logout</a>
					</div>
				</c:if>
				<c:if test="${empty userobj }">
					<div class="col-md-3">

						<a href="login.jsp" class="btn btn-success rounded-square"><i
							class="fas fa-user"></i> Login</a> <a href="register.jsp"
							class="btn btn-primary text-white rounded-square"><i
							class="fas fa-user-edit"></i> Register</a>

					</div>
				</c:if>
			</div>
		</div>

		<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link active"
						href="index.jsp"><i class="fas fa-home"></i>Home <span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item active"><a class="nav-link text-black"
						href="all_recent_books.jsp">Recent Book</a></li>
					<li class="nav-item active"><a class="nav-link "
						href="all_new_books.jsp">New Book</a></li>

					<li class="nav-item active"><a class="nav-link "
						href="all_old_books.jsp" tabindex="-1" aria-disabled="true">Old
							Book</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<a href="setting.jsp" class="btn btn-light my-2 my-sm-0 "
						type="submit"> <i class="fas fa-cog"></i> Setting
					</a>
					<a href="helpcenter.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
						<i class="fas fa-phone-alt"></i> Contact us
					</a>
				</form>
			</div>
	
	</nav>
</section>