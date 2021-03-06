package dnastore.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
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
import dnastore.filter.SHA256Hash;
 
@WebServlet(urlPatterns = { "/dangnhap" })
public class PageLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public PageLogin() {
        super();
    }
 
    // Hiển thị trang Login.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
        // Forward tới trang /WEB-INF/views/loginView.jsp
        // (Người dùng không thể truy cập trực tiếp
        // vào các trang JSP đặt trong thư mục WEB-INF).
        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/PageLogin.jsp");
 
        dispatcher.forward(request, response);
 
    }
 
    // Khi người nhập userName & password, và nhấn Submit.
    // Phương thức này sẽ được thực thi.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
        String userName = request.getParameter("userName");
        String passwordStr = request.getParameter("password");
        String password = "";
        try {
        	password = SHA256Hash.toHexString(SHA256Hash.getSHA(passwordStr));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println("mahoa: "+ password);
        Account user = null;
        boolean hasError = false;
        String errorString = null;
 
        if (userName == null || password == null || userName.length() == 0 || password.length() == 0) {
            hasError = true;
            errorString = "Chưa nhập username hoặc password!";
        } else {
            Connection conn = MyUtils.getStoredConnection(request);
            try {
                // Tìm user trong DB.
                user = DBUtils.findUser(conn, userName, password);
 
                if (user == null) {
                    hasError = true;
                    errorString = "Username hoặc password không hợp lệ!";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                hasError = true;
                errorString = e.getMessage();
            }
        }
        // Trong trường hợp có lỗi,
        // forward (chuyển hướng) tới /WEB-INF/views/login.jsp
        if (hasError) {
            user = new Account();
            user.setUserName(userName);
            user.setPassword(password);
 
            // Lưu các thông tin vào request attribute trước khi forward.
            request.setAttribute("errorString", errorString);
            request.setAttribute("user", user);
 
            // Forward (Chuyển tiếp) tới trang /WEB-INF/views/login.jsp
            RequestDispatcher dispatcher //
                    = this.getServletContext().getRequestDispatcher("/PageLogin.jsp");
 
            dispatcher.forward(request, response);
        }
        // Trường hợp không có lỗi.
        // Lưu thông tin người dùng vào Session.
        // Và chuyển hướng sang trang userInfo.
        else {
//        	System.out.println("User Role: "+ user.getRoleid());
            HttpSession session = request.getSession();
            MyUtils.storeLoginedUser(session, user);
 
            if (user.getRoleid() == 1) {
            	response.sendRedirect(request.getContextPath() + "/quanly");
            }

            else if (user.getRoleid() == 2) {
            	response.sendRedirect(request.getContextPath() + "/nhanvien");
            }
            else{
            	response.sendRedirect(request.getContextPath() + "/trangchu");
            }
 
            // Redirect (Chuyển hướng) sang trang /userInfo.
            
        	
        }
    }
 
}
