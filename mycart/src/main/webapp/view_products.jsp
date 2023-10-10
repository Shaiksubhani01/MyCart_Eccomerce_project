<%@page import="mycart_entities.Users"%>
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

<%@ page import="mycart.FactoryProvider"%>
<%@ page import="mycart.Helper"%>
<%@page import="java.util.List"%>
<%@page import="mycart_dao.CategoryDao"%>
<%@page import="mycart_dao.ProductDao"%>
<%@page import="mycart_entities.Category"%>
<%@page import="mycart_entities.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin panel-products page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<h1></h1>
	<div class="container">
		<%@include file="components/message.jsp"%>

		<form action="DeleteProductServlet" method="post">
			<table class="table table-hover table-bordered text-center">
				<thead>
					<tr>
						<th scope="col">pId</th>
						<th scope="col">pName</th>
						<th scope="col">pDesc</th>
						<th scope="col">pPrice</th>
						<th scope="col">pDiscount</th>
						<th scope="col">pQuantity</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<%
				ProductDao dao = new ProductDao(FactoryProvider.getFactory());
				List<Product> list = dao.getAllProducts();
				%>



				<tbody>
					<tr>
						<%
						for (Product p : list) {
						%>
						<th scope="row"><%=p.getpId()%></th>
						<td><%=p.getpName()%></td>
						<td><%=p.getpDesc()%></td>
						<td><%=p.getpPrice()%></td>
						<td><%=p.getpDiscount()%>%</td>
						<td><%=p.getpQuantity()%></td>
						<td>
							<button type="button" class="btn btn-info ">
								<a href="editProduct.jsp?productId=<%=p.getpId()%>"
									class="text-white">Edit</a>
							</button>
							<br>
						<br>
							<button type="submit" value="<%=p.getpId()%>" name="pId"
								class="btn  btn-danger btn-sm">Delete</button>
						</td>
					</tr>

					<%
					}
					%>
				</tbody>
			</table>
		</form>
	</div>






	<%@include file="components/common_modals.jsp"%>
</body>
</html>