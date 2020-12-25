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
import dnastore.beans.Category;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class ActionUpdateCategory
 */
@WebServlet("/editCategory")
public class ActionEditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionEditCategory() {
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
        if (loginedUser == null || loginedUser.getRoleid() != 1) {
            // Redirect (Chuyển hướng) tới trang login.
            response.sendRedirect(request.getContextPath() + "/dangnhap");
            return;
        }
        // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
        request.setAttribute("user", loginedUser);
        String categoryId = (String) request.getParameter("categoryId");
        Category Category = null;
        String errorString = null;
        try {
        	Category = DBUtils.findCategory(conn, categoryId);
            
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
     // Lưu thông tin vào request attribute trước khi forward sang views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("category", Category);
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/EditCategory.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Connection conn = MyUtils.getStoredConnection(request);
		// gets values of text fields
		String categoryId = request.getParameter("categoryId");
        String categoryname = request.getParameter("categoryname");
        String subid = request.getParameter("subid");
        
        Category category = new Category(categoryId, categoryname, subid);
        String error =null;
        try {
			DBUtils.updateCategory(conn, category);
		} catch (Exception e) {
			e.printStackTrace();
			error = e.getMessage();
		}
        request.setAttribute("errorString", error);
        if (error != null) {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/EditCategory.jsp");
            dispatcher.forward(request, response);
        }
        else {
            response.sendRedirect(request.getContextPath() + "/quanly");
        }
	}

}
