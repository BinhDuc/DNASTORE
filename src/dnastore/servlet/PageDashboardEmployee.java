package dnastore.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import dnastore.beans.Account;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class DashboardNhanvien
 */
@WebServlet("/DashboardNhanvien")
public class PageDashboardEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageDashboardEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 
	        // Kiểm tra người dùng đã đăng nhập (login) chưa.
	        Account loginedUser = MyUtils.getLoginedUser(session);
	 
	        // Nếu chưa đăng nhập (login).
	        if (loginedUser == null) {
	            // Redirect (Chuyển hướng) tới trang login.
	            response.sendRedirect(request.getContextPath() + "/login");
	            return;
	        }
	        // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
	        request.setAttribute("user", loginedUser);
	 
	        // Nếu người dùng đã login thì forward (chuyển tiếp) tới trang
	        // /WEB-INF/views/userInfoView.jsp
	        RequestDispatcher dispatcher //
	                = this.getServletContext().getRequestDispatcher("/WEB-INF/components/dashboardE.jsp");
	        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
