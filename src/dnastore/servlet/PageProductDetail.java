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
import dnastore.beans.Product;

import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet(urlPatterns = {"/product"})
public class PageProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageProductDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		 
        String code = (String) request.getParameter("code");
        Product product = null;
        String errorString = null;
//        HttpSession session = request.getSession();
        List<Product> list = null;
//        ArrayList<Cart> arrCart = new ArrayList<Cart>();
        try {
            product = DBUtils.findProduct(conn, code);
            list = DBUtils.queryRandomProduct(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
 
        // Không có lỗi.
        // Sản phẩm không tồn tại.
        // Redirect sang trang danh sách sản phẩm.
        if (errorString != null && product == null) {
            response.sendRedirect(request.getServletPath() + "/trangchu");
            return;
        }
 
        // Lưu thông tin vào request attribute trước khi forward sang views.
//        session.setAttribute("cart", arrCart);
//        response.sendRedirect("/WEB-INF/components/cart.jsp");
        request.setAttribute("errorString", errorString);
        request.setAttribute("product", product);
        request.setAttribute("productList", list);
 
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/PageProductDetail.jsp");
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
