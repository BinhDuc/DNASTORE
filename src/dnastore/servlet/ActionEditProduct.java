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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dnastore.beans.Account;
import dnastore.beans.Category;
import dnastore.beans.Product;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class ActionEditProduct
 */
@WebServlet("/editProduct")
@MultipartConfig(maxFileSize = 16177215) // upload file up to 16MB
public class ActionEditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionEditProduct() {
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
        if (loginedUser == null || loginedUser.getRoleid() != 1) {
            // Redirect (Chuyển hướng) tới trang login.
            response.sendRedirect(request.getContextPath() + "/dangnhap");
            return;
        }
        // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
        request.setAttribute("user", loginedUser);
        String code = (String) request.getParameter("code");
        String subid = (String) request.getParameter("subid");
        Product product = null;
        List<Category> list = null;
        String errorString = null;
        try {
        	product = DBUtils.findProduct(conn, code);
            list = DBUtils.queryCategory(conn, subid);
            
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
     // Lưu thông tin vào request attribute trước khi forward sang views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("product", product);
        request.setAttribute("categoryList", list);
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/EditProduct.jsp");
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
		String code = request.getParameter("code");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
        String categoryid = request.getParameter("categoryid");
        String note = request.getParameter("note");
        String quantity = request.getParameter("quantity");
        InputStream inputStream = null;
        Part filePart = request.getPart("image");
        if (filePart != null) {
            // debug messages
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        String message = null;
        try {
            // constructs SQL statement
            String sql = "Update product set name=?, price =?, discount=?, image=?, categoryid=?, note=?, quantity=? "
            		+ "where code=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, name);
            statement.setString(2, price);
            statement.setString(3, discount);
            statement.setString(5, categoryid);
            statement.setString(6, note);
            statement.setString(7, quantity);
            statement.setString(8, code);
            

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(4, inputStream);
            }

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


        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/EditProduct.jsp");
        dispatcher.forward(request, response);
	}

}
