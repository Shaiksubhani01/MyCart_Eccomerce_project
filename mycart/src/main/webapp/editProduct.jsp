
<%
int pId = Integer.parseInt(request.getParameter("productId"));
// System.out.prinln(pId);
ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
List<Product> list = pdao.fetchProductById(pId);
%>


<%@page import="mycart.FactoryProvider"%>
<%@page import="mycart_entities.Product"%>
<%@page import="mycart_dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin panel-editProductPage</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>	
 <%@include file="components/navbar.jsp"%>
 
<h1 style="color: black; text-align: center">EDIT PRODUCT</h1>

 

	<form action="updateProductServlet" method="post">
  
		<table align="center" bgcolor="cyan" border="1" style="border-color:white">
			<%
			for (Product p : list) {
			%>
			<tr>
				<td>Product Id::</td>
				<td><input name="pId" value="<%=p.getpId()%>" readonly="true" /></td>
			</tr>

			<tr>
				<td>Product Name::</td>
				<td><input value="<%=p.getpName()%>" type="text" name="pName" /></td>
			</tr>

			<tr>
				<td>Product Discription::</td>
				<td><input value="<%=p.getpDesc()%>" type="text" name="pDesc" /></td>
			</tr>

			<tr>
				<td>Product Price::</td>
				<td><input value="<%=p.getpPrice()%>" type="number"
					name="pPrice" /></td>
			</tr>

			<tr>
				<td>Product Quantity::</td>
				<td><input value="<%=p.getpQuantity()%>" type="number"
					name="pQuantity" /></td>
			</tr>

			<tr>
				<td>Product Discount::</td>
				<td><input value="<%=p.getpDiscount()%>" type="number"
					name="pDiscount" /></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-success">UPDATE</td>
				<td><button type="submit" class="btn btn-danger" onclick="goToview_products()">CANCEL</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			
		</table>
	</form>
	
<%@include file="components/common_modals.jsp"%>
</body>
</html>