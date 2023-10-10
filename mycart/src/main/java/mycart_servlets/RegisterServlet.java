package mycart_servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import mycart.FactoryProvider;
import mycart_entities.Users;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();

			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");

			// validations
			if (userName.isEmpty()) {
				out.println("Name is empty");
				return;
			}
		
			// creating user object to store data
			Users user = new Users(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");
            
			Session hibernateSession = FactoryProvider.getFactory().openSession();
			Transaction tx =  hibernateSession.beginTransaction();
			int userId = (int) hibernateSession.save(user);
			tx.commit();
			hibernateSession.close();

			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("message","Registration Successfull UserId Is "+userId);
			response.sendRedirect("register.jsp");
		}

		catch (Exception e) {
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("ucv","Email-Id Already Existed !!!");
			response.sendRedirect("register.jsp");
		}

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
