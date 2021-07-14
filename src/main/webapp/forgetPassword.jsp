<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forget Password</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Reset Password</h4>
						<div class="whyforgetpassword">
							<%
							String msg = request.getParameter("msg");
							if ("done".equals(msg)) {
							%>
							<h6 class="text-success text-center">Password Changed
								successfully!</h6>
								
							<%
							session.removeAttribute("done");
							}
							
							%>
							<%
							if ("invalid".equals(msg)) {
							%>
							<h4 class="text-danger">Something went wrong</h4>
							<%
							session.removeAttribute("invalid");

							}
							%>

						</div>


						<form action="forgetPass.jsp" method="post">


							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="border-radius: 10px"
									required name="email">

							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="tel" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="border-radius: 10px"
									required name="phno">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Security Question</label> <select
									type="tel" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="border-radius: 10px"
									required name="sec">
									<option>--select--</option>

									<option>What is Your pet name?</option>
									<option>What is your favourite food?</option>
									<option>What is your best friends name ?</option>
								</select>
							</div>
														<div class="form-group">
								<label for="exampleInputEmail1">Answer</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" style="border-radius: 10px"
									required name="ans">
							</div>
							

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									style="border-radius: 10px" required name="password"
									>
							</div>
														<div class="form-group">
								<label for="exampleInputPassword1">Confirm Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									style="border-radius: 10px" required name="cpassword"
									>
							</div>

							


							<div class="text-center">
								<button type="submit" class="btn btn-dark mt-2"
									style="border-radius: 10px">Save</button>
							</div>
							<div>
							Do you want to login ? <a href="login.jsp">Login</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>