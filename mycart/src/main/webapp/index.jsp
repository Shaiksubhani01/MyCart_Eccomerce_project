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
<title>MyCart-home</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row mt-3 mx-2">
			<%
			String cat = request.getParameter("category");
			//out.println(cat);
			ProductDao dao = new ProductDao(FactoryProvider.getFactory());
			List<Product> list = null;
			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();

			} else {

				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);
			}

			//List<Product> list = dao.getAllProducts();
			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			%>
			<!--show categories-->
			<div class="col-md-2">
				<div class="list-group mt-4 text-center" style="width: 300px;">
					<a
						class="list-group-item list-group-item-action font-weight-bold text-white custom-bg"
						style="font-style:italic;">MyCart <h5>(Categories)</h5></a> 
						
						<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action   font-weight-bold "
						style="border-color: #007bff;"> ALL PRODUCTS </a>

					<%
					for (Category c : clist) {
					%>


					<a href="index.jsp?category=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action  text-uppercase font-weight-bold "
						style="border-color: #007bff;"><%=c.getCategoryTittle()%></a>


					<%
					}
					%>
				</div>
			</div>

			<!--show produts-->
			<div class="col-md-10">

				<div class="row mt-4">
					<div class="col-md-12">
						<div class="card-columns">
							<!--traversing products-->

							<%
							for (Product p : list) {
							%>

							<div class="card">
								<div class="container text-center">
									<img class="card-img-top mt-2"
										src="img/products/<%=p.getpPhoto()%>"
										style="max-height: 200pc; max-width: 100%; width: auto;"
										alt="Card image cap">
									<div class="card-body">
										<h5 class="card-title"><%=p.getpName()%></h5>
										<p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
									</div>
									<div class="card-footer" style="background-color: white;">
										<button type="button" class="btn btn-primary"
											style="font-size: 20px;" onclick="add_to_cart(<%=p.getpId() %>,'<%=p.getpName()%>',<%=p.gettingPriceAfterApplyingDiscount() %>,<%=p.getpQuantity() %>)">Add To Cart</button>
										<button type="button" class="btn btn-success"
											style="font-size: 20px;">
											&#x20B9
											<%=p.gettingPriceAfterApplyingDiscount()%>/- <span
												style="font-size: 15px; font-style: italic;">(
												&#x20B9 <%=p.getpPrice()%> - <%=p.getpDiscount()%>% off )
											</span>
										</button>
									</div>
								</div>
							</div>




							<%
							}

							if (list.size() == 0) {
							out.println("<h3>NO ITEMS IN THIS CATEGORY</h3>");
							}
							%>




						</div>
					</div>
				</div>












			</div>
		</div>
	</div>
	<%@include file="components/common_modals.jsp"%>
</body>
</html>