package dnastore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import dnastore.beans.Order;
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
    	response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
    	Connection conn = MyUtils.getStoredConnection(request);
        HttpSession session = request.getSession();
        String errorString = null;
        List<Product> list = null;
        List<Product> listf = null;
        List<Product> listm = null;
        List<Category> listct = null;
        List<Account> listacc = null;
        List<Account> listuser = null;
        List<Account> listnewuser = null;
        List<Role> listr = null;
        List<Order> listod = null;
        List<Order> listods = null;
        List<Order> listodd = null;
        List<Order> listodw = null;
        Double total = 0.0 ;
        // Kiểm tra người dùng đã đăng nhập (login) chưa.
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
           list = DBUtils.queryAllProduct(conn);
           listm = DBUtils.queryProductMale(conn);
           listf = DBUtils.queryProductFemale(conn);
           listct = DBUtils.queryAllCategory(conn);
           listacc = DBUtils.queryAccount(conn);
           listuser = DBUtils.queryUser(conn);
           listnewuser = DBUtils.queryNewUser(conn);
           listr = DBUtils.queryRole(conn);
           listod = DBUtils.queryOrder(conn);
           listods = DBUtils.queryOrderSuccess(conn);
           listodd = DBUtils.queryOrderDelivery(conn);
           listodw = DBUtils.queryOrderWaiting(conn);
           
           String sql = "select sum(b.total_price-(b.total_price*b.coupon/100)) total "
           		+ "from orders a, order_details b where a.id= b.orders_id and a.status=2";
	           PreparedStatement pstm = conn.prepareStatement(sql);
	           ResultSet rs = pstm.executeQuery();
	           while(rs.next())
	           {
	        	   total = rs.getDouble(1);
	           }
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
        request.setAttribute("NewUserList", listnewuser);
        request.setAttribute("RoleList", listr);
        request.setAttribute("listod", listod);
        request.setAttribute("total", total);
        
        request.setAttribute("success", listods);
        request.setAttribute("delivery", listodd);
        request.setAttribute("waiting", listodw);
        System.out.println("tong tien:"+total);
        System.out.println("tata: "+listod.size());
        System.out.println("success: "+ listods.size());
        System.out.println("delivery: "+listodd.size());
        System.out.println("waiting: "+listodw.size());
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