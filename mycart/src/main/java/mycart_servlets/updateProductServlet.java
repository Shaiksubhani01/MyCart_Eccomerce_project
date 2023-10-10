package mycart_servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mycart.FactoryProvider;
import mycart_dao.ProductDao;

/**
 * Servlet implementation class updateProductServlet
 */
@WebServlet("/updateProductServlet")
public class updateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int pId = Integer.parseInt(request.getParameter("pId"));

		String pName = request.getParameter("pName");
		String pDesc = request.getParameter("pDesc");
		int pPrice = Integer.parseInt(request.getParameter("pPrice"));
		int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
		int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));

		ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
		int count = pdao.updateProdcutById(pName, pDesc, pPrice, pQuantity, pDiscount, pId);

		if (count == 0) {

			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", " product is not Updated..!");
			response.sendRedirect("view_products.jsp");
			return;

		} else {

			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", +count + ":product is updated sucessfully...!");
			response.sendRedirect("view_products.jsp");
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
