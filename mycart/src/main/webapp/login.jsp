<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login-MyCart</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container mt-5">	

				
		<div class="row mt-3">
			<div class="col-md-6 offset-md-3">


				<div class="card">
					<div class="card-header  custom-bg text-white text-center">
                       <h1>MyCart</h1>
					<p>MyCart online shopping</p>

					</div>
					<div class="card-body  border border-primary">
					<h2 class="text-center font-weight-bold">Login Here</h2>
					<%@include file="components/message.jsp"%>
					
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>
							<a href="register.jsp" class="text-center d-block mb-2">If you
								not registered click here...!</a>
							<div class="container  text-center">

								<button type="submit" class="btn btn-outline-success ">Submit</button>
								<button type="reset" class="btn btn-outline-warning ">Reset</button>
							</div>
						</form>
					</div>



				</div>

			</div>

		</div>
	</div>

</body>
</html>