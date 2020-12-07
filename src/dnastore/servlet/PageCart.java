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
import dnastore.beans.*;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;
/**
 * Servlet implementation class PageCart
 */
@WebServlet("/giohang")
public class PageCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageCart() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
	       String errorString = null;
	       List<Product> list = null;
	       
	       try {
	           list = DBUtils.queryRandomProduct(conn);
	           
	       } catch (SQLException e) {
	           e.printStackTrace();
	           errorString = e.getMessage();
	       }
	       
	       // Lưu thông tin vào request attribute trước khi forward sang views.
	       request.setAttribute("errorString", errorString);
	       request.setAttribute("productList", list);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/PageCart.jsp");
		dispatcher.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String iAction = request.getParameter("action");

        if (iAction != null && !iAction.equals("")) {
            if (iAction.equals("Mua ngay")) {
                addToCart(request);
            } else if (iAction.equals("Sửa")) {
                updateCart(request);
            } else if (iAction.equals("X")) {
                deleteCart(request);
            }
        }
        response.sendRedirect("giohang");
	}
	protected void deleteCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        String iSTT = request.getParameter("stt");
        CartBean cartBean = null;

        Object iObject = session.getAttribute("cart");
        if (iObject != null) {
            cartBean = (CartBean) iObject;
        } else {
            cartBean = new CartBean();
        }
        cartBean.deleteCart(iSTT);
    }

    protected void updateCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        String iQuantity = request.getParameter("quantity");
        String iSTT = request.getParameter("stt");

        CartBean cartBean = null;

        Object objCartBean = session.getAttribute("cart");
        if (objCartBean != null) {
            cartBean = (CartBean) objCartBean;
        } else {
            cartBean = new CartBean();
        }
        cartBean.updateCart(iSTT, iQuantity);
    }

    protected void addToCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String iCode = request.getParameter("code");
        String iDescription = request.getParameter("name");
        String iPrice = request.getParameter("price");
        String iQuantity = request.getParameter("quantity");

        CartBean cartBean = null;

        Object objCartBean = session.getAttribute("cart");

        if (objCartBean != null) {
            cartBean = (CartBean) objCartBean;
        } else {
            cartBean = new CartBean();
            session.setAttribute("cart", cartBean);
        }

        cartBean.addCart(iCode, iDescription, iPrice, iQuantity);
    }

}
