package dnastore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import dnastore.beans.Account;
import dnastore.beans.Order;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class DashboardNhanvien
 */
@WebServlet("/nhanvien")
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Connection conn = MyUtils.getStoredConnection(request);
		 HttpSession session = request.getSession();
		 
	        // Kiểm tra người dùng đã đăng nhập (login) chưa.
	        Account loginedUser = MyUtils.getLoginedUser(session);
	 
	        // Nếu chưa đăng nhập (login).
	        if (loginedUser == null || loginedUser.getRoleid() != 2) {
	            // Redirect (Chuyển hướng) tới trang login.
	            response.sendRedirect(request.getContextPath() + "/dangnhap");
	            return;
	        }
	        System.out.print(loginedUser.getRoleid());
	        List<Order> listod = null;
	        List<Order> listods = null;
	        List<Order> listodd = null;
	        List<Order> listodw = null;
	        String errorString = null;
	        try {
	        	listod = DBUtils.queryOrder(conn);
	            listods = DBUtils.queryOrderSuccess(conn);
	            listodd = DBUtils.queryOrderDelivery(conn);
	            listodw = DBUtils.queryOrderWaiting(conn);
               
	        } catch (SQLException e) {
	            e.printStackTrace();
	            errorString = e.getMessage();
	        }
	        // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
	        
	        request.setAttribute("user", loginedUser);
	        request.setAttribute("errorString", errorString);
	        request.setAttribute("listod", listod);
	        request.setAttribute("success", listods);
	        request.setAttribute("delivery", listodd);
	        request.setAttribute("waiting", listodw);
	        // Nếu người dùng đã login thì forward (chuyển tiếp) tới trang
	        // /WEB-INF/views/userInfoView.jsp
	        RequestDispatcher dispatcher //
	                = this.getServletContext().getRequestDispatcher("/PageDashboardEmployee.jsp");
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
