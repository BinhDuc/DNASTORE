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
import dnastore.beans.Role;
import dnastore.beans.Category;
import dnastore.beans.Product;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;
 
@WebServlet(urlPatterns = { "/quanly" })
public class PageDashboardManager extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public PageDashboardManager() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	Connection conn = MyUtils.getStoredConnection(request);
        HttpSession session = request.getSession();
        String errorString = null;
        List<Product> list = null;
        List<Product> listf = null;
        List<Product> listm = null;
        List<Category> listct = null;
        List<Account> listacc = null;
        List<Account> listuser = null;
        List<Role> listr = null;
 
        // Kiểm tra người dùng đã đăng nhập (login) chưa.
        Account loginedUser = MyUtils.getLoginedUser(session);
 
        // Nếu chưa đăng nhập (login).
        if (loginedUser == null) {
            // Redirect (Chuyển hướng) tới trang login.
            response.sendRedirect(request.getContextPath() + "/dangnhap");
            return;
        }
        try {
           list = DBUtils.queryProduct(conn);
           listm = DBUtils.queryProductMale(conn);
           listf = DBUtils.queryProductFemale(conn);
           listct = DBUtils.queryAllCategory(conn);
           listacc = DBUtils.queryAccount(conn);
           listuser = DBUtils.queryUser(conn);
           listr = DBUtils.queryRole(conn);
           
           
       } catch (SQLException e) {
           e.printStackTrace();
           errorString = e.getMessage();
       }
        // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
        request.setAttribute("errorString", errorString);
        request.setAttribute("user", loginedUser);
        request.setAttribute("productList", list);
        request.setAttribute("productListf", listf);
        request.setAttribute("productListm", listm);
        request.setAttribute("CategoryList", listct);
        request.setAttribute("AccountList", listacc);
        request.setAttribute("UserList", listuser);
        request.setAttribute("RoleList", listr);
        // Nếu người dùng đã login thì forward (chuyển tiếp) tới trang
        // /WEB-INF/views/userInfoView.jsp
        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/PageDashboardManager.jsp");
        dispatcher.forward(request, response);
 
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
 
}