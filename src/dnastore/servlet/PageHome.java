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
@WebServlet(urlPatterns = { "/trangchu"})
public class PageHome extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public PageHome() {
       super();
   }

 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
	   Connection conn = MyUtils.getStoredConnection(request);
	   
       String errorString = null;
       List<Product> list = null;
       List<Product> listf = null;
       List<Product> listm = null;
       List<Product> lista = null;
       
       try {
           list = DBUtils.queryNewProduct(conn);
           listf = DBUtils.queryProductFemale(conn);
           listm = DBUtils.queryProductMale(conn);
           lista = DBUtils.queryProduct(conn);
       } catch (SQLException e) {
           e.printStackTrace();
           errorString = e.getMessage();
       }
       
       // Lưu thông tin vào request attribute trước khi forward sang views.
       request.setAttribute("errorString", errorString);
       request.setAttribute("productList", list);
       request.setAttribute("productListf", listf);
       request.setAttribute("productListm", listm);
       request.setAttribute("productLista", lista);
       
       // Forward toi trang /WEB-INF/views/homeView.jsp
       // (Người dùng không bao giờ truy cập trực tiếp được vào các trang JSP
       // đặt trong WEB-INF)
       RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/PageHome.jsp");
        
       dispatcher.forward(request, response);
        
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}
