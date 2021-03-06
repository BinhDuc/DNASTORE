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
import dnastore.beans.Doanhthutheongay;
import dnastore.beans.Doanhthutheothang;
import dnastore.beans.Slide;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class PageDoanhThu
 */
@WebServlet("/doanhThu")
public class PageDoanhThu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageDoanhThu() {
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
        String errorString = null;
        List<Doanhthutheongay> listday = null;
        List<Doanhthutheothang> listmonth = null;
        Account loginedUser = MyUtils.getLoginedUser(session);
        
        // Nếu chưa đăng nhập (login).
        if (loginedUser == null) {
            
            response.sendRedirect(request.getContextPath() + "/dangnhap");
            return;
        }else if(loginedUser.getRoleid() != 1){
        	// Redirect (Chuyển hướng) tới trang login.
        	System.out.println("User Role: "+loginedUser.getRoleid());
        	response.sendRedirect(request.getContextPath() + "/dangnhap");
            return;
        }
        try {
        	listday = DBUtils.queryDoanhthuday(conn);
        	listmonth = DBUtils.queryDoanhthuMonth(conn);
        }catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
     // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
        request.setAttribute("errorString", errorString);
        request.setAttribute("user", loginedUser);
        request.setAttribute("listday", listday);
        request.setAttribute("listmonth", listmonth);
        System.out.println(listday);
     // Nếu người dùng đã login thì forward (chuyển tiếp) tới trang
        // /WEB-INF/views/userInfoView.jsp
        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/PageDoanhThu.jsp");
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
