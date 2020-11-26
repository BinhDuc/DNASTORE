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
@WebServlet(urlPatterns = { "/home"})
public class HomeServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public HomeServlet() {
       super();
   }

 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
	   Connection conn = MyUtils.getStoredConnection(request);
	   
       String errorString = null;
       List<Product> list = null;
       
       
       try {
           list = DBUtils.queryNewProduct(conn);
           
           
       } catch (SQLException e) {
           e.printStackTrace();
           errorString = e.getMessage();
       }
       
       // Lưu thông tin vào request attribute trước khi forward sang views.
       request.setAttribute("errorString", errorString);
       request.setAttribute("productList", list);
       
       // Forward toi trang /WEB-INF/views/homeView.jsp
       // (Người dùng không bao giờ truy cập trực tiếp được vào các trang JSP
       // đặt trong WEB-INF)
       RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/components/home.jsp");
        
       dispatcher.forward(request, response);
        
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}
