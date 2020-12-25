package dnastore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
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
		doPost(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Connection conn = MyUtils.getStoredConnection(request);
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String code = request.getParameter("code");
		String command = request.getParameter("command");
		ArrayList<Long> listBuy = null;
		String url = "/PageCart.jsp";
		try {
			listBuy = (ArrayList<Long>) session.getAttribute("cartID");
			long idBuy = 0;
			int sl =1;
			if (request.getParameter("cartID") != null) {
				idBuy = Long.parseLong(request.getParameter("cartID"));
				sl = Integer.parseInt(request.getParameter("quantity"));
				System.out.println("so luong: "+sl);
				Product sp = DBUtils.findProduct(conn, code);
				switch (command) {
					case "Mua ngay":
						if (listBuy==null) {
							listBuy= new ArrayList<>();
							session.setAttribute("cartID", listBuy);
						}
						if (listBuy.indexOf(idBuy) == -1) {
							cart.addToCart(sp, sl);
							listBuy.add(idBuy);
						}
						url = "/PageCart.jsp";
						break;
					case "plus":
						if(listBuy == null) {
							listBuy= new ArrayList<>();
							session.setAttribute("cartID", listBuy);
						}
						if(listBuy.indexOf(idBuy) == -1) {
							cart.addToCart(sp, 1);
							listBuy.add(idBuy);
						}
						url = "/PageCart.jsp";
						break;
					case "sub":
						if(listBuy == null) {
							listBuy= new ArrayList<>();
							session.setAttribute("cartID", listBuy);
						}
						if(listBuy.indexOf(idBuy) == -1) {
							cart.subToCart(sp, 1);
							listBuy.add(idBuy);
						}
						url = "/PageCart.jsp";
						break;
					case "remove":
						cart.removeToCart(sp);
						url = "/PageCart.jsp";
						break;
					default:
						url = "/PageCart.jsp";
						break;
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/PageCart.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
    }

}
