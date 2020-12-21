package dnastore.servlet;

import java.io.IOException;
import java.sql.Connection;

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
 * Servlet implementation class ActionCreateCategory
 */
@WebServlet("/createCategory")
public class ActionCreateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionCreateCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/CreateCategory.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		String categoryId = (String) request.getParameter("categoryId");
		String categoryname = (String) request.getParameter("categoryname");
		String subid = (String) request.getParameter("subid");
		Category category = new Category(categoryId,categoryname,subid);
		String errorString = null;
		try {
			DBUtils.insertCategory(conn, category);
		} catch (Exception e) {
			e.printStackTrace();
            errorString = e.getMessage();
		}
		request.setAttribute("errorString", errorString);
        request.setAttribute("category", category);
        if (errorString != null) {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/CreateCategory.jsp");
            dispatcher.forward(request, response);
        }
        // Nếu mọi thứ tốt đẹp.
        // Redirect (chuyển hướng) sang trang danh sách sản phẩm.
        else {
            response.sendRedirect(request.getContextPath() + "/quanly");
        }
	}

}
