<%@page import="mycart_entities.Users" %>
<%
Users user=(Users)session.getAttribute("current-user");
if(user==null){
	session.setAttribute("message","Your Not Logged In !! LOGIN FIRST TO ACCESS CHECKOUT PAGE");
	response.sendRedirect("login.jsp");
	return;
}

%>







<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>checkout</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">

		<div class="row mt-5">

			<div class="col-md-6">
				<!--card-->
				<div class="card" style="width:auto; ">
					<div class="card-header custom-bg text-white">
						<h3 class="text-center">Your Selected Items</h3>
					</div>
					<div class="card-body border border-primary" style="width:auto; ">

						<div class="cart-body" style="width:auto;">
						</div>

					</div>

				</div>

			</div>

			<div class="col-md-6">
				<!-- form details -->

				<div class="container">
					<div class="card">

						<div class="card-header custom-bg text-white">
							<h3 class="text-center">Fill Your Details For Order</h3>
						</div>

						<div class="card-body border border-primary">
							<form>
								<div class="form-group">
									<label for="name">Name</label> <input  value="<%=user.getUserName() %>"type="text"
										class="form-control" id="name" aria-describedby="emailHelp"
										placeholder="Enter Name" required>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input value="<%=user.getUserEmail()%>"
										type="email" class="form-control" id="email"
										aria-describedby="emailHelp" placeholder="Enter email"
										required>
								</div>
								<div class="form-group">
									<label for="name">Phone Number</label> <input value="<%=user.getUserPhone() %>"
										type="number" class="form-control" id="phoneNumber"
										aria-describedby="emailHelp" placeholder="Enter Phone Number"
										required>
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Shipping Address</label>
									<textarea value="<%=user.getUserAddress()%>" style="height: 300px" class="form-control"
										name="shippingAddress" placeholder="Enter Shipping Address"
										required></textarea>
								</div>
							</form>
							<div class="card-footer  text-center"
								style="background-color: white; border-top-color: white;">
								<button type="button" class="btn btn-success">Order Now</button>
								<button type="button" class="btn btn-primary" onclick="goToHomePage()">Continue Shopping</button>


							</div>
						</div>
					</div>
				</div>
			</div>




		</div>







	</div>




	<%@include file="components/common_modals.jsp"%>
</body>
</html>