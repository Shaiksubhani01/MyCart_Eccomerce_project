
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="ISO-8859-1">
<title>New User</title>

<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>


	<div class="container-fluid">

		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">

				<div class="card  border-primary">
                     <div class="card-header text-center text-white custom-bg">
                     <h1>MyCart</h1>
					<p>MyCart online shopping</p>
                     
                     </div>
					<%@include file="components/message.jsp"%>

					<div class="card-body px-5" >


						<h2 class="text-center font-weight-bold ">REGISTER HERE</h2>

						<form action="RegisterServlet" method="post">

							<div class="form-group">
								<label for="name">User Name</label> <input name="user_name"
									type="text" class="form-control" id="name"
									placeholder="Enter User Name Here" aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="email">User Email</label> <input name="user_email"
									type="email" class="form-control" id="email"
									placeholder="Enter Email Here" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="password">User Password</label> <input
									name="user_password" type="password" class="form-control"
									id="password" placeholder="Enter Password Here"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="phone">User Phone Number</label> <input
									name="user_phone" type="number" class="form-control" id="phone"
									placeholder="Enter Phone Number Here"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="address">User Address</label>
								<textarea name="user_address" style="height: 200px;"
									class="form-control" placeholder="Enter Your Address"></textarea>
							</div>

							<div class="container text-center">
								<button class="btn btn-outline-success">Register</button>
								<button class="btn btn-outline-warning">Reset</button>
							</div>
						</form>

					</div>
				</div>

			</div>
		</div>
	</div>
</body>

</html>
