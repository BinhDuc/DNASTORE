package dnastore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dnastore.beans.Account;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class ActionDeleteUser
 */
@WebServlet("/deleteUser")
public class ActionDeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionDeleteUser() {
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
		Account loginedUser = MyUtils.getLoginedUser(session);
		// Nếu chưa đăng nhập (login).
        if (loginedUser == null  || loginedUser.getRoleid() != 1) {
            // Redirect (Chuyển hướng) tới trang login.
            response.sendRedirect(request.getContextPath() + "/dangnhap");
            return;
        }
        // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
        request.setAttribute("user", loginedUser);
        String userName = (String) request.getParameter("userName");
        String errorString = null;
 
        try {
            DBUtils.deleteUser(conn, userName);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        } 
         
        // Nếu có lỗi, forward (chuyển tiếp) sang trang thông báo lỗi.
        if (errorString != null) {
            // Lưu thông tin vào request attribute trước khi forward sang views.
            request.setAttribute("errorString", errorString);
            // 
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/EditUser.jsp");
            dispatcher.forward(request, response);
        }
        // Nếu mọi thứ tốt đẹp.
        // Redirect (chuyển hướng) sang trang danh sách sản phẩm.
        else {
            response.sendRedirect(request.getContextPath() + "/quanly");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
