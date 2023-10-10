package mycart_servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import mycart.FactoryProvider;
import mycart_dao.CategoryDao;
import mycart_dao.ProductDao;
import mycart_entities.Category;
import mycart_entities.Product;

/**
 * Servlet implementation class ProductOperationServlet
 */
@WebServlet("/ProductOperationServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		/*
		 * servlet 2: addcategory addproduct
		 */
		String op = request.getParameter("operation");
		if (op.trim().equals("addcategory")) {
			// Add category
			// fetching category data
			String tittle = request.getParameter("catTittle");
			String discription = request.getParameter("catDiscrption");
			Category cat = new Category();
			cat.setCategoryTittle(tittle);
			cat.setCategoryDiscription(discription);
			// category database save
			CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
			int catId = categorydao.saveCategory(cat);
			// out.print("Category saved" + catId);
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", " category added successfully:" + catId);
			response.sendRedirect("admin.jsp");
			return;

		} else if (op.trim().equals("addproduct")) {
			// add product
			String pName = request.getParameter("pName");
			String pDescrption = request.getParameter("pDescrption");

			int pPrice = Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
			int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
			int catId = Integer.parseInt(request.getParameter("catId"));

			Part part = request.getPart("pPic");

			Product p = new Product();

			p.setpName(pName);
			p.setpDesc(pDescrption);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			p.setpPhoto(part.getSubmittedFileName());
			// get category by id
			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			Category category = cdao.getCategoryById(catId);
			p.setCategory(category);

			// save product
			ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
			pdao.saveproduct(p);

			// pic upload
			// find out the path to upload photo

			String path = request.getRealPath("img") + File.separator + "products" + File.separator
					+ part.getSubmittedFileName();
			System.out.println(path);
			// uploading code...
		try {
				FileOutputStream fos = new FileOutputStream(path);

				InputStream is = part.getInputStream();
				// reading data
				byte[] data = new byte[is.available()];
				is.read(data);
				// writting the data
				fos.write(data);
				fos.close();
				is.close();
		}catch (Exception e) {
			e.printStackTrace();
		}

			// out.print("Product saved successfully");

			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", " product added successfully...");
			response.sendRedirect("admin.jsp");
			return;
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
