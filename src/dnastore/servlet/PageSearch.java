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
 * Servlet implementation class PageSearch
 */
@WebServlet("/search")
public class PageSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageSearch() {
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
		String search = (String) request.getParameter("q");
		String q = '%' + search + '%';
		System.out.println("search: "+ q);
		String errorString = null;
		boolean hasError = false;
		List<Product> list = null;
		if(search == null || search.length() == 0) {
			hasError = true;
		}else {
			try {
	            list = DBUtils.searchProduct(conn, q);
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            hasError = true;
	            errorString = e.getMessage();
	        }
		}
		if (hasError) {
			response.sendRedirect(request.getContextPath() + "/trangchu");
        }else {
        	// Lưu thông tin vào request attribute trước khi forward sang views.
	        request.setAttribute("errorString", errorString);
	        request.setAttribute("productList", list);
	        request.setAttribute("search", search);
	        
	        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/PageSearch.jsp");
	        dispatcher.forward(request, response);
        }
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
