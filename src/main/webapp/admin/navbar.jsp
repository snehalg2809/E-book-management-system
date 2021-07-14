<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.user.servlet.LoginServlet"%>
<div class="container-fluid"
	style="height: 10px; background-color: #00acc1"></div>
<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3">
			<h3>Ebooks</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-primary my-2 my-sm-0 rounded-circle"
					type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>

		</div>
		<div class="col=md-3">
			<c:if test="${not empty userobj }">
			
				<a href="../login.jsp"
					class="btn btn-danger text-white text-center"><i
					class="fas fa-user-edit"> ${ userobj.name}</i></a>
				<a data-toggle="modal" data-target="#staticBackdrop" href="../logout"
					class="btn btn-primary text-white text-center"><i
					class="fas fa-sign-in-alt"> Logout</i></a>

			</c:if>
			<c:if test="${empty userobj }">
				<a href="../register.jsp"
					class="btn btn-danger text-white rounded-circle text-center"><i
					class="fas fa-user-edit"></i></a>
				<a href="../login.jsp" class="btn btn-success rounded-circle"><i
					class="fas fa-user-circle"></i></a>

			</c:if>

		</div>
	</div>
</div>

<!-- logout-->

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="">
        <h5 class="modal-title" id="staticBackdropLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="text-center">
        <h4>Do you want to logout ?</h4>
        <br>
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../logoutServlet" type="button" class="btn btn-primary">Logout</a>
        
        </div>
      </div>
         
    </div>
  </div>
</div>




<!-- end logout -->
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
				href="home.jsp"><i class="fas fa-home"></i>Home <span
					class="sr-only">(current)</span></a></li>

		</ul>

	</div>
</nav>