package dnastore.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dnastore.beans.Category;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;
 
@WebServlet(urlPatterns = { "/createProduct" })
@MultipartConfig(maxFileSize = 16177215) // upload file up to 16MB
public class ActionCreateProduct extends HttpServlet {
	private static final long serialVersionUID = -1623656324694499109L;
 
    public ActionCreateProduct() {
        super();
    }
 
    // Hiển thị trang tạo sản phẩm.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	Connection conn = MyUtils.getStoredConnection(request);
        String errorString = null;
        List<Category> list = null; 
        try {
            list = DBUtils.queryCategory(conn);
            
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        // Lưu thông tin vào request attribute trước khi forward sang views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("categoryList", list);
        
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/components/createProduct.jsp");
        dispatcher.forward(request, response);
       
    }
 
    // Khi người dùng nhập các thông tin sản phẩm, và nhấn Submit.
    // Phương thức này sẽ được gọi.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
 
        // gets values of text fields
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String categoryid = request.getParameter("categoryid");
        String note = request.getParameter("note");
        InputStream inputStream = null;

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("image");
        if (filePart != null) {
            // debug messages
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }

        String message = null; // message will be sent back to client
        try {
            // constructs SQL statement
            String sql = "INSERT INTO product (name, price, image, categoryid, note) values (?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, price);
            statement.setString(4, categoryid);
            statement.setString(5, note);
            

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(3, inputStream);
            }

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Image is uploaded successfully into the Database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        }
        // sets the message in request scope
        request.setAttribute("Message", message);

//        // forwards to the message page
//        getServletContext().getRequestDispatcher("/WEB-INF/components/products.jsp").forward(
//                request, response);
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/submit.jsp");
        dispatcher.forward(request, response);
       
    }
 
}
