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
import mycart_dao.userDao;
import mycart_entities.Users;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		userDao userdao = new userDao(FactoryProvider.getFactory());
		Users user = userdao.getUserByEmailAndPassword(email, password);

		// System.out.println(user);

		HttpSession httpSession = request.getSession();

		if (user == null)

		{
			// out.println("<h1> INVALID DETAILS </h1>");
			httpSession.setAttribute("message", "INVALID DETAILS..! Try With Another one");
			response.sendRedirect("login.jsp");
			return;

		} else {
			out.println("<h1> WELCOME " + user.getUserName() + "</h1>");

			// LOGIN
			httpSession.setAttribute("current-user", user);

			if (user.getUserType().equals("admin")) {
				// admin:admin.jsp
				response.sendRedirect("admin.jsp");

			} else if (user.getUserType().equals("normal")) {
				// normal:normal.jsp
				response.sendRedirect("normal.jsp");

			} else {

				out.println("WE HAVE NOT IDENTIFIED USER TYPE");
			}

		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
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
