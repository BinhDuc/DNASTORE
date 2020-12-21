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
import dnastore.beans.Slide;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class PageCarousel
 */
@WebServlet("/carousel")
public class PageCarousel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageCarousel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
        HttpSession session = request.getSession();
        String errorString = null;
        List<Slide> listslide = null;
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
        	listslide = DBUtils.querySlide(conn);
        }catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
     // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
        request.setAttribute("errorString", errorString);
        request.setAttribute("user", loginedUser);
        request.setAttribute("slideList", listslide);
     // Nếu người dùng đã login thì forward (chuyển tiếp) tới trang
        // /WEB-INF/views/userInfoView.jsp
        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/PageCarousel.jsp");
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
