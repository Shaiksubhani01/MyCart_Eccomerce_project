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
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int pId = Integer.parseInt(request.getParameter("pId"));
		// out.println(pId);

		ProductDao pdao = new ProductDao(FactoryProvider.getFactory());

		int result = pdao.deleteProductBypID(pId);
		if (result == 0) {

			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", " product is not deleted...!");
			response.sendRedirect("view_products.jsp");
			return;

		} else {

			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", +result + ":product is deleted sucessfully...!");
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
