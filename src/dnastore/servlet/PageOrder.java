package dnastore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dnastore.beans.Account;
import dnastore.beans.CartBean;
import dnastore.beans.CartItemBean;
import dnastore.beans.Order;
import dnastore.beans.Product;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class PageOrder
 */
@WebServlet("/checkout")
public class PageOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/PageOrder.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		 
        // gets values of text fields
        String customer = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String payment = request.getParameter("payment");
        String username = request.getParameter("username");
        HttpSession sesion = request.getSession();
        CartBean cart = (CartBean) sesion.getAttribute("cart");
        System.out.println("cart"+sesion);
        System.out.println("cart"+customer);
        
        try {
			Date orderdate = new Date();
			String id = "" + orderdate.getTime();
			int status = 0;
			Account account = new Account();
			account.setUserName(username);
			Order order = new Order(id, account, address, payment, new Timestamp(new Date().getTime()), status, customer, phone);
			order.setId(id);
			DBUtils.insertOrder(conn, order);
			ArrayList<CartBean> list = cart.getList();
	        
		} catch (Exception e) {
			// TODO: handle exception
		}
        
        
        
	}

}
