package dnastore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
import dnastore.beans.OrderDetail;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class ActionComfirmOrder
 */
@WebServlet("/comfirmOrder")
public class ActionComfirmOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionComfirmOrder() {
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
        if (loginedUser == null || loginedUser.getRoleid() == 3) {
            // Redirect (Chuyển hướng) tới trang login.
            response.sendRedirect(request.getContextPath() + "/dangnhap");
            return;
        }
        String orders_id = (String) request.getParameter("orders_id");
        String errorString = null;
        OrderDetail orderdetail = null;
        List<OrderDetail> list = null;
        try {
        	orderdetail = DBUtils.findOrder(conn, orders_id);
            list = DBUtils.queryOrderDetail(conn, orders_id);
        	
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
        request.setAttribute("user", loginedUser);
        request.setAttribute("errorString", errorString);
        request.setAttribute("orderdetail", orderdetail);
        request.setAttribute("list", list);
        request.setAttribute("orders_id", orders_id);
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/ComfirmOrder.jsp");
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
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String payment = request.getParameter("payment");
		String status = request.getParameter("status");
		String strRoleid = request.getParameter("roleid");
		int roleid = Integer.parseInt(strRoleid);
		String message = null;
		try {
            // constructs SQL statement
            String sql = "Update orders set customer=?, phone =?, order_address=?, payment=?, status=? "
            		+ "where id=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, name);
            statement.setString(2, phone);
            statement.setString(3, address);
            statement.setString(4, payment);
            statement.setString(5, status);
            statement.setString(6, id);
           

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Sửa thành công";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        }
        // sets the message in request scope
        request.setAttribute("Message", message);
        if(roleid == 1) {
	        RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/quanly");
	        dispatcher.forward(request, response);
        }else if(roleid == 2) {
        	RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/nhanvien");
            dispatcher.forward(request, response);
        }else {
        	RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/trangchu");
            dispatcher.forward(request, response);
        }
	}

}
