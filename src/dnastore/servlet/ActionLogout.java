package dnastore.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class logout
 */
@WebServlet("/logout")
public class ActionLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionLogout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        if (session != null) {
            session.removeAttribute("loginedUser");
             
            RequestDispatcher dispatcher =  this.getServletContext().getRequestDispatcher("/PageLogin.jsp");
            dispatcher.forward(request, response);
        }
	}
}
