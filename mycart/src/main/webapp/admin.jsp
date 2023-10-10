<%@page import="mycart.FactoryProvider"%>
<%@page import="mycart.Helper"%>
<%@page import="mycart_entities.Users"%>
<%@page import="mycart_entities.Product"%>
<%@page import="mycart_dao.CategoryDao"%>
<%@page import="mycart_entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="mycart_dao.userDao"%>
<%@page import="mycart_dao.ProductDao"%>
<%
Users user = (Users) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "Your Not Logged In !! LOGIN FIRST..");
	response.sendRedirect("login.jsp");
	return;
} else if (user.getUserType().equals("normal")) {
	session.setAttribute("message", "Your Not  ADMIN USER !! DO NOT ACCESS THESE PAGE..");
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
<title>Admin Panel..</title>

<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container admin">


		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp"%>
		</div>
		<div class="row mt-3">

			<!--first col-->
			<div class="col-md-4">
				<div class="card text-center border-primary mb-3" class="btn btn-outline-success" data-toggle="tooltip" data-placement="top" title="NO.OF USERS IN THIS WEBSITE..! ">

					<%  
//getting count
Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());

%>
					<div class="card-body border border-primary ">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid "
								src="img/group.png" alt="users_icon" />
						</div>
						<h1><%=m.get("usercount")%></h1>
						<h1 class="text-uppercase text-muted">Users</h1>


					</div>
				</div>



			</div>
			<%  

CategoryDao daoc=new CategoryDao(FactoryProvider.getFactory()); 
List<Category> listc=daoc.getCategories();

%>
			<!--second col-->
			<div class="col-md-4">
				<div class="card text-center border-primary mb-3" data-toggle="tooltip" data-placement="top" title="TOTAL CATEGORIES">
					<div class="card-body border border-primary">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid "
								src="img/list.png" alt="users_icon" />
						</div>
						<h1><%= listc.size() %></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>


					</div>
				</div>



			</div>
			<%
			//ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
			//List<Product> plist = pdao.getAllProducts();
             %>
			<!--third col-->
			<div class="col-md-4">
				<div class="card text-center border-primary mb-3" data-toggle="tooltip" data-placement="top" title="TOTAL NO.OF PRODUCTS">
					<div class="card-body border border-primary">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid "
								src="img/delivery-box.png" alt="users_icon">
						</div>
						<h1><%=m.get("productcount") %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>


					</div>
				</div>



			</div>
		</div>

		<!--second row -->
		<div class="row mt-3">

			<!--first col-->
			<div class="col-md-6">
				<div class="card text-center border-primary mb-3"
					data-toggle="modal" data-target="#add-category-modal">
					<div class="card-body border border-primary">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid "
								src="img/menu.png" alt="users_icon">
						</div>
						<p class="mt-2">click here to add new category</p>
						<!--  <h1 class="text-uppercase text-muted">add Category</h1>-->
						<button type="button" class="btn btn-primary">ADD
							CATEGORY</button>

					</div>
				</div>



			</div>
			<!--second col-->
			<div class="col-md-6">
				<div class="card text-center border-primary mb-3"
					data-toggle="modal" data-target="#add-product-modal">
					<div class="card-body border border-primary">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid "
								src="img/add.png" alt="users_icon">
						</div>
						<p class="mt-2">click here to add new product</p>
						<!--<h1 class="text-uppercase text-muted">add product</h1>-->
						<button type="button" class="btn btn-primary">ADD PRODUCT</button>

					</div>
				</div>



			</div>


		</div>
		
		<!--third row -->
		<div class="row mt-3">
       
			<!--first col-->
			<div class="col-md-12">
				<div class="card text-center border-primary mb-3">
					<div class="card-body border border-primary">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid "
								src="img/vision.png" alt="users_icon">
						</div>
						<p class="mt-2">click here to view all the products</p>
						<!--  <h1 class="text-uppercase text-muted">add Category</h1>-->
						<button type="button" class="btn btn-primary" onclick="window.location='view_products.jsp'">VIEW PRODUCTS</button>

					</div>
				</div>



			</div>
		
		</div>
		
	</div>
	<!--add category model-->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details....</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">


						<div class="form-group">
							<input type="text" class="form-control" name="catTittle"
								placeholder="Enter category tittle" required />
						</div>
						<div class="form-group">
							<textarea style="height: 300px" class="form-control"
								name="catDiscrption" placeholder="Enter category discription"
								required></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-success">Add
								Category</button>
							<button type="button" class="btn btn-outline-warning"
								data-dismiss="modal">Close</button>


						</div>
					</form>


				</div>
			</div>
		</div>
	</div>
	<!--end of add category model-->

	<!--add  product modal-->


	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						Details....</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addproduct">

						<div class="form-group">
							<input type="text" class="form-control" name="pName"
								placeholder="Enter Product Tittle" required />
						</div>
						<div class="form-group">
							<textarea style="height: 250px" class="form-control"
								name="pDescrption" placeholder="Enter product discription"
								required></textarea>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter Product price" required>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter Product Discount " required>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter Product Quantity " required>
						</div>
						<%  

						CategoryDao Cdao=new CategoryDao(FactoryProvider.getFactory()); 
						List<Category> list=Cdao.getCategories();
						
						%>



						<div class="form-group">
							<select name="catId" class="form-control" id="">
								<% 
							for(Category c:list){
							%>
								<option value="<%= c.getCategoryId()%>"><%= c.getCategoryTittle()%></option>
								<% }%>
							</select>
						</div>

						<div class="form-group">
							<label for="pPic">Upload Product image Here...</label> <br>
							<input type="file" id="pPic" name="pPic" required>
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-success">Add
								Product</button>
							<button type="button" class="btn btn-outline-warning"
								data-dismiss="modal">Close</button>


						</div>
					</form>


				</div>
			</div>
		</div>
	</div>
	<!--end of add product model-->
	<%@include file="components/common_modals.jsp"%>
	<script> 
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
	</script>
</body>
</html>